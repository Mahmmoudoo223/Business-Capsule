import 'package:course_app/resources/assets_manager.dart';
import 'package:course_app/resources/color_manager.dart';
import 'package:course_app/screens/courses/courses.dart';
import 'package:course_app/screens/home/widget/Bottom_bar.dart';
import 'package:course_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/levels.dart';

class ChoiceScreen extends StatelessWidget {
  final Levels levels;

  String level;

  ChoiceScreen({required this.level, required this.levels});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //toolbarHeight: 15,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0)),
            gradient: LinearGradient(
              colors: [Colors.red, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFDAEFE8),
      body: Center(
        child: Column(
          children: [
            Container(
                child: Stack(children: [
              Column(
                children: [
                  Container(
                    height: 270,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                          )
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      child: Image.asset(
                        levels.Image,
                        width: 400,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                ],
              ),
            ])),
            SizedBox(
              height: 60,
            ),
            // InkWell(
            //   child: AnimatedContainer(
            //     width: 300,
            //     height: 55,
            //     duration: Duration(milliseconds: 200),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text(
            //           '18'.tr,
            //           style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 22,
            //               fontWeight: FontWeight.bold),
            //         )
            //       ],
            //     ),
            //   ),
            //   onTap: () {
            //     Get.to(CoursesViewScreen(
            //       cat: 'ar',
            //       level: level,
            //     ));
            //   },
            // ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              child: AnimatedContainer(
                width: 300,
                height: 55,
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [Colors.blue, Colors.red]),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '19'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              onTap: () {
                Get.to(CoursesViewScreen(
                  cat: 'en',
                  level: level,
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
