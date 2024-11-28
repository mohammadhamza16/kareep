import 'package:kareeb/features/juz/model/juz_model.dart';
import 'package:kareeb/helper/api.dart';

class JuzService {
  Future<JuzModel> getJuzz(int index) async {
    var data = await Api().getDataFromAPI(
        url: 'http://api.alquran.cloud/v1/juz/$index/ar.alafasy');
    return JuzModel.fromJson(data);
  }
}
