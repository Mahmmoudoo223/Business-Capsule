import 'package:course_app/Local/Language.dart';
import 'package:course_app/auth/login.dart';
import 'package:course_app/view_model/profile_view_model.dart';
import 'package:course_app/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';

class ProfileHome extends StatelessWidget {
  const ProfileHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String name = box.read('name') ?? "";
    String email = box.read('email') ?? "";

    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => Column(
        children: [
          SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Custom_Text(
                text: name, //controller.userModel!.name ?? "",
                alignment: Alignment.center,
              )),
              SizedBox(
                height: 5,
              ),
              Text(
                email,
                // "mmmmmm",
                //controller.userModel!.email ??"",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          SizedBox(height: 50),
          // ProfileMenu(
          //   icon: "assets/images/User Icon.svg",
          //   text: "Profile",
          //   press: () {
          //     Get.to(EditProfile());
          //   },
          // ),
          ProfileMenu(
            icon: "assets/images/22.svg",
            text: "23".tr,
            press: () {
              Get.to(Language());
            },
          ),
          // ProfileMenu(
          //   icon: "assets/icons/Notifications.svg",
          //   text: "Notifications",
          //   press: () {},
          // ),
          ProfileMenu(
            icon: "assets/images/share.svg",
            text: "24".tr,
            press: () {
              print(name);
            },
          ),
          ProfileMenu(
            icon: "assets/images/Log out.svg",
            text: "25".tr,
            press: () {
              controller.signOut();
              Get.offAll(LoginScreen());
            },
          ),
        ],
      ),
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
      child: FlatButton(
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.white,
          onPressed: press,
          child: Row(
            children: [
              SvgPicture.asset(icon, width: 22, color: Colors.black),
              SizedBox(width: 20),
              Expanded(
                  child: Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              )),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              )
            ],
          )),
    );
  }
}

// Future<void> share() async {
//   await FlutterShare.share(
//       title: 'Travira',
//       text: 'Download Travira App',
//       linkUrl:
//           'https://play.google.com/store/apps/details?id=com.team.tourism2022',
//       chooserTitle: ' Travira App');
// }
