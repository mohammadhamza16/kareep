import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kareeb/features/main_view.dart';
import 'package:kareeb/features/onboarding/view/onboarding_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

bool alreadyUsed = false;
void getData() async {
  final prefs = await SharedPreferences.getInstance();
  alreadyUsed = prefs.getBool('alreadyUsed') ?? false;
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    getData();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return alreadyUsed ? const MainView() : const OnBoardingView();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/islamic.png',
          ),
          const Center(
            child: Text(
              'Kareeb',
            ),
          )
        ],
      ),
    );
  }
}
