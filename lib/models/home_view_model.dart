import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/models/Best_selling.dart';
import 'package:course_app/models/course_model.dart';
import 'package:course_app/models/enrolled_courses_list.dart';
import 'package:course_app/models/top_course_model.dart';
import 'package:course_app/servies/home_serves.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CourseModel> get categoriesModel => _categoriesModel;
  List<CourseModel> _categoriesModel = [];
  List<CourseModel> get bestCourseModel => _bestCourseModel;
  List<CourseModel> _bestCourseModel = [];

  HomeViewModel() {
    getCategory();
    getBestSilling();
    getEnrolledCourses();
  }

  getCategory() async {
    _loading.value = true;
    HomeServes().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoriesModel.add(
            CourseModel.fromFirestore(value[i]));
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
            CourseModel.fromFirestore(value[i]));
        _loading.value = false;
      }
      print(_bestCourseModel.length);
      update();
    });
  }
  getEnrolledCourses() async {
    _loading.value = true;
    HomeServes().getEnrolledCourse().then((value) {
      for (int i = 0; i < value.length; i++) {
        EnrolledCourses.addCourse(value[i]["courseID"]);
        _loading.value = false;
      }
      print(EnrolledCourses.list);
      update();
    });
  }
}
