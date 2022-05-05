import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPAuth extends StatefulWidget {
  const OTPAuth({Key? key}) : super(key: key);

  @override
  State<OTPAuth> createState() => _OTPAuthState();
}

class _OTPAuthState extends State<OTPAuth> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final _form = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE5E5E5),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Image.asset("assets/images/logo icon 1.png"),
                ),
                const Text(
                  "We have sent a  4-digit code to",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontFamily: "GTWalsheimPro",
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none),
                ),
                const Text(
                  "gmarshal070@gmail.com",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF4960F9),
                      fontFamily: "GTWalsheimPro",
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    "Enter Code",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: "GTWalsheimPro",
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Form(
                    key: _form,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 30),
                        child: PinCodeTextField(
                          appContext: context,
                          backgroundColor: Colors.transparent,
                          pastedTextStyle: const TextStyle(
                            color: Color(0xFF4960F9),
                            fontWeight: FontWeight.bold,
                          ),
                          length: 6,
                          obscureText: true,
                          obscuringCharacter: '*',
                          obscuringWidget: const Text("*"),
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 5) {
                              return "In valid OTP";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            inactiveColor: Colors.grey,
                            disabledColor: Colors.red,
                            errorBorderColor: Colors.red,
                            inactiveFillColor: const Color(0xFFE5E5E5),
                            activeColor: const Color(0xFF4960F9),
                            activeFillColor: const Color(0xFFE5E5E5),
                            selectedColor: const Color(0xFF4960F9),
                            selectedFillColor: const Color(0xFFE5E5E5),
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 60,
                            fieldWidth: 40,
                          ),
                          cursorColor: Colors.black,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          errorAnimationController: errorController,
                          controller: textEditingController,
                          keyboardType: TextInputType.number,

                          onCompleted: (v) {
                            print("Completed");
                          },
                          // onTap: () {
                          //   print("Pressed");
                          // },
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn’t receive OTP?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontFamily: "GTWalsheimPro",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Resend OTP",
                          style: TextStyle(
                            color: Color(0xFF4960F9),
                            fontSize: 16,
                            fontFamily: "GTWalsheimPro",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
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
                                    image: AssetImage("assets/images/btn1.png"),
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
              ],
            ),
          ],
        ));
  }
}
