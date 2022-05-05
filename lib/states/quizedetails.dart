// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:tutor/models/quizdetailmodel.dart';

class QuizeDetailState with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  List<QuizDetails> _details = [];

  Future<bool> getQuizDetails(slug) async {
    var token = storage.getItem('token');
    try {
      http.Response response = await http.get(
          Uri.parse("http://192.168.43.196:8000/quiz/quizzes/$slug/"),
          headers: {'Authorization': "token $token"});

      List<QuizDetails> temp = [];
      QuizDetails tutorial = QuizDetails.fromJson(jsonDecode(response.body));
      print(tutorial.quiz!.questionSet);
      temp.add(tutorial);
      _details = temp;
      notifyListeners();
      print(_details);
      return false;
    } catch (e) {
      print("e getProducts");
      print(e);
      return false;
    }
  }

  List<QuizDetails> get details {
    return [..._details];
  }
}
