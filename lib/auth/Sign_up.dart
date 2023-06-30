import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../view_model/auth_view_model.dart';

class SignUpScreen extends GetWidget<AuthViewModel> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ConfirmpasswordController =
      TextEditingController();
  final TextEditingController NameController = TextEditingController();
  final TextEditingController LevelController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email, password, name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:  Color(0xFFDAEFE8),
        toolbarHeight: 1,
      ),
      backgroundColor:  Color(0xFFDAEFE8),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/images/final caps.png",
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          "6".tr,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        )),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 7,
                            )
                          ]),
                      child: TextFormField(
                        controller: NameController,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        onSaved: (value) {
                          controller.name = value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print("Error");
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "7".tr,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(0),
                            hintStyle: TextStyle(height: 1)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 7,
                            )
                          ]),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        onSaved: (value) {
                          controller.email = value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print("Error");
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "3".tr,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(0),
                            hintStyle: TextStyle(height: 1)),
                      ),
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 7,
                            )
                          ]),
                      child: TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        onSaved: (value) {
                          controller.password = value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print("Error");
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "4".tr,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(0),
                            hintStyle: TextStyle(height: 1)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Container(
                    //   height: 50,
                    //   padding: const EdgeInsets.symmetric(horizontal: 10),
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(6),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.black.withOpacity(0.1),
                    //           blurRadius: 7,
                    //         )
                    //       ]),
                    //   child: TextFormField(
                    //     controller: ConfirmpasswordController,
                    //     keyboardType: TextInputType.text,
                    //     obscureText: true,
                    //     onSaved: (value) {},
                    //     validator: (value) {},
                    //     decoration: InputDecoration(
                    //         hintText: "Confirm your Password",
                    //         border: InputBorder.none,
                    //         contentPadding: EdgeInsets.all(0),
                    //         hintStyle: TextStyle(height: 1)),
                    //   ),
                    // ),
                    SizedBox(
                      height: 70,
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     _formKey.currentState!.save();
                    //     if (_formKey.currentState!.validate()) {
                    //       controller.signupWithEmailAndPassword();
                    //     }
                    //   },
                    //   child: Container(
                    //     alignment: Alignment.center,
                    //     height: 55,
                    //     decoration: BoxDecoration(
                    //         color: Color.fromARGB(255, 187, 186, 186),
                    //         borderRadius: BorderRadius.circular(15),
                    //         boxShadow: [
                    //           BoxShadow(
                    //             color: Colors.black.withOpacity(0.1),
                    //             blurRadius: 10,
                    //           ),
                    //         ]),
                    //     child: Text(
                    //       "8".tr,
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.w700,
                    //           fontSize: 20),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    //  SocialMedia(),
                    InkWell(
                      onTap: () {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          controller.signupWithEmailAndPassword();
                        }
                      },
                      child: AnimatedContainer(
                        width: 300,
                        height: 48,
                        duration: Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient:
                              LinearGradient(colors: [Colors.red, Colors.blue]),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "8".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Notification extends StatefulWidget {
  const Notification({Key? key}) : super(key: key);

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  void initState() {
    super.initState();
    OneSignal.shared.setLogLevel(OSLogLevel.debug, OSLogLevel.none);
    OneSignal.shared.setAppId("baabdcff-6401-4531-9fde-768eb422047a");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
