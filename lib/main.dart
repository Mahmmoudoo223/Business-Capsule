import 'package:course_app/Local/local.dart';
import 'package:course_app/Local/local_controller.dart';
import 'package:course_app/helper/local_storge_data.dart';
import 'package:course_app/screens/pdfs/pref_serves.dart';
import 'package:course_app/screens/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'ads/ads_screen.dart';
import 'helper/binding.dart';
import 'models/home_view_model.dart';
import 'view_model/auth_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(LocalStorgeData());
    MyLocalController controller = Get.put(MyLocalController());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => AuthViewModel());

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return GetMaterialApp(
        locale: controller.language,
        translations: MyLocal(),
        initialBinding: Binding(),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
