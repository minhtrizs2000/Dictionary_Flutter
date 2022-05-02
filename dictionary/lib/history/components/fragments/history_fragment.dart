import 'package:flutter/material.dart';

class HistoryDetail extends StatelessWidget {
  const HistoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(8.0),
      color: Colors.white,
      child: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            const ListTile(
              title: Text('Dog'),
            ),
            const ListTile(
              title: Text('Cat'),
            ),
            const ListTile(
              title: Text('Rabbit'),
            ),
            const ListTile(
              title: Text('Rabbit'),
            ),
            const ListTile(
              title: Text('Rabbit'),
            ),
          ],
        ).toList(),
      ),
    );
  }
}
