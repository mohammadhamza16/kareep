class SurahTranslationList {
  final List<SurahTranslation> translationList;

  SurahTranslationList({required this.translationList});

  factory SurahTranslationList.fromJson(Map<String, dynamic> map) {
    Iterable translation = map['result'];
    List<SurahTranslation> list =
        translation.map((e) => SurahTranslation.fromJson(e)).toList();

    return SurahTranslationList(translationList: list);
  }
}

class SurahTranslation {
  String? sura;
  String? aya;
  String? arabicText;
  String? translation;

  SurahTranslation({
    this.sura,
    this.aya,
    this.arabicText,
    this.translation,
  });

  factory SurahTranslation.fromJson(Map<String, dynamic> map) {
    return SurahTranslation(
      sura: map['sura'] as String?,
      aya: map['aya'] as String?,
      arabicText: map['arabic_text'] as String?,
      translation: map['translation'] as String?,
    );
  }
}
