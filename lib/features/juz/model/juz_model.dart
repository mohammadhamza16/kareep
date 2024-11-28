import 'package:kareeb/features/juz/model/juz_ayahs.dart';

class JuzModel {
  final int? juzNumber;
  final List<JuzAyahs> juzAyahs;

  JuzModel({
    required this.juzNumber,
    required this.juzAyahs,
  });

  factory JuzModel.fromJson(Map<String, dynamic> json) {
    var juzAyahs = json['data']['ayahs'];
    List<JuzAyahs> juzAyahsList =
        juzAyahs.map<JuzAyahs>((e) => JuzAyahs.fromJson(e)).toList();

    return JuzModel(
      juzNumber: json['data']['numbers'] ?? 0,
      juzAyahs: juzAyahsList,
    );
  }
}
