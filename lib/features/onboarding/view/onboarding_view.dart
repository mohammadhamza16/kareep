import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kareeb/features/home/view/home_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageviewItem(
            title: 'Read Quran',
            bodyText:
                'Immerse yourself in the beauty of the Quran. Start reading daily to find peace and guidance.',
            image: 'assets/images/holyQuran.png',
          ),
          PageviewItem(
            title: 'Build Better Habits',
            bodyText:
                'Cultivate habits that lead to personal growth and a meaningful life.',
            image: 'assets/images/zakat.png',
          ),
          PageviewItem(
            title: 'Prayer Alert',
            bodyText:
                'Stay on top of your daily prayers with timely reminders and notifications.',
            image: 'assets/images/prayer.png',
          ),
        ],
        showNextButton: true,
        next: const Icon(Icons.arrow_forward),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w500)),
        onDone: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ),
          );
        },
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Theme.of(context).colorScheme.secondary,
          color: Colors.grey,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    );
  }

  PageViewModel PageviewItem(
      {required String title,
      required String bodyText,
      required String image}) {
    return PageViewModel(
      title: title,
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              bodyText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      image: Center(child: Image.asset(image)),
    );
  }
}
