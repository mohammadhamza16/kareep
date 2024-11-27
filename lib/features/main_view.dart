import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:kareeb/features/audio/view/audio_view.dart';
import 'package:kareeb/features/home/view/home_view.dart';
import 'package:kareeb/features/prayer/view/prayer_view.dart';
import 'package:kareeb/features/quran/view/quran_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int index = 0;
  List<Widget> views = [
    const HomeView(),
    const PrayerView(),
    const QuranView(),
    const AudioView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[index],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(
            icon: Image.asset('assets/images/home.png'),
            title: 'Home',
          ),
          TabItem(
            icon: Image.asset('assets/images/holyQuran.png'),
            title: 'Quran',
          ),
          TabItem(
            icon: Image.asset('assets/images/mosque.png'),
            title: 'Prayer',
          ),
          TabItem(
            icon: Image.asset('assets/images/audio.png'),
            title: 'Audio',
          ),
        ],
        initialActiveIndex: 0,
        onTap: updateIndex,
      ),
    );
  }

  void updateIndex(updatedindex) {
    setState(
      () {
        index = updatedindex;
      },
    );
  }
}
