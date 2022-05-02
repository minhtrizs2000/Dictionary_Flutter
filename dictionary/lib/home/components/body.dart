import 'package:dictionary/home/components/fragments/home_fragment.dart';
import 'package:dictionary/home/components/homeheader.dart';
import 'package:dictionary/home/components/navigationdrawer.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var selectIndex = 0;
  var flag = true;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: HomeHeader(),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: const SingleChildScrollView(
          child: HomeDetail(),
        )
      ),
    );
  }
}