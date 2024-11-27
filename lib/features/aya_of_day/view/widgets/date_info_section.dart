import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:kareeb/features/home/view/widgets/date_info_row.dart';
import 'package:kareeb/features/home/view/widgets/day_name.dart';

class DateInfoSection extends StatelessWidget {
  const DateInfoSection({
    super.key,
    required this.miladi,
    required this.hijri,
    required this.monthName,
  });

  final DateTime miladi;
  final HijriCalendar hijri;
  final String Function(int) monthName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DayName(weekday: miladi.weekday),
          const SizedBox(height: 20),
          DateInfoRow(
            title: "Hijri Date: ",
            date: hijri.toFormat("dd MMMM yyyy"),
          ),
          const SizedBox(height: 10),
          DateInfoRow(
            title: "Miladi Date: ",
            date: "${miladi.day} ${monthName(miladi.month)} ${miladi.year}",
          ),
        ],
      ),
    );
  }
}
