import 'package:dictionary/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SplashPage extends StatelessWidget {
  static String routeName = "/splash";

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (Route<dynamic> route) => false);
    });

    return Scaffold(
      body: SizedBox(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              color: Color(0xFFE9F1FC)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
                backgroundColor: Color(0xFFE9F1FC),
                strokeWidth: 5,
                valueColor:AlwaysStoppedAnimation<Color>(Color(0xFF2A367E)),
              ),
              SizedBox(height: 5,),
              Text('Loading...', style: TextStyle(color: Color(0xFF2A367E), fontWeight: FontWeight.bold, fontSize: 18),)
            ],
          ) ,),
      ),
    );
  }
}
