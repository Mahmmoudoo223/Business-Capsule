import 'package:course_app/helper/local_storge_data.dart';
import 'package:course_app/screens/pdfs/pref_serves.dart';
import 'package:course_app/view_model/controle_view.dart';
import 'package:course_app/view_model/profile_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLocalController extends GetxController {
  Locale? language;

  MyServces myServces = Get.find();

  changelang(String codelang) {
    Locale locale = Locale(codelang);
    myServces.sharedPreferences.setString("lang", codelang);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedpreflang = myServces.sharedPreferences.getString("lang");

    if (sharedpreflang == "ar") {
      language = const Locale("ar");
    } else if (sharedpreflang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
