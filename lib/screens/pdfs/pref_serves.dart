import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServces extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServces> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServces().init());
}
