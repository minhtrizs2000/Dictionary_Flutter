import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
            child: Text(
              'Từ điển',
              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              textAlign: TextAlign.left,
            ),
        )
      ],
    );
    // return Row(
    //   children: [
    //     const Expanded(
    //       child: TextField(
    //         decoration: InputDecoration(
    //             filled: true,
    //             fillColor: Colors.white,
    //             hintText: "Search product",
    //             prefixIcon: Icon(Icons.search)
    //         ),
    //       ),
    //     ),
    //     GestureDetector(
    //       onTap: (){
    //         // Navigator.pushNamed(context, CartPage.routeName);
    //       },
    //       child: Container(
    //           height: 40,
    //           width: 40,
    //           padding: const EdgeInsets.all(10),
    //           child: const Icon(Icons.mic_outlined,size: 30,color: Colors.black,)),
    //     )
    //   ],
    // );
  }
}
