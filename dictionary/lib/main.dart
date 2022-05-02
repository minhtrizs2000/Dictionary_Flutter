import 'package:dictionary/home/homepage.dart';
import 'package:dictionary/routes.dart';
import 'package:dictionary/splashpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: SplashPage.routeName,
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const HomePage(),
    );
  }
}