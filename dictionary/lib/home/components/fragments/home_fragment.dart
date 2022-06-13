import 'package:dictionary/history/historypage.dart';
import 'package:dictionary/home/homepage.dart';
import 'package:dictionary/paragraph/paragraphpage.dart';
import 'package:dictionary/translate/translatepage.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class HomeDetail extends StatefulWidget {
  const HomeDetail({Key? key}) : super(key: key);

  @override
  State<HomeDetail> createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {

  Widget buildItem({
    required String text,
    required String routeName,
    required IconData icon,
  }){
    const color = Colors.white;

    return ElevatedButton.icon(
      icon: Icon(
        icon,
        color: color,
        size: 24,
      ),
      label: Text(
        text,
        style: const TextStyle(fontSize: 22, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        alignment: Alignment.centerLeft,
        primary: Colors.cyan,
        minimumSize: const Size.fromHeight(60), // NEW
      ),
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }

  @override
  // Widget build(BuildContext context) {
  //   return Container(
  //       padding: const EdgeInsets.all(20),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           const SizedBox(height: 20,),
  //           buildItem(text: 'Tra từ', routeName: TranslatePage.routeName, icon: Icons.bookmark),
  //           const SizedBox(height: 20,),
  //           buildItem(text: 'Dịch văn bản', routeName: ParagraphPage.routeName, icon: Icons.file_copy_rounded),
  //           const SizedBox(height: 20,),
  //           buildItem(text: 'Lịch sử tra từ', routeName: HistoryPage.routeName, icon: Icons.settings_backup_restore),
  //           const SizedBox(height: 20,),
  //           buildItem(text: 'Từ đánh dấu', routeName: '', icon: Icons.stars_rounded),
  //           const SizedBox(height: 20,),
  //           buildItem(text: 'Video ứng dụng', routeName: '', icon: Icons.play_circle_fill_outlined),
  //         ],
  //       )
  //   );
  // }
  Widget build(BuildContext context){
    return const SearchResultsListView(
      searchHistory: null,
    );
  }
}

class SearchResultsListView extends StatelessWidget{
  final String? searchHistory;

  const SearchResultsListView({
    Key? key,
    required this.searchHistory,
}) : super(key: key);

  @override
  Widget build(BuildContext context){
    if(searchHistory == null){
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search, size: 64,),
            Text("Start searching", style: Theme.of(context).textTheme.headline5,)
          ],
        ),
      );
    }

    final fsb = FloatingSearchBar.of(context);

    return ListView(
      padding: EdgeInsets.only(top: fsb.height + fsb.margins.vertical),
      children: List.generate(50, (index) => ListTile(
        title: Text('$searchHistory'),
        subtitle: Text(index.toString()),
      )),
    );
  }
}
