import 'package:dictionary/models/DBHelper.dart';
import 'package:dictionary/models/modelsDictionary.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../models/modelsAPI.dart';

class TranslateDetail extends StatefulWidget {
  const TranslateDetail({Key? key}) : super(key: key);

  @override
  State<TranslateDetail> createState() => _TranslateDetailState();
}

class _TranslateDetailState extends State<TranslateDetail> {
  final textTranslate = TextEditingController();
  late Future<ResponeApi>? futureResponeApi = null;
  late Future<Sentence> futureSentence;

  late Future<List<vaModel>>? vamodel = null;
  late Future<List<avModel>>? avmodel = null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            controller: textTranslate,
            decoration: const InputDecoration(
              labelText: 'Enter text to translate',
              hintText: 'Enter text to translate',
              iconColor: Colors.white30,
            ),
            onChanged: (String text) {
              print('Text changed to: $text');
            },
          ),
        ),

        Row(
          //button cho dịch Việt-Anh
          children:<Widget>[ Container(
            padding: const EdgeInsets.all(30),
            child: RaisedButton(
              child: const Text('Việt-Anh'),
              onPressed: () async {
                final db = DBHelper();
                await db.init();

                final av = db.getWord(textTranslate.text);
                setState((){
                  avmodel = Future.value(av);
                });

              },
            ),
          ),

            //button cho dịch Anh-Việt
            Container(
              padding: const EdgeInsets.all(30),
              child: RaisedButton(
                child: const Text('Anh-Việt'),
                onPressed: () async {
                  final response = await http.get(Uri.parse(
                      ('https://api.tracau.vn/WBBcwnwQpV89/s/${textTranslate.text}/en')));

                  if (response.statusCode == 200) {
                    var responeApi = ResponeApi.fromJson(json.decode(response.body));

                    setState(() {
                      futureResponeApi = Future.value(responeApi);
                    });

                    Expanded(
                      child: futureResponeApi == null
                          ? Container()
                          : FutureBuilder<ResponeApi>(
                        future: futureResponeApi,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data!.sentences.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text.rich(
                                    TextSpan(
                                      // text:
                                      //    '${snapshot.data!.sentences[index].fields.vi}',
                                      children: [
                                        for (var item in snapshot.data!
                                            .sentences[index].fields.vi
                                            .split(' '))
                                          if (item.contains('<em>'))
                                            TextSpan(
                                              text:
                                              '${item.replaceAll('<em>', '').replaceAll('</em>', '')} ',
                                              style: const TextStyle(
                                                color: Colors.blue,
                                              ),
                                            ),
                                      ],
                                    ),
                                  ),

                                  //  title: Text(snapshot.data!.sentences[index].fields.vi),
                                  subtitle: Text(snapshot
                                      .data!.sentences[index].fields.en),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }

                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      ),
                    );
                  } else {
                    return showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Alert'),
                            content: Text(
                                'Failed to connect API server. Error: ${response.statusCode}'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  return Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        });
                  }
                },
              ),

            )
          ],

        ),
        Expanded(
          child: futureResponeApi == null
              ? Container()
              : FutureBuilder<ResponeApi>(
            future: futureResponeApi,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.sentences.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text.rich(
                        TextSpan(
                          // text:
                          children: [
                            for (var item in snapshot
                                .data!.sentences[index].fields.en
                                .split(' '))
                              if (item.contains('<em>')) ...[
                                TextSpan(
                                  text:
                                  '${item.replaceAll('<em>', '').replaceAll('</em>', '')} ',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ] else
                                ...[
                                  TextSpan(
                                    text: '$item ',
                                  ),
                                ],
                          ],
                        ),
                      ),

                      subtitle: Text.rich(
                        TextSpan(
                          // text:
                          children: [
                            for (var item in snapshot
                                .data!.sentences[index].fields.vi
                                .split(' '))
                              if (item.contains('<em>')) ...[
                                TextSpan(
                                  text:
                                  '${item.replaceAll('<em>', '').replaceAll('</em>', '')} ',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ] else
                                ...[
                                  TextSpan(
                                    text: '$item ',
                                  ),
                                ],
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ],
    );
  }
}
