import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tutor/screens/widgets/account.dart';
import 'package:tutor/screens/widgets/feeds.dart';
import 'package:tutor/screens/widgets/quiz.dart';
import 'package:tutor/screens/widgets/tutor.dart';
import 'package:tutor/screens/widgets/tutorlist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex;
  late List<Widget> _children;
  @override
  void initState() {
    _currentIndex = 0;
    _children = [
      FeedsScreen(),
      TutorScreen(),
      QuizScreen(),
      const AccountScreen(),
    ];
    super.initState();
  }

  int currentTab = 0;
  final List<Widget> screens = [];

  Widget currentScreen = FeedsScreen();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNav(),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
    );
  }

  BottomAppBar bottomNav() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 55,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = FeedsScreen();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        children: [
                          FaIcon(FontAwesomeIcons.home,
                              color: currentTab == 0
                                  ? const Color.fromARGB(255, 0, 39, 75)
                                  : Colors.grey),
                          Text(
                            "Feeds",
                            style: TextStyle(
                                color: currentTab == 0
                                    ? const Color.fromARGB(255, 0, 39, 75)
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = TutorScreen();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        children: [
                          FaIcon(FontAwesomeIcons.chalkboardUser,
                              color: currentTab == 1
                                  ? const Color.fromARGB(255, 0, 39, 75)
                                  : Colors.grey),
                          Text(
                            "Tutor",
                            style: TextStyle(
                                color: currentTab == 1
                                    ? const Color.fromARGB(255, 0, 39, 75)
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = QuizScreen();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        children: [
                          FaIcon(FontAwesomeIcons.clipboardQuestion,
                              color: currentTab == 2
                                  ? const Color.fromARGB(255, 0, 39, 75)
                                  : Colors.grey),
                          Text(
                            "Quiz",
                            style: TextStyle(
                                color: currentTab == 2
                                    ? const Color.fromARGB(255, 0, 39, 75)
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = const AccountScreen();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.black,
                            backgroundImage:
                                AssetImage("assets/images/user.png"),
                          ),
                          Text(
                            "Account",
                            style: TextStyle(
                                color: currentTab == 3
                                    ? const Color.fromARGB(255, 0, 39, 75)
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
