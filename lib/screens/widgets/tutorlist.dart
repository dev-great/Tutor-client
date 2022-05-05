import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tutor/screens/widgets/account.dart';
import 'package:tutor/screens/widgets/feeds.dart';
import 'package:tutor/screens/widgets/quiz.dart';
import 'package:tutor/screens/widgets/tutor.dart';
import 'package:tutor/states/tutor.dart';

class TutorList extends StatefulWidget {
  const TutorList({
    Key? key,
  }) : super(key: key);

  @override
  State<TutorList> createState() => _TutorListState();
}

class _TutorListState extends State<TutorList> {
  final String currency = FlutterwaveCurrency.NGN;
  final String fullname = "Greatness Marshal";
  final String email = "gmarshal070@gmail.com";
  final String amount = "15000";
  final String phone = "08100808038";

  void _makeFlutterwavePayment(BuildContext context, String fullname,
      String phone, String email, String amount) async {
    try {
      Flutterwave flutterwave = Flutterwave.forUIPayment(
          //the first 10 fields below are required/mandatory
          context: this.context,
          fullName: fullname,
          phoneNumber: phone,
          email: email,
          amount: "15000",
          //Use your Public and Encription Keys from your Flutterwave account on the dashboard
          encryptionKey: "f2168d22aa194bcd28fe6cb1",
          publicKey: "FLWPUBK-4f8c3b3f3d14be16cb36916ca7fb42b5-X",
          currency: currency,
          txRef: DateTime.now().toIso8601String(),
          //Setting DebugMode below to true since will be using test mode.
          //You can set it to false when using production environment.
          isDebugMode: false,
          //configure the the type of payments that your business will accept
          acceptCardPayment: true,
          acceptUSSDPayment: true,
          acceptAccountPayment: false,
          acceptFrancophoneMobileMoney: false,
          acceptGhanaPayment: true,
          acceptMpesaPayment: true,
          acceptRwandaMoneyPayment: false,
          acceptUgandaPayment: false,
          acceptZambiaPayment: false);

      final response = await flutterwave.initializeForUiPayments();
      if (response == null) {
        print("Transaction Failed");
      } else {
        if (response.status == "Transaction successful") {
          print(response.data);
          print(response.message);
        } else {
          print(response.message);
        }
      }
    } catch (error) {
      print(error);
    }
  }

  Widget currentScreen = TutorScreen();
  bool _init = true;
  bool _isLoding = false;

  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoding =
          await Provider.of<TutorState>(context, listen: false).getTutor();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final tutor = Provider.of<TutorState>(context, listen: false).tutor;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 120,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Padding(
            padding: const EdgeInsets.only(top: 55, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Available Tutors",
                  style: TextStyle(
                      fontFamily: "GTWalsheimPro",
                      fontSize: 32,
                      color: Color.fromARGB(255, 0, 39, 75),
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Select a tutor closer to you.",
                    style: TextStyle(
                        fontFamily: "GTWalsheimPro",
                        fontSize: 17,
                        color: const Color.fromARGB(255, 0, 39, 75)
                            .withOpacity(0.5),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: tutor.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                final name = fullname;
                final userPhone = phone;
                final userEmail = email;
                final amountPaid = amount;

                _makeFlutterwavePayment(
                    context, name, userPhone, userEmail, amountPaid);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.black,
                        backgroundImage: NetworkImage(
                            "http://192.168.43.196:8000 ${tutor[index].image.toString()}"),
                      ),
                      trailing: Column(
                        children: [
                          Text(
                            tutor[index].location.toString(),
                            style: const TextStyle(
                                fontFamily: "GTWalsheimPro",
                                fontSize: 16,
                                color: Color.fromARGB(255, 0, 39, 75),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "₦15,000 pre/Month ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: "GTWalsheimPro",
                                fontSize: 14,
                                color: Color.fromARGB(255, 250, 1, 1)
                                    .withOpacity(0.5),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${tutor[index].tutor.toString()} ",
                            style: const TextStyle(
                                fontFamily: "GTWalsheimPro",
                                fontSize: 18,
                                color: Color.fromARGB(255, 0, 39, 75),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${tutor[index].email.toString()} ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: "GTWalsheimPro",
                                fontSize: 14,
                                color: const Color.fromARGB(255, 0, 39, 75)
                                    .withOpacity(0.5),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
