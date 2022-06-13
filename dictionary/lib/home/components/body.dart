import 'package:dictionary/home/components/fragments/home_fragment.dart';
import 'package:dictionary/home/components/homeheader.dart';
import 'package:dictionary/home/components/navigationdrawer.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var selectIndex = 0;
  var flag = true;

  // add search history
  static const historyLength = 5;
  List<String> _searchHistory = ["a","b","c","d","new item"];

  late List<String> filteredSearchHistory;
  late String selectedHistory;

  List<String> filterSearchHistory({String? filter,}) {
    if(filter != null && filter.isNotEmpty){
      return _searchHistory.reversed
          .where((term)=>term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchHistory(String history){
    if(_searchHistory.contains(history)){
      putSearchHistoryFirst(history);
      return;
    }
    _searchHistory.add(history);
    if(_searchHistory.length > historyLength){
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }
    filteredSearchHistory = filterSearchHistory(filter: null);
  }

  void deleteSearchHistory(String history){
    _searchHistory.removeWhere((element) => element == history);
    filteredSearchHistory = filterSearchHistory(filter: null);
  }

  void putSearchHistoryFirst(String history){
    deleteSearchHistory(history);
    addSearchHistory(history);
  }

  late FloatingSearchBarController controller;

  @override
  void initState(){
    super.initState();
    filteredSearchHistory = filterSearchHistory(filter: null);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        body: FloatingSearchBar(
          controller: controller,
          body: const HomeDetail(),
          transition: CircularFloatingSearchBarTransition(),
          physics: BouncingScrollPhysics(),
          title: Text(selectedHistory ?? 'Dictionary', style: Theme.of(context).textTheme.headline6,),
          hint: 'Search and find out...',
          actions: [
            FloatingSearchBarAction.searchToClear(),
          ],
          onQueryChanged: (query) {
            setState((){
              filteredSearchHistory = filterSearchHistory(filter: query);
            });
          },
          onSubmitted: (query) {
            setState((){
              addSearchHistory(query);
              selectedHistory = query;
            });
            controller.close();
          },
          builder: (context, transition){
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: Colors.white,
                elevation: 4,
                child: Builder(
                  builder: (context) {
                    if(filteredSearchHistory.isEmpty && controller.query.isEmpty){
                      return Container(
                        height: 56,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          'Start Searching',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      );
                    } else if(filteredSearchHistory.isEmpty){
                      return ListTile(
                        title: Text(controller.query),
                        leading: const Icon(Icons.search),
                        onTap: (){
                          setState((){
                            addSearchHistory(controller.query);
                            selectedHistory = controller.query;
                          });
                          controller.close();
                        },
                      );
                    }else{
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: filteredSearchHistory.map((history) => ListTile(
                          title: Text(history, maxLines: 1, overflow: TextOverflow.ellipsis,),
                          leading: const Icon(Icons.history),
                          trailing: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: (){
                              setState((){
                                deleteSearchHistory(history);
                              });
                            },
                          ),
                          onTap: (){
                            setState((){
                              putSearchHistoryFirst(history);
                              selectedHistory = history;
                            });
                            controller.close();
                          },
                        ),
                        ).toList(),
                      );
                    }
                  },
                ),
              ),
            );
          },
        )
      ),
    );
  }
}