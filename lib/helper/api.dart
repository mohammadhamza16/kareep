import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> getDataFromAPI({required String url, String? token}) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(
      Uri.parse(url),
      headers: header,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is Exception with status code ${response.statusCode}');
    }
  }

  Future<dynamic> postData(
      {required String url, String? token, dynamic body}) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(
        Uri.parse(
          url,
        ),
        body: body,
        headers: header);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is Exception with status code ${response.statusCode} wiht body ${response.body}');
    }
  }

  Future<dynamic> putData(
      {required String url, String? token, dynamic body}) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.put(
        Uri.parse(
          url,
        ),
        body: body,
        headers: header);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is Exception with status code ${response.statusCode} wiht body ${response.body}');
    }
  }
}
