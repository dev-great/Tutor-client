import 'package:flutter/material.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  String _username = '';
  final _form = GlobalKey<FormState>();
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
            color: Color.fromARGB(255, 13, 22, 100),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: height,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double innerHeight = constraints.maxHeight;
                  double innerWidth = constraints.maxWidth;
                  return Form(
                    key: _form,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: innerHeight * 0.79,
                            width: innerWidth,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 80,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    height: 70,
                                    width: MediaQuery.of(context).size.width /
                                        1.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("User name",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16,
                                                  fontFamily: "GTWalsheimPro",
                                                )),
                                            TextFormField(
                                              decoration: const InputDecoration(
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                iconColor: Colors.black,
                                                hintText: "Greatness Marshal",
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontFamily: "GTWalsheimPro",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              onSaved: (v) {
                                                _username = v!;
                                              },
                                              validator: (v) {
                                                if (v!.isEmpty) {
                                                  return 'Enter Your E-mail';
                                                }
                                                return null;
                                              },
                                            ),
                                          ],
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
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Email address",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16,
                                                  fontFamily: "GTWalsheimPro",
                                                )),
                                            TextFormField(
                                              decoration: const InputDecoration(
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                iconColor: Colors.black,
                                                hintText:
                                                    "gmarshal070@gmail.com",
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontFamily: "GTWalsheimPro",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                helperStyle: TextStyle(
                                                  fontFamily: "GTWalsheimPro",
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              onSaved: (v) {
                                                _username = v!;
                                              },
                                              validator: (v) {
                                                if (v!.isEmpty) {
                                                  return 'Enter Your Full name';
                                                }
                                                return null;
                                              },
                                            ),
                                          ],
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
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Phone number",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16,
                                                  fontFamily: "GTWalsheimPro",
                                                )),
                                            TextFormField(
                                              decoration: const InputDecoration(
                                                iconColor: Colors.black,
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                hintText: "08100808038",
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontFamily: "GTWalsheimPro",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                helperStyle: TextStyle(
                                                  fontFamily: "GTWalsheimPro",
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              onSaved: (v) {
                                                _username = v!;
                                              },
                                              validator: (v) {
                                                if (v!.isEmpty) {
                                                  return 'Enter Your Full name';
                                                }
                                                return null;
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: GestureDetector(
                                    onTap: () {},
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
                                                children: const [
                                                  Text(
                                                    "Get Started",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                        fontFamily:
                                                            "GTWalsheimPro",
                                                        fontWeight:
                                                            FontWeight.w600,
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
                              ],
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 80,
                          right: 125,
                          child: CircleAvatar(
                              radius: 60,
                              backgroundColor:
                                  Color.fromARGB(255, 210, 230, 238)),
                        ),
                        const Positioned(
                          top: 85,
                          right: 130,
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.black,
                            backgroundImage:
                                AssetImage("assets/images/user.png"),
                          ),
                        ),
                        Positioned(
                            top: 105,
                            right: 170,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.camera,
                                  color: Color(0xFFFFFFFF),
                                  size: 50,
                                ))),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
