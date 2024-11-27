import 'package:flutter/material.dart';

class DayName extends StatelessWidget {
  final int weekday;

  const DayName({super.key, required this.weekday});

  @override
  Widget build(BuildContext context) {
    return Text(
      _dayName(weekday),
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  String _dayName(int weekday) {
    const days = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ];
    return days[weekday - 1];
  }
}
