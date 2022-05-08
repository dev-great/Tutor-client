import 'package:flutter/material.dart';
import 'package:tutor/screens/widgets/tutorlist.dart';
import 'package:multiselect/multiselect.dart';

class TutorScreen extends StatefulWidget {
  TutorScreen({Key? key}) : super(key: key);

  @override
  State<TutorScreen> createState() => _TutorScreenState();
}

class _TutorScreenState extends State<TutorScreen> {
  int currentValue = 0;
  List<String> selected = [];
  String _selectedGender = 'Physical';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            child: Padding(
          padding: EdgeInsets.only(top: 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Image(
                  height: 84,
                  width: 84,
                  image: AssetImage(
                    "assets/images/luncher.png",
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: const Text(
                        "Get a tutor for your child",
                        style: TextStyle(
                            fontFamily: "GTWalsheimPro",
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Tell us your child’s class.",
                      style: TextStyle(
                          fontFamily: "GTWalsheimPro",
                          fontSize: 17,
                          color:
                              Color.fromARGB(255, 0, 39, 75).withOpacity(0.5),
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          width: 150,
                          child: const Text(
                            "How many kid's need lesson(s)?",
                            style: TextStyle(
                                fontFamily: "GTWalsheimPro",
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 8,
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4960F9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      print("Setting state");

                                      if (currentValue > 0) {
                                        currentValue--;
                                      } else {
                                        null;
                                      } // decrementing value
                                    });
                                  },
                                  icon: const Icon(Icons.remove,
                                      size: 15, color: Colors.white))),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          child: Center(
                            child: Text(
                              currentValue.toString(),
                              style: const TextStyle(
                                  fontFamily: "GTWalsheimPro",
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4960F9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      currentValue++; // incrementing value
                                    });
                                  },
                                  icon: const Icon(Icons.add,
                                      size: 15, color: Colors.white))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Class(s) of Childs",
                      style: TextStyle(
                          fontFamily: "GTWalsheimPro",
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropDownMultiSelect(
                          onChanged: (List<String> x) {
                            setState(() {
                              selected = x;
                            });
                          },
                          options: ['a', 'b', 'c', 'd'],
                          selectedValues: selected,
                          whenEmpty: 'Select Something',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  "Do you prefer inlesson or online lessons?",
                  style: TextStyle(
                      fontFamily: "GTWalsheimPro",
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 'Physical',
                      groupValue: _selectedGender,
                      activeColor: const Color(0xFF4960F9),
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value.toString();
                        });
                      },
                    ),
                    const Text('Physical Lesson(s)'),
                    Radio(
                      value: 'Online',
                      groupValue: _selectedGender,
                      activeColor: const Color(0xFF4960F9),
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value.toString();
                        });
                      },
                    ),
                    const Text('Online Lesson(s)'),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TutorList()));
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
                                  left:
                                      MediaQuery.of(context).size.width / 1.97,
                                  child: const SizedBox(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(18),
                                      ),
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/btn1.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left:
                                      MediaQuery.of(context).size.width / 1.58,
                                  child: const ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(18),
                                    ),
                                    child: Image(
                                      image:
                                          AssetImage("assets/images/btn2.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Continue",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontFamily: "GTWalsheimPro",
                                            fontWeight: FontWeight.w600,
                                            decoration: TextDecoration.none),
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
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        )),
      ),
    );
  }
}
