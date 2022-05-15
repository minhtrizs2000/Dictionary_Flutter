import 'package:dictionary/history/historypage.dart';
import 'package:dictionary/home/homepage.dart';
import 'package:dictionary/paragraph/paragraphpage.dart';
import 'package:dictionary/translate/translatepage.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextField(
            //   decoration: InputDecoration(
            //       prefixIcon: const Icon(Icons.search),
            //       border: const OutlineInputBorder(),
            //       hintText: 'Tra từ Anh-Việt, Việt-Anh',
            //       suffix: GestureDetector(
            //         onTap: (){},
            //         child: const Icon(Icons.mic_outlined,color: Colors.grey,),
            //       )
            //   ),
            // ),
            const SizedBox(height: 20,),
            buildItem(text: 'Tra từ', routeName: TranslatePage.routeName, icon: Icons.bookmark),
            const SizedBox(height: 20,),
            buildItem(text: 'Dịch văn bản', routeName: ParagraphPage.routeName, icon: Icons.file_copy_rounded),
            const SizedBox(height: 20,),
            buildItem(text: 'Lịch sử tra từ', routeName: HistoryPage.routeName, icon: Icons.settings_backup_restore),
            const SizedBox(height: 20,),
            buildItem(text: 'Từ đánh dấu', routeName: '', icon: Icons.stars_rounded),
            const SizedBox(height: 20,),
            buildItem(text: 'Video ứng dụng', routeName: '', icon: Icons.play_circle_fill_outlined),
          ],
        )
    );
  }
}
