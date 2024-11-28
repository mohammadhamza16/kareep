class JuzAyahs {
  final int? ayahNumber;
  final String ayahsText;
  final String surahName;

  JuzAyahs({
    required this.ayahNumber,
    required this.ayahsText,
    required this.surahName,
  });

  factory JuzAyahs.fromJson(Map<String, dynamic> json) {
    return JuzAyahs(
      ayahNumber: json['number'] ?? 0,
      ayahsText: json['text'],
      surahName: json['surah']['name'],
    );
  }
}
