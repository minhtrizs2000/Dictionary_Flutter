import 'package:dictionary/history/components/fragments/history_fragment.dart';
import 'package:dictionary/history/components/historyheader.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: HistoryHeader(),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: const SingleChildScrollView(
            child: HistoryDetail(),
          )
      ),
    );
  }
}


