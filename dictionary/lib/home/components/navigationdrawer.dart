import 'package:dictionary/history/historypage.dart';
import 'package:dictionary/home/homepage.dart';
import 'package:dictionary/paragraph/paragraphpage.dart';
import 'package:dictionary/translate/translatepage.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {

  Widget buildMenuItem({
    required String text,
    required String routeName,
    required IconData icon,
  }){
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon,color: color,),
      title: Text(text, style: const TextStyle(fontSize: 24,color: Colors.white)),
      hoverColor: hoverColor,
      onTap: (){
        Navigator.pop(context);
        Navigator.pushNamed(context, routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.cyan,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 100,),
            buildMenuItem(
              text: 'Trang chủ',
              routeName: HomePage.routeName,
              icon: Icons.home_filled,
            ),
            buildMenuItem(
              text: 'Tra từ',
              routeName: TranslatePage.routeName,
              icon: Icons.bookmark,
            ),
            buildMenuItem(
              text: 'Dịch văn bản',
              routeName: ParagraphPage.routeName,
              icon: Icons.file_copy_rounded,
            ),
            buildMenuItem(
              text: 'Lịch sử tra từ',
              routeName: HistoryPage.routeName,
              icon: Icons.settings_backup_restore,
            ),
            buildMenuItem(
              text: 'Từ đánh dấu',
              routeName: "",
              icon: Icons.stars_rounded,
            ),
            buildMenuItem(
              text: 'Video ứng dụng',
              routeName: "",
              icon: Icons.play_circle_fill_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
