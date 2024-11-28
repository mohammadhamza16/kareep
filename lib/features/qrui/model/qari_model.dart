// ignore_for_file: public_member_api_docs, sort_constructors_first
class QariModel {
  final String? name;
  final String? path;
  final String? format;
  QariModel({
    required this.name,
    required this.path,
    required this.format,
  });
  factory QariModel.fromJson(Map<String, dynamic> json) {
    return QariModel(
        name: json['name'],
        path: json['relativepath'],
        format: json['file_format']);
  }
}
