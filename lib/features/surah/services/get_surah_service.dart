import 'package:kareeb/features/surah/model/surah_model.dart';
import 'package:kareeb/helper/api.dart';

class GetSurahService {
  Future<List<SurahModel>> surahService() async {
    var data = await Api().getDataFromAPI(
      url: 'http://api.alquran.cloud/v1/surah',
    );
    return (data['data'] as List)
        .map((json) => SurahModel.fromJson(json))
        .toList();
  }
}
