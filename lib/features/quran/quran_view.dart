import 'package:flutter/material.dart';
import 'package:kareeb/features/aya_of_day/services/get_aya_of_the_day_service.dart';
import 'package:kareeb/features/quran/surah_feature/view/surah_view.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  final GetAyaOfTheDayService apiService = GetAyaOfTheDayService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 239, 207, 245),
            title: const Text(
              'Quran',
            ),
            centerTitle: true,
            bottom: const TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    'Surah',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Sajda',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Juz',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              SurahView(),
              const Center(child: Text('Sajda Section')),
              const Center(child: Text('Juz Section')),
            ],
          ),
        ),
      ),
    );
  }
}
