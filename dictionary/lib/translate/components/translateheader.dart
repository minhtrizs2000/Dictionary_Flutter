import 'package:flutter/material.dart';

class TranslatehHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Text(
            'Tra từ',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            textAlign: TextAlign.left,
          ),
        )
      ],
    );
  }
}
