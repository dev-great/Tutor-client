import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:tutor/models/paymentmodel.dart';

class PaymentState with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  List<Payment> _payments = [];
  Future<bool> getPayments() async {
    var token = storage.getItem('token');
    try {
      http.Response response = await http.get(
          Uri.parse("http://192.168.43.196:8000/account/payment/"),
          headers: {'Authorization': "token $token"});
      var data = json.decode(response.body) as List;
      // print(data);
      List<Payment> temp = [];
      for (var element in data) {
        Payment payment = Payment.fromJson(element);
        temp.add(payment);
      }
      _payments = temp;
      notifyListeners();
      return true;
    } catch (e) {
      print("e getMyQuize");
      print(e);
      return false;
    }
  }

  List<Payment> get payment {
    return [..._payments];
  }
}
