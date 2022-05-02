import 'package:dictionary/paragraph/components/fragments/paragraph_fragment.dart';
import 'package:dictionary/paragraph/components/paragraphheader.dart';
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
            title: ParagraphHeader(),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: ParagraphDetail()
      ),
    );
  }
}