import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:tutor/screens/auth/forgotten_password.dart';
import 'package:tutor/screens/widgets/home_screen.dart';
import 'package:tutor/states/userstate.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _username = '';
  String _password = '';
  bool obscureText = true;
  bool _isLoading = false;

  Color color = Colors.black54;
  final _form = GlobalKey<FormState>();

  void _loginNew() async {
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
    bool istoken = await Provider.of<UserState>(
      context,
      listen: false,
    ).loginNow(_username, _password);
    if (istoken) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
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
    return SingleChildScrollView(
      child: Container(
        color: const Color(0xFFE5E5E5),
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 2.2,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 40),
                child: Form(
                  key: _form,
                  child: Column(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 39, 75),
                              ),
                            ),
                            fillColor: Color.fromARGB(255, 0, 39, 75),
                            hintText: "Enter your user name",
                            labelText: "User name*",
                            labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontFamily: "GTWalsheimPro",
                            )),
                        onSaved: (v) {
                          _username = v!;
                        },
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'Enter Your Username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 39, 75),
                              ),
                            ),
                            hintText: "Enter your valied password",
                            labelText: "Password*",
                            suffixIcon: obscureText == false
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        obscureText = true;
                                        color = Colors.black54;
                                      });
                                    },
                                    child: Icon(
                                      Icons.visibility,
                                      color: color,
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        obscureText = false;
                                        color = const Color.fromARGB(
                                            255, 107, 51, 238);
                                      });
                                    },
                                    child: Icon(
                                      Icons.visibility_off,
                                      color: color,
                                    ),
                                  ),
                            labelStyle: const TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontFamily: "GTWalsheimPro",
                            )),
                        onSaved: (v) {
                          _password = v!;
                        },
                        obscureText: obscureText,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'Enter Your password';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgottenPwrd()));
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Fogotten Password?",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF4960F9),
                        fontFamily: "GTWalsheimPro",
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 12),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    _loginNew();
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
                                        "Get Started",
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
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
