import 'package:course_app/Local/local_controller.dart';
import 'package:course_app/screens/home/widget/Bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LanguageBody extends GetView<MyLocalController> {
  const LanguageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyLocalController controllerLang = Get.find();

    return Column(
      children: [
        SizedBox(height: 110),
        //ProfilePic(),
        InkWell(
          onTap: () {
            controllerLang.changelang("ar");
          },
          child: AnimatedContainer(
            margin: EdgeInsets.only(left: 25, right: 25),
            alignment: Alignment.center,
            width: 300,
            height: 48,
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "31".tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            controllerLang.changelang("en");
          },
          child: AnimatedContainer(
            margin: EdgeInsets.only(left: 25, right: 25),
            alignment: Alignment.center,
            width: 300,
            height: 48,
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "32".tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        // ProfileMenu(
        //   icon: "assets/images/arabic.svg",
        //   text: "31".tr,
        //   press: () {
        //     controllerLang.changelang("ar");
        //     //Get.off(BottomBar());
        //   },
        // ),

        // ProfileMenu(
        //   icon: "assets/images/english-11.svg",
        //   text: "32".tr,
        //   press: () {
        //     controllerLang.changelang("en");
        //     //Get.off(BottomBar());
        //   },
        // ),
      ],
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
    Null Function()? onpress,
  }) : super(key: key);
  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.black54,
        ),
          onPressed: press,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 22,
                color: Color.fromARGB(255, 10, 10, 10),
              ),
              SizedBox(width: 20),
              Expanded(
                  child: Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              )),
              // Icon(Icons.arrow_forward_ios)
            ],
          )),
    );
  }
}
