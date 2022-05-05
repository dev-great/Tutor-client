import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/screens/auth/signin.dart';
import 'package:tutor/screens/widgets/welcome_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: Stack(
        children: [
          CustomPaint(
            painter: ArcPainter(),
            child: SizedBox(
              height: screenSize.height / 1.4,
              width: screenSize.width,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.9,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                  bottomRight: Radius.circular(110)),
              child: Image(
                image: AssetImage(
                  tabs[_currentIndex].lottieFile,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 275,
              child: Column(
                children: [
                  Flexible(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: tabs.length,
                      itemBuilder: (BuildContext context, int index) {
                        OnboardingModel tab = tabs[index];
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              tab.title,
                              style: const TextStyle(
                                fontSize: 37.0,
                                fontFamily: "GTWalsheimPro",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              tab.subtitle,
                              style: const TextStyle(
                                fontSize: 17.0,
                                fontFamily: "GTWalsheimPro",
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        );
                      },
                      onPageChanged: (value) {
                        _currentIndex = value;
                        setState(() {});
                      },
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int index = 0; index < tabs.length; index++)
                        _DotIndicator(isSelected: index == _currentIndex),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        if (_currentIndex == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen()));
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.fastOutSlowIn,
                          );
                        }
                      },
                      child: SizedBox(
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4960F9),
                            borderRadius: BorderRadius.circular(19),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: MediaQuery.of(context).size.width / 1.97,
                                child: const SizedBox(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(18),
                                    ),
                                    child: Image(
                                      image:
                                          AssetImage("assets/images/btn1.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: MediaQuery.of(context).size.width / 1.58,
                                child: const ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(18),
                                  ),
                                  child: Image(
                                    image: AssetImage("assets/images/btn2.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _currentIndex != 2
                                        ? const Text(
                                            "Next",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontFamily: "GTWalsheimPro",
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.none),
                                          )
                                        : const Text(
                                            "Get Started",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontFamily: "GTWalsheimPro",
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path orangeArc = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 160)
      ..quadraticBezierTo(
          size.width / 7, size.height - 20, size.width, size.height - 155)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 130)
      ..close();

    canvas.drawPath(
        orangeArc, Paint()..color = const Color.fromARGB(255, 75, 93, 250));

    Path whiteArc = Path()
      ..moveTo(0, 0)
      ..lineTo(0.0, size.height - 165)
      ..quadraticBezierTo(
          size.width / 2, size.height - 60, size.width, size.height - 135)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 120)
      ..close();

    canvas.drawPath(whiteArc,
        Paint()..color = Color.fromARGB(255, 212, 93, 252).withOpacity(0.5));
    Path pinkArc = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 165)
      ..quadraticBezierTo(
          size.width / 2, size.height - 20, size.width, size.height - 182)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 30)
      ..close();

    canvas.drawPath(pinkArc, Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _DotIndicator extends StatelessWidget {
  final bool isSelected;

  const _DotIndicator({Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 8.0,
        width: isSelected ? 25.0 : 10.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isSelected ? const Color(0xFF4960F9) : Colors.grey,
        ),
      ),
    );
  }
}

class OnboardingModel {
  final String lottieFile;
  final String title;
  final String subtitle;

  OnboardingModel(this.lottieFile, this.title, this.subtitle);
}

List<OnboardingModel> tabs = [
  OnboardingModel(
    'assets/images/onboarding1.png',
    'Welcome',
    'Here you have access to over 2000\n questions from several examination sources\n majourly WAEC and JAMB.',
  ),
  OnboardingModel(
    'assets/images/onboarding2.png',
    'Easy Learning',
    'Access to news that will keep you\n updated on any developments that\n relates to school and academics.',
  ),
  OnboardingModel(
    'assets/images/onboarding3.png',
    'Get a Tutor',
    'Professional tutors to teach and guide\n you on all your selected subjects\n virtually or physically as you wish.',
  ),
];
