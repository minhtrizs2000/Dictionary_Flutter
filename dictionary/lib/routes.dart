import 'package:dictionary/history/historypage.dart';
import 'package:dictionary/home/homepage.dart';
import 'package:dictionary/paragraph/paragraphpage.dart';
import 'package:dictionary/splashpage.dart';
import 'package:flutter/widgets.dart';


final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName : (context) => const SplashPage(),
  HomePage.routeName : (context) => const HomePage(),
  HistoryPage.routeName : (context) => const HistoryPage(),
  ParagraphPage.routeName : (context) => const ParagraphPage(),
};