// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';

class TutorList extends StatefulWidget {
  const TutorList({
    Key? key,
  }) : super(key: key);

  @override
  State<TutorList> createState() => _TutorListState();
}

class _TutorListState extends State<TutorList> {
  int currentValue = 0;
  List<String> selected = [];
  String _selectedGender = 'Physical';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Padding(
          padding: const EdgeInsets.only(top: 10),
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
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: const Text(
                          "Tell us about your child’s need",
                          style: TextStyle(
                              fontFamily: "GTWalsheimPro",
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Text(
                          "What’s your goal and what subjects do your kids need help with?",
                          style: TextStyle(
                              fontFamily: "GTWalsheimPro",
                              fontSize: 17,
                              color: const Color.fromARGB(255, 0, 39, 75)
                                  .withOpacity(0.5),
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  "For Child 1 in Pre-Nursery",
                  style: TextStyle(
                      fontFamily: "GTWalsheimPro",
                      fontSize: 17,
                      color: Color(0xFF4960F9),
                      fontWeight: FontWeight.w600),
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
                      "What’s your goal for this child?",
                      style: TextStyle(
                          fontFamily: "GTWalsheimPro",
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    DropDownMultiSelect(
                      onChanged: (List<String> x) {
                        setState(() {
                          selected = x;
                        });
                      },
                      options: const ['a', 'b', 'c', 'd'],
                      selectedValues: selected,
                      whenEmpty: 'Select a goal',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 0),
                      child: const Text(
                        "What subjects?",
                        style: TextStyle(
                            fontFamily: "GTWalsheimPro",
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      child: DropDownMultiSelect(
                        onChanged: (List<String> x) {
                          setState(() {
                            selected = x;
                          });
                        },
                        options: const ['a', 'b', 'c', 'd'],
                        selectedValues: selected,
                        whenEmpty: 'Select subjects',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Tell us a bit about this child",
                      style: TextStyle(
                          fontFamily: "GTWalsheimPro",
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black38,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLines: 10,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintText: "Leave us a feedback...",
                              labelStyle: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontFamily: "GTWalsheimPro",
                              )),
                          onSaved: (v) {
                            v = v!;
                          },
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Enter Your feedback';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  "What Curriculum is used at your child’s school?",
                  style: TextStyle(
                      fontFamily: "GTWalsheimPro",
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Row(
                        children: [
                          Radio(
                            value: 'Any gender is fine',
                            groupValue: _selectedGender,
                            activeColor: const Color(0xFF4960F9),
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value.toString();
                              });
                            },
                          ),
                          const Text('Any gender is fine'),
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
                            activeColor: const Color(0xFF4960F9),
                            groupValue: _selectedGender,
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
