import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:tutor/screens/widgets/home_screen.dart';
import 'package:tutor/screens/widgets/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  LocalStorage storage = LocalStorage('usertoken');
  void initState() {
    super.initState();
    _splash();
  }

  _splash() async {
    await Future.delayed(const Duration(milliseconds: 4000), () {});
    if (storage.getItem('token') == null) {
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    }
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 3000),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(
              width: 70,
              height: 70,
              child: Image(
                image: AssetImage("assets/images/splash.png"),
              ),
            ),
            Text(
              "INDOMITABLE",
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: "GTWalsheimPro",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "GOOD GRADES",
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: "GTWalsheimPro",
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
