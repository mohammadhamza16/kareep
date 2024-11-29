import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kareeb/helper/main_view.dart';
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff2fbdff),
              Color(0xffff7582),
            ],
          ),
        ),
        child: Stack(
          children: [
            const Center(
              child: Text(
                'Kareeb',
                style: TextStyle(fontFamily: 'Poppinis', fontSize: 42),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/islamic.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
