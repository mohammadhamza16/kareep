import 'package:kareeb/features/qrui/model/qari_model.dart';
import 'package:kareeb/helper/api.dart';

class QariService {
  Future<List<QariModel>> getQariList(Api api) async {
    List<QariModel> qariList = [];
    final url = 'https://quranicaudio.com/api/qaris';

    try {
      final data = await api.getDataFromAPI(url: url);

      if (data is List) {
        data.forEach((element) {
          if (qariList.length < 20) {
            final qari = QariModel.fromJson(element);
            if (qari.name != null) {
              qariList.add(qari);
            }
          }
        });

        qariList.sort((a, b) => a.name!.compareTo(b.name!));
      } else {
        throw FormatException('Expected a List, but got: $data');
      }
    } catch (e) {
      print('Error fetching Qari list: $e');
      rethrow;
    }

    return qariList;
  }
}