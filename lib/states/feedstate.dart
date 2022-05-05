// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:tutor/models/feedmodel.dart';

class FeedState with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  List<Feeds> _feeds = [];
  Future<bool> getFeeds() async {
    var token = storage.getItem('token');
    try {
      http.Response response = await http.get(
          Uri.parse("http://192.168.43.196:8000/blog/feeds/"),
          headers: {'Authorization': "token $token"});
      var data = json.decode(response.body) as List;
      // print(data);
      List<Feeds> temp = [];
      for (var element in data) {
        Feeds feed = Feeds.fromJson(element);
        temp.add(feed);
      }
      _feeds = temp;
      notifyListeners();
      return true;
    } catch (e) {
      print("e getFeeds");
      print(e);
      return false;
    }
  }

  List<Feeds> get feeds {
    return [..._feeds];
  }

  List<FeedVideo> _feedvideo = [];
  Future<bool> getFeedVideo() async {
    var token = storage.getItem('token');
    try {
      http.Response response = await http.get(
          Uri.parse("http://192.168.43.196:8000/blog/feedvideos/"),
          headers: {'Authorization': "token $token"});
      var data = json.decode(response.body) as List;
      // print(data);
      List<FeedVideo> temp = [];
      for (var element in data) {
        FeedVideo feedvideo = FeedVideo.fromJson(element);
        temp.add(feedvideo);
      }
      _feedvideo = temp;
      notifyListeners();
      return true;
    } catch (e) {
      print("e getFeedVideo");
      print(e);
      return false;
    }
  }

  List<FeedVideo> get feedvideo {
    return [..._feedvideo];
  }
}
