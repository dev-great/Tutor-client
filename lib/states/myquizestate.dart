import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:tutor/models/myquizzesmodel.dart';

class MyQuizeState with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  List<MyQuizes> _myquizes = [];
  Future<bool> getMyQuize() async {
    var token = storage.getItem('token');
    try {
      http.Response response = await http.get(
          Uri.parse("http://192.168.43.196:8000/quiz/my-quizzes/"),
          headers: {'Authorization': "token $token"});
      var data = json.decode(response.body) as List;
      // print(data);
      List<MyQuizes> temp = [];
      for (var element in data) {
        MyQuizes myquizes = MyQuizes.fromJson(element);
        temp.add(myquizes);
      }
      _myquizes = temp;
      notifyListeners();
      return true;
    } catch (e) {
      print("e getMyQuize");
      print(e);
      return false;
    }
  }

  List<MyQuizes> get myquizes {
    return [..._myquizes];
  }
}
