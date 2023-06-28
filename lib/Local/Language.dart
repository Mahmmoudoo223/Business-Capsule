import 'package:course_app/Local/Language_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Language extends StatelessWidget {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xFFDAEFE8),
        elevation: 0,
        title: Text("30".tr),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
      ),
      backgroundColor: Color(0xFFDAEFE8),
      body: LanguageBody(),
    );
  }
}
