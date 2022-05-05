import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:tutor/models/quizemodel.dart';

class QuizState with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  List<Quizes> _quizes = [];
  Future<bool> getQuizes() async {
    var token = storage.getItem('token');
    try {
      http.Response response = await http.get(
          Uri.parse("http://192.168.43.196:8000/quiz/quizzes/"),
          headers: {'Authorization': "token $token"});
      var data = json.decode(response.body) as List;
      // print(data);
      List<Quizes> temp = [];
      for (var element in data) {
        Quizes quizes = Quizes.fromJson(element);
        temp.add(quizes);
      }
      _quizes = temp;
      notifyListeners();
      return true;
    } catch (e) {
      print("e getQuizes");
      print(e);
      return false;
    }
  }

  List<Quizes> get quizes {
    return [..._quizes];
  }
}
