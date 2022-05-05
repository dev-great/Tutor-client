// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:tutor/models/teachermodel.dart';

class TutorState with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  List<Teacher> _tutor = [];
  Future<bool> getTutor() async {
    var token = storage.getItem('token');
    try {
      http.Response response = await http.get(
          Uri.parse("http://192.168.43.196:8000/tutorial/teacher/"),
          headers: {'Authorization': "token $token"});
      var data = json.decode(response.body) as List;
      // print(data);
      List<Teacher> temp = [];
      for (var element in data) {
        Teacher tutor = Teacher.fromJson(element);
        temp.add(tutor);
      }
      _tutor = temp;
      notifyListeners();
      return true;
    } catch (e) {
      print("e getFeeds");
      print(e);
      return false;
    }
  }

  List<Teacher> get tutor {
    return [..._tutor];
  }
}
