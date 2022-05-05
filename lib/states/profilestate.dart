import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:tutor/models/profilemodel.dart';

class ProfileState with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  List<Profile> _profile = [];
  Future<bool> getProfile() async {
    var token = storage.getItem('token');
    try {
      http.Response response = await http.get(
          Uri.parse("http://192.168.43.196:8000/account/profile/"),
          headers: {'Authorization': "token $token"});
      var data = json.decode(response.body) as List;
      // print(data);
      List<Profile> temp = [];
      for (var element in data) {
        Profile profile = Profile.fromJson(element);
        temp.add(profile);
      }
      _profile = temp;
      notifyListeners();
      return true;
    } catch (e) {
      print("e getMyQuize");
      print(e);
      return false;
    }
  }

  List<Profile> get profile {
    return [..._profile];
  }
}
