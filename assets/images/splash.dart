import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:course_app/auth/login.dart';
import 'package:course_app/screens/home/widget/Bottom_bar.dart';
import 'package:course_app/view_model/controle_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initTimer();
  }

  void initTimer() async {
    if (await checkinternet()) {
      Timer(Duration(seconds: 2), () {
        Get.to(ControleView());
      });
    } else {}
  }

  Future checkinternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset("assets/images/11793-books-stack.json"),
      nextScreen: FutureBuilder(
          future: checkinternet(),
          builder: (BuildContext c, snap) {
            if (snap.data == null) {
              return ControleView();
            } else if (snap.data == true) {
              return ControleView(); 
            } else {
              return Scaffold(
                backgroundColor: Colors.white,
                body: InkWell(
                  onTap: () {
                    setState(() {
                      initTimer();
                    });
                  },
                  child: Center(
                      child: Lottie.asset(
                          "assets/images/no-internet-connection2.json")),
                ),
              );
            }
          }),
      splashIconSize: 300,
      duration: 3000,
      splashTransition: SplashTransition.sizeTransition,
      animationDuration: const Duration(seconds: 1),
      backgroundColor: Colors.white,
    );
  }
}
