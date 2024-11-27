class AyaOfTheDayModel {
  final String ayaInArabic;
  final String ayaEnglishTranslation;
  final String suraEnlishName;
  final int suraNumber;

  AyaOfTheDayModel({
    required this.ayaInArabic,
    required this.ayaEnglishTranslation,
    required this.suraEnlishName,
    required this.suraNumber,
  });
  factory AyaOfTheDayModel.fromJson(Map<String, dynamic> json) {
    return AyaOfTheDayModel(
      ayaInArabic: json['data'][0]['text'],
      ayaEnglishTranslation: json['data'][2]['text'],
      suraEnlishName: json['data'][2]['surah']['englishName'],
      suraNumber: json['data'][2]['numberInSurah'],
    );
  }
}
