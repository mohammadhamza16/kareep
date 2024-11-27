import 'package:flutter/material.dart';
import 'package:kareeb/features/aya_of_day/model/aya_of_the_day_model.dart';

class AyaOfTheDayBody extends StatelessWidget {
  const AyaOfTheDayBody({
    super.key,
    required this.data,
  });

  final AyaOfTheDayModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 1,
              offset: Offset(
                0,
                1,
              ),
            ),
          ]),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              children: [
                const Text(
                  'Quran Aya of the Day',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: .5,
                ),
                Text(
                  textAlign: TextAlign.center,
                  data.ayaInArabic,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  data.ayaEnglishTranslation,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <InlineSpan>[
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data.suraNumber.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data.suraEnlishName,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
