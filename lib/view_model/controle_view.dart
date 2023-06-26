import 'package:course_app/auth/login.dart';
import 'package:course_app/models/home_view_model.dart';
import 'package:course_app/screens/home/widget/Bottom_bar.dart';
import 'package:course_app/view_model/auth_view_model.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ControleView extends GetWidget<AuthViewModel> {


  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AuthViewModel());
    return Obx(() {

      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<HomeViewModel>(
              init: HomeViewModel(), builder: (controller) => BottomBar());
    });
  }
}
