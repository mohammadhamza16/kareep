import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kareeb/features/onboarding/view/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingView(),
        ),
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
