import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:kareeb/features/aya_of_day/model/aya_of_the_day_model.dart';
import 'package:kareeb/features/aya_of_day/services/get_aya_of_the_day_service.dart';
import 'package:kareeb/features/aya_of_day/view/aya_of_the_day_body.dart';
import 'package:kareeb/features/home/view/widgets/build_backgrond.dart';
import 'package:kareeb/features/home/view/widgets/date_info_row.dart';
import 'package:kareeb/features/home/view/widgets/day_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<AyaOfTheDayModel> _ayaFuture;
  void setData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('alreadyUsed', true);
  }

  @override
  void initState() {
    super.initState();
    _ayaFuture = GetAyaOfTheDayService().ayaofTheDayService();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    final HijriCalendar hijri = HijriCalendar.now();
    final DateTime miladi = DateTime.now();
    final Size sizeOfScreen = MediaQuery.of(context).size;
    HijriCalendar.setLocal('ar');

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 187, 233, 255),
                Color.fromARGB(255, 255, 185, 192),
              ],
            ),
          ),
          child: Column(
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: FutureBuilder<AyaOfTheDayModel>(
                      future: _ayaFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'Error: ${snapshot.error}',
                              style: const TextStyle(color: Colors.red),
                            ),
                          );
                        } else if (!snapshot.hasData) {
                          return const Center(
                            child: Text('No data available.'),
                          );
                        } else {
                          final data = snapshot.data!;
                          return AyaOfTheDayBody(data: data);
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
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
