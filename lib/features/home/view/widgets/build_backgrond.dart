import 'package:flutter/material.dart';

class BuildBackground extends StatelessWidget {
  const BuildBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: .8,
          fit: BoxFit.cover,
          image: AssetImage('assets/images/background_img.jpg'),
        ),
      ),
    );
  }
}
