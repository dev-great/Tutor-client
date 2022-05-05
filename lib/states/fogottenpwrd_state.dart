// ignore_for_file: avoid_print
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FogottenPwrd with ChangeNotifier {
  Future<bool> forgottenPwrd(
    String email,
  ) async {
    var headers = {
      "Content-Type": "application/json",
    };
    var request = http.MultipartRequest('POST',
        Uri.parse('http://192.168.43.196:8000/account/password_reset/'));
    request.fields.addAll({'email': email});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
