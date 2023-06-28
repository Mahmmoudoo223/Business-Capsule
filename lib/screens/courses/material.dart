import 'package:course_app/models/course_model.dart';
import 'package:course_app/resources/color_manager.dart';
import 'package:course_app/resources/strings_manager.dart';
import 'package:course_app/screens/courses/section.dart';
import 'package:course_app/view_model/material_view_model.dart';
import 'package:course_app/screens/videos/videos_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class MaterialScreen extends GetWidget<MaterialViewModel> {
  CourseModel courseModel;

  MaterialScreen({required this.courseModel});

  @override
  Widget build(BuildContext context) {
    print(courseModel.toString());
    MaterialViewModel controller = MaterialViewModel();

    return Scaffold(
        body: GetX<MaterialViewModel>(
      init: MaterialViewModel(),
      builder: (value) => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.red,
            Colors.blue.withOpacity(0.9),
          ],
          begin: FractionalOffset(0.0, 0.4),
          end: Alignment.topRight,
        )),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  courseModel.name??"Unkown Course",
                  style: TextStyle(
                      fontSize: 24,
                      color: ColorManager.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  courseModel.doctorname??"Unkown Doctor",
                  style: TextStyle(
                      fontSize: 22,
                      color: ColorManager.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Center(
                      child: ToggleSwitch(
                        initialLabelIndex: controller.activeToggledIndex.value,
                        totalSwitches: 2,
                        inactiveBgColor: Color.fromARGB(255, 116, 27, 27),
                        minWidth: 145.0,
                        minHeight: 60.0,
                        activeFgColor: ColorManager.white,
                        inactiveFgColor: Colors.white54,
                        activeBgColor: [Colors.white10],
                        fontSize: 18.0,
                        labels: [
                          AppStrings.pdf,
                          AppStrings.videos,
                        ],
                        onToggle: (index) {
                          print("index=" + index.toString());
                          controller.changeToogleIndex(index!);
                          print(controller.activeToggledIndex.toString());
                        },
                      ),
                    )),
                  ],
                )
              ]),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFDAEFE8),
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70))),
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  if (controller.activeToggledIndex == 0)
                    SectionWidget(courseModel: courseModel,type: SectionType.pdf),
                  if (controller.activeToggledIndex == 1)
                    SectionWidget(courseModel: courseModel,type: SectionType.video)
                ]),
              ),
            )),
          ],
        ),
      ),
    ));
  }
}
