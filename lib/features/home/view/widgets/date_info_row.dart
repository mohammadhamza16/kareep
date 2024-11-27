import 'package:flutter/material.dart';

class DateInfoRow extends StatelessWidget {
  final String title;
  final String date;

  // ignore: use_key_in_widget_constructors
  const DateInfoRow({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 18, color: Colors.white),
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          TextSpan(
            text: date,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
