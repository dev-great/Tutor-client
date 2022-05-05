// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class UserState with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  Future<bool> loginNow(String uname, String passw) async {
    try {
      http.Response response = await http.post(
          Uri.parse("http://192.168.43.196:8000/account/login/"),
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({"username": uname, "password": passw}));
      var data = json.decode(response.body) as Map;

      if (data.containsKey("token")) {
        storage.setItem("token", data['token']);
        print(storage.getItem('token'));
        return true;
      }
      return false;
    } catch (e) {
      print("e loginNow");
      print(e);
      return false;
    }
  }

  Future<bool> registernow(
    String uname,
    String passw,
    String email,
  ) async {
    try {
      http.Response response = await http.post(
          Uri.parse("http://192.168.43.196:8000/account/register/"),
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({
            "username": uname,
            "password": passw,
            "email": email,
          }));
      var data = json.decode(response.body) as Map;
      print(data);
      if (data["error"] == false) {
        return true;
      }
      return false;
    } catch (e) {
      print("e loginNow");
      print(e);
      return false;
    }
  }

  Future<bool> changePassword(String oldP, String newP) async {
    var token = storage.getItem('token');

    var headers = {
      'Authorization': "token $token",
      "Content-Type": "application/json",
    };
    var request = http.MultipartRequest(
        'PUT', Uri.parse('http://192.168.43.196:8000/account/changepassword/'));
    request.fields.addAll({'old_password': oldP, 'new_password': newP});
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
