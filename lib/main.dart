import 'package:flutter/material.dart';
import 'package:kareeb/features/splash/veiw/splash_view.dart';

void main() {
  runApp(Kareep());
}

class Kareep extends StatelessWidget {
  const Kareep({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashView(),
    );
  }
}
