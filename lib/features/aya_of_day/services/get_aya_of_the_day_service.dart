import 'dart:math';

import 'package:kareeb/features/aya_of_day/model/aya_of_the_day_model.dart';
import 'package:kareeb/helper/api.dart';

class GetAyaOfTheDayService {
  Future<AyaOfTheDayModel> ayaofTheDayService() async {
    var data = await Api().getDataFromAPI(
      url:
          'https://api.alquran.cloud/v1/ayah/${generateRandomNumber(1, 6237)}/editions/quran-uthmani,en.asad,en.pickthall',
    );
    return AyaOfTheDayModel.fromJson(data);
  }

  int generateRandomNumber(int min, int max) {
    final random = Random();
    return random.nextInt(max - min + 1) + min;
  }
}
