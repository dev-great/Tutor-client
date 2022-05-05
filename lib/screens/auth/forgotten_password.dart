import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:tutor/screens/auth/otppwrd_reset.dart';
import 'package:tutor/states/fogottenpwrd_state.dart';

class ForgottenPwrd extends StatefulWidget {
  const ForgottenPwrd({Key? key}) : super(key: key);

  @override
  State<ForgottenPwrd> createState() => _ForgottenPwrdState();
}

class _ForgottenPwrdState extends State<ForgottenPwrd> {
  String _email = '';
  bool _isLoading = false;

  final _form = GlobalKey<FormState>();
  void _otpchangePwrd() async {
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
    bool isregis = await Provider.of<FogottenPwrd>(
      context,
      listen: false,
    ).forgottenPwrd(
      _email,
    );
    if (isregis) {
      setState(() {
        _isLoading = false; // your loader has started to load
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const OtpPwrdReset()));
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
    return Scaffold(
        backgroundColor: const Color(0xFFE5E5E5),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Image.asset("assets/images/logo icon 1.png"),
            ),
            const Text(
              "Forgot Password",
              style: TextStyle(
                  fontFamily: "GTWalsheimPro",
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ),
            const Text(
              "We will send a  6-digit code to your email",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontFamily: "GTWalsheimPro",
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none),
            ),
            const Text(
              "for the verification.",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontFamily: "GTWalsheimPro",
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Form(
                key: _form,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 39, 75),
                        ),
                      ),
                      fillColor: Color.fromARGB(255, 0, 39, 75),
                      hintText: "Enter valied email address",
                      labelText: "Email Address*",
                      labelStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontFamily: "GTWalsheimPro",
                      )),
                  onSaved: (v) {
                    _email = v!;
                  },
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Enter Your Username';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  _otpchangePwrd();
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
                            children: [
                              _isLoading
                                  ? SpinKitFadingCube(
                                      size: 20,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: index.isEven
                                                ? const Color.fromARGB(
                                                    255, 253, 253, 255)
                                                : const Color.fromARGB(
                                                    255, 2, 16, 112),
                                          ),
                                        );
                                      },
                                    ) // this will show when loading is true
                                  : const Text(
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
        ));
  }
}
