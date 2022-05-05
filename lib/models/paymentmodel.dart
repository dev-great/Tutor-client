class Payment {
  int? id;
  int? user;
  String? referenceCode;
  String? paystackAccessCode;
  String? amount;
  String? date;
  bool? active;
  int? duration;
  int? paymentFor;

  Payment(
      {this.id,
      this.user,
      this.referenceCode,
      this.paystackAccessCode,
      this.amount,
      this.date,
      this.active,
      this.duration,
      this.paymentFor});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    referenceCode = json['referenceCode'];
    paystackAccessCode = json['paystackAccessCode'];
    amount = json['amount'];
    date = json['date'];
    active = json['active'];
    duration = json['duration'];
    paymentFor = json['paymentFor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user'] = user;
    data['referenceCode'] = referenceCode;
    data['paystackAccessCode'] = paystackAccessCode;
    data['amount'] = amount;
    data['date'] = date;
    data['active'] = active;
    data['duration'] = duration;
    data['paymentFor'] = paymentFor;
    return data;
  }
}
