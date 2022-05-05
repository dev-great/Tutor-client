import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tutor/screens/auth/signin.dart';
import 'package:tutor/screens/auth/signup.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: Stack(
        children: [
          Expanded(
            child: TabBarView(
              children: const [
                Center(child: SignIn()),
                Center(child: SignUp()),
              ],
              controller: _tabController,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.2,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            ),
            child: const Center(
              child: Image(
                height: 64,
                width: 64,
                image: AssetImage(
                  "assets/images/luncher.png",
                ),
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.6),
            child: TabBar(
              indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3.0,
                    color: Color(0xFF4960F9),
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 35.0)),
              controller: _tabController,
              tabs: const <Widget>[
                Tab(
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontFamily: "GTWalsheimPro",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontFamily: "GTWalsheimPro",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
