import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:tutor/screens/widgets/welcome_screen.dart';
import 'package:tutor/states/userstate.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _form = GlobalKey<FormState>();

  String _email = '';
  String _username = '';
  String _password = '';
  String _confpassword = '';
  bool obscureText2 = true;
  bool obscureText = true;
  bool _isLoading = false;
  Color color2 = Colors.black54;
  Color color = Colors.black54;
  _registerNow() async {
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
    ).registernow(_username, _password, _email);
    if (isregis) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
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

  bool _checkbox = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 2.2,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
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
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 39, 75),
                                ),
                              ),
                              fillColor: Color.fromARGB(255, 0, 39, 75),
                              hintText: "Enter your Username",
                              labelText: "Username*",
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
                          obscureText: obscureText,
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
                              return 'Enter Your Password';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 39, 75),
                                ),
                              ),
                              hintText: "Confirm your valied password",
                              labelText: "Confirm Password*",
                              suffixIcon: obscureText2 == false
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          obscureText2 = true;
                                          color2 = Colors.black54;
                                        });
                                      },
                                      child:
                                          Icon(Icons.visibility, color: color2),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          obscureText2 = false;
                                          color2 = const Color.fromARGB(
                                              255, 107, 51, 238);
                                        });
                                      },
                                      child: Icon(
                                        Icons.visibility_off,
                                        color: color2,
                                      ),
                                    ),
                              labelStyle: const TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontFamily: "GTWalsheimPro",
                              )),
                          obscureText: obscureText2,
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
                      ],
                    ),
                  ),
                ),
                CheckboxListTile(
                  activeColor: const Color.fromARGB(255, 107, 51, 238),
                  title: const Text(
                    "Accept our Terms and Conditions",
                    style: TextStyle(
                      fontFamily: "GTWalsheimPro",
                    ),
                  ),
                  value: _checkbox,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (value) {
                    setState(() {
                      _checkbox = !_checkbox;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      _registerNow();
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
                                          itemBuilder: (BuildContext context,
                                              int index) {
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
              ]),
        ),
      ),
    );
  }
}
