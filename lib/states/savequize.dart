// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;

class SaveAnsState with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  Future<bool> patchSaveAns(
      String quizetaker, String question, String answer) async {
    var token = storage.getItem('token');

    var headers = {
      'Authorization': "token $token",
      "Content-Type": "application/json",
    };
    var request = http.MultipartRequest(
        'PATCH', Uri.parse('http://192.168.43.196:8000/quiz/save/'));
    request.fields.addAll(
        {'quiztaker': quizetaker, 'question': question, 'answer': answer});

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
