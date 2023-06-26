import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/models/Best_selling.dart';
import 'package:course_app/models/top_course_model.dart';
import 'package:course_app/servies/home_serves.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoriesModel> get categoriesModel => _categoriesModel;
  List<CategoriesModel> _categoriesModel = [];
  List<BestCourseModel> get bestCourseModel => _bestCourseModel;
  List<BestCourseModel> _bestCourseModel = [];

  HomeViewModel() {
    getCategory();
    getBestSilling();
  }

  getCategory() async {
    _loading.value = true;
    HomeServes().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoriesModel.add(
            CategoriesModel.fromJson(value[i].data() as Map<String, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }

  getBestSilling() async {
    _loading.value = true;
    HomeServes().getBestCourse().then((value) {
      for (int i = 0; i < value.length; i++) {
        _bestCourseModel.add(
            BestCourseModel.fromJson(value[i].data() as Map<String, dynamic>));
        _loading.value = false;
      }
      print(_bestCourseModel.length);
      update();
    });
  }
}
