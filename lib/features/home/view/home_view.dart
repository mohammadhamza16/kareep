import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:kareeb/features/home/view/widgets/build_backgrond.dart';
import 'package:kareeb/features/home/view/widgets/date_info_row.dart';
import 'package:kareeb/features/home/view/widgets/day_name.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final HijriCalendar hijri = HijriCalendar.now();
    final DateTime miladi = DateTime.now();
    final Size sizeOfScreen = MediaQuery.of(context).size;
    HijriCalendar.setLocal('ar');

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: sizeOfScreen.height * 0.25,
              child: Stack(
                children: [
                  const BuildBackground(),
                  Padding(
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
                          date:
                              "${miladi.day} ${_monthName(miladi.month)} ${miladi.year}",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: const Center(
                  child: Text(
                    "Welcome to Kareeb App",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return months[month - 1];
  }
}
