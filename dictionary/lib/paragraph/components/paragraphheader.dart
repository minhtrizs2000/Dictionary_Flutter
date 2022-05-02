import 'package:flutter/material.dart';

class ParagraphHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Text(
            'Dịch văn bản',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            textAlign: TextAlign.left,
          ),
        )
      ],
    );
  }
}
