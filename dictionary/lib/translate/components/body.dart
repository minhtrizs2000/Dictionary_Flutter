import 'package:dictionary/translate/components/fragments/translate_fragment.dart';
import 'package:dictionary/translate/components/translateheader.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: TranslatehHeader(),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: TranslateDetail()
      ),
    );
  }
}