import 'package:course_app/constants/colors.dart';
import 'package:course_app/models/home_view_model.dart';
import 'package:course_app/view_model/profile_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EmojiText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String name = box.read('name') ?? "";
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => Container(
        padding: EdgeInsets.only(left: 25),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 22, top: 0),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black87)),
            ]),
          ),
        ),
      ),
    );
  }
}
