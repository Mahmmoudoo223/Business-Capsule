import 'package:course_app/screens/courses/Course.dart';
import 'package:course_app/screens/home/widget/home.dart';
import 'package:course_app/screens/home/widget/search_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../profile/profile_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int myIndex = 0;
  List<Widget> widgetList = [
    HomePage(),
    SearchInput(),
    MyCoursesScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "",
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        toolbarHeight: 15,
        elevation: 0,
        backgroundColor: Colors.transparent,
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
        iconTheme: IconThemeData(color: Colors.black),
        // elevation: 0,
        // backgroundColor: Colors.red,
        // toolbarHeight: 1,
      ),
      body: Center(
        child: widgetList[myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "26".tr),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined), label: "48".tr),
            BottomNavigationBarItem(
                icon: Icon(Icons.school_outlined), label: "28".tr),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "29".tr),
          ]),
    );
  }
}
