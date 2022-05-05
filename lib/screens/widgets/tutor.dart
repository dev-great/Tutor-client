import 'package:flutter/material.dart';
import 'package:tutor/screens/widgets/tutorlist.dart';

class TutorScreen extends StatefulWidget {
  TutorScreen({Key? key}) : super(key: key);

  @override
  State<TutorScreen> createState() => _TutorScreenState();
}

class _TutorScreenState extends State<TutorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
              radius: 55,
              backgroundColor: Colors.black,
              backgroundImage: AssetImage("assets/images/auth-image.png")),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Uh Oh",
                  style: TextStyle(
                      fontFamily: "GTWalsheimPro",
                      fontSize: 35,
                      color: Color.fromARGB(255, 0, 39, 75),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "Sorry, you do not have access to a tutor now, please subscrie to a tutor and be assigned to a tutor closest to you.",
                  style: TextStyle(
                      fontFamily: "GTWalsheimPro",
                      fontSize: 17,
                      color: Color.fromARGB(255, 0, 39, 75).withOpacity(0.5),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: false).push(
                  MaterialPageRoute(
                      builder: (context) => TutorList(), maintainState: false));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 0, 39, 75)),
                child: const Center(
                  child: Text(
                    "Subscribe",
                    style: TextStyle(
                        fontFamily: "GTWalsheimPro",
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
