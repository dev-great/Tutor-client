import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:tutor/screens/widgets/splash_screen.dart';
import 'package:tutor/states/feedstate.dart';
import 'package:tutor/states/fogottenpwrd_state.dart';
import 'package:tutor/states/myquizestate.dart';
import 'package:tutor/states/otpstate.dart';
import 'package:tutor/states/paymentstate.dart';
import 'package:tutor/states/profilestate.dart';
import 'package:tutor/states/quizedetails.dart';
import 'package:tutor/states/quizestate.dart';
import 'package:tutor/states/savequize.dart';
import 'package:tutor/states/submitquiz.dart';
import 'package:tutor/states/tutor.dart';
import 'package:tutor/states/userstate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalStorage storage = LocalStorage('usertoken');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserState()),
        ChangeNotifierProvider(create: (ctx) => OTPPWRDState()),
        ChangeNotifierProvider(create: (ctx) => FogottenPwrd()),
        ChangeNotifierProvider(create: (ctx) => FeedState()),
        ChangeNotifierProvider(create: (ctx) => MyQuizeState()),
        ChangeNotifierProvider(create: (ctx) => PaymentState()),
        ChangeNotifierProvider(create: (ctx) => ProfileState()),
        ChangeNotifierProvider(create: (ctx) => QuizeDetailState()),
        ChangeNotifierProvider(create: (ctx) => QuizState()),
        ChangeNotifierProvider(create: (ctx) => SaveAnsState()),
        ChangeNotifierProvider(create: (ctx) => SaveQuizState()),
        ChangeNotifierProvider(create: (ctx) => TutorState()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          future: storage.ready,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            return const SplashScreen();
          },
        ),
      ),
    );
  }
}
