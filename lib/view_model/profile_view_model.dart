import 'package:course_app/helper/local_storge_data.dart';
import 'package:course_app/view_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileViewModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }

  final LocalStorgeData localStorgeData = Get.find();

  UserModel? get userModel => _userModel;
  UserModel? _userModel;

  void getCurrentUser() async {
    await localStorgeData.getUser.then((value) {
      _userModel = value;
    });
    update();
  }

  Future<void> signOut() async {
    final box = GetStorage();
    FirebaseAuth.instance.signOut();
    box.remove('email');
    localStorgeData.deleteUser();
  }
}
