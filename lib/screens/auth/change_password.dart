import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:tutor/screens/auth/signin.dart';
import 'package:tutor/states/userstate.dart';

class ChangePwrd extends StatefulWidget {
  ChangePwrd({Key? key}) : super(key: key);

  @override
  State<ChangePwrd> createState() => _ChangePwrdState();
}

class _ChangePwrdState extends State<ChangePwrd> {
  String _oldPassword = '';
  String _password = '';
  String _confpassword = '';
  bool _isLoading = false;

  final _form = GlobalKey<FormState>();
  void _changePassword() async {
    var isvalid = _form.currentState?.validate();
    setState(() {
      _isLoading = true; // your loader has started to load
    });
    if (!isvalid!) {
      return setState(() {
        _isLoading = false; // your loader has started to load
      });
    }
    _form.currentState?.save();
    bool isregis = await Provider.of<UserState>(
      context,
      listen: false,
    ).changePassword(
      _oldPassword,
      _password,
    );
    if (isregis) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignIn()));
      setState(() {
        _isLoading = false; // your loader has started to load
      });
    } else {
      setState(() {
        _isLoading = false; // your loader has started to load
      });
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Something is wrong.Try Again"),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF003D21),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  return Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 2, left: 20, right: 20),
                        child: Center(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(top: 40),
                                      child: Text(
                                        'Change Password',
                                        style: TextStyle(
                                          fontSize: 32,
                                          color: Colors.black,
                                          fontFamily: "GTWalsheimPro",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    height: 70,
                                    width: MediaQuery.of(context).size.width /
                                        1.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                              ),
                                            ),
                                            hintText: "Enter Your old password",
                                            hintStyle: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54,
                                              fontFamily: "GTWalsheimPro",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          obscureText: true,
                                          onSaved: (v) {
                                            _oldPassword = v!;
                                          },
                                          validator: (v) {
                                            if (v!.isEmpty) {
                                              return 'Enter Your old password';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Container(
                                    height: 70,
                                    width: MediaQuery.of(context).size.width /
                                        1.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                              ),
                                            ),
                                            hintText: "Enter new password",
                                            hintStyle: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54,
                                              fontFamily: "GTWalsheimPro",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          obscureText: true,
                                          autocorrect: false,
                                          enableSuggestions: false,
                                          onChanged: (v) {
                                            setState(() {
                                              _confpassword = v;
                                            });
                                          },
                                          onSaved: (v) {
                                            _password = v!;
                                          },
                                          validator: (v) {
                                            if (v!.isEmpty) {
                                              return 'Enter Your password';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Container(
                                    height: 70,
                                    width: MediaQuery.of(context).size.width /
                                        1.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                              ),
                                            ),
                                            hintText: "Confirm password",
                                            hintStyle: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54,
                                              fontFamily: "GTWalsheimPro",
                                              fontWeight: FontWeight.w500,
                                            ),
                                            helperStyle: TextStyle(
                                              fontFamily: "GTWalsheimPro",
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          obscureText: true,
                                          autocorrect: false,
                                          enableSuggestions: false,
                                          onSaved: (v) {
                                            _password = v!;
                                          },
                                          validator: (v) {
                                            if (_confpassword != v) {
                                              return 'Confirm password';
                                            }
                                            if (v!.isEmpty) {
                                              return 'Confirm Your password';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 40,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      _changePassword();
                                    },
                                    child: SizedBox(
                                      child: Container(
                                        height: 60,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.3,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF4960F9),
                                          borderRadius:
                                              BorderRadius.circular(19),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 0,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.97,
                                              child: const SizedBox(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(18),
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
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.58,
                                              child: const ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(18),
                                                ),
                                                child: Image(
                                                  image: AssetImage(
                                                      "assets/images/btn2.png"),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  _isLoading
                                                      ? SpinKitFadingCube(
                                                          size: 20,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return DecoratedBox(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: index
                                                                        .isEven
                                                                    ? const Color
                                                                            .fromARGB(
                                                                        255,
                                                                        253,
                                                                        253,
                                                                        255)
                                                                    : const Color
                                                                            .fromARGB(
                                                                        255,
                                                                        2,
                                                                        16,
                                                                        112),
                                                              ),
                                                            );
                                                          },
                                                        ) // this will show when loading is true
                                                      : const Text(
                                                          "Update Password",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  "GTWalsheimPro",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none),
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
                              ]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
