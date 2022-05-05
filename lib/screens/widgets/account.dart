import 'package:flutter/material.dart';
import 'package:tutor/screens/auth/change_password.dart';
import 'package:tutor/screens/auth/edit_account.dart';
import 'package:tutor/screens/auth/signup.dart';
import 'package:tutor/screens/widgets/welcome_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF4960F9),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Container(
            color: Color(0xFF4960F9),
            child: Column(
              children: [
                SizedBox(
                  height: height,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double innerHeight = constraints.minHeight;
                      double innerWidth = constraints.maxWidth;
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: innerHeight * 0.86,
                              width: innerWidth,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                color: const Color(0xFFE5E5E5),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  const Text(
                                    'Greatness Marshal',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontFamily: "GTWalsheimPro",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'gmarshal070@gmail.com',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontFamily: "GTWalsheimPro",
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 18),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const EditAccount()));
                                      },
                                      child: Container(
                                        height: 65,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.11,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFFFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors
                                                              .black, //                   <--- border color
                                                          width: 2.0,
                                                        ),
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(80)),
                                                    child:
                                                        Stack(children: const [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(0.5),
                                                        child: Icon(
                                                          Icons.person,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ])),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 40,
                                            ),
                                            const Text(
                                              'Edit Profile',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontFamily: "GTWalsheimPro",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const Spacer(),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 15),
                                              child: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Colors.black,
                                                size: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ChangePwrd()));
                                      },
                                      child: Container(
                                        height: 65,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.11,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFFFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Container(
                                                  height: 38,
                                                  width: 38,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFFFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Stack(children: const [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Icon(
                                                        Icons.password,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ])),
                                            ),
                                            const SizedBox(
                                              width: 40,
                                            ),
                                            const Text(
                                              'Change Password',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontFamily: "GTWalsheimPro",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const Spacer(),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 15),
                                              child: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Colors.black,
                                                size: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 65,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.11,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFFFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Container(
                                                  height: 38,
                                                  width: 38,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFFFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Stack(children: const [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Icon(
                                                        Icons.history,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ])),
                                            ),
                                            const SizedBox(
                                              width: 40,
                                            ),
                                            const Text(
                                              'Tutorial History',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontFamily: "GTWalsheimPro",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const Spacer(),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 15),
                                              child: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Colors.black,
                                                size: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const WelcomeScreen()),
                                        );
                                      },
                                      child: Container(
                                        height: 65,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.11,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFFFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Container(
                                                  height: 38,
                                                  width: 38,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFFFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Stack(children: const [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Icon(
                                                        Icons.logout,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ])),
                                            ),
                                            const SizedBox(
                                              width: 40,
                                            ),
                                            const Text(
                                              'Log Out',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontFamily: "GTWalsheimPro",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const Spacer(),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 15),
                                              child: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Colors.black,
                                                size: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 50,
                            right: 130,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors
                                      .white, //                   <--- border color
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "assets/images/user.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
