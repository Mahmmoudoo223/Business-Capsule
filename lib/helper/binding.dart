import 'package:course_app/helper/local_storge_data.dart';
import 'package:course_app/models/home_view_model.dart';
import 'package:course_app/view_model/auth_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => LocalStorgeData());
  }
}
