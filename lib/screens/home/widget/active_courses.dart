import 'package:course_app/constants/colors.dart';
import 'package:course_app/models/home_view_model.dart';
import 'package:course_app/screens/home/widget/category_titel.dart';
import 'package:course_app/screens/home/widget/levels_slider.dart';
import 'package:course_app/screens/courses/material.dart';
import 'package:course_app/screens/pay/waiting%20screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ActiveCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// top courses
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Column(children: [
              CatogaryTitel(leftText: "16".tr, rightText: ""),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  height: 350,
                  child: ListView.separated(
                    itemCount: controller.categoriesModel.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width * .4,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        controller.categoriesModel[index].image,
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey.shade100,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 8,
                                    )
                                  ]),
                              child: Container(
                                  height: 220,
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(WaitingScreen(
                                          doctorname: controller
                                              .categoriesModel[index]
                                              .doctorname,
                                          price: controller
                                              .categoriesModel[index].price,
                                          image: controller
                                              .categoriesModel[index].image,
                                          course: controller
                                              .categoriesModel[index].name));

                                      // Get.to(MaterialScreen(
                                      //   course: controller
                                      //       .categoriesModel[index].name,
                                      //   doctor: controller
                                      //       .categoriesModel[index].doctorname,
                                      // ));
                                    },
                                    // child: Image.network(

                                    //   fit: BoxFit.cover,
                                    // ),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              controller.categoriesModel[index].name,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              controller.categoriesModel[index].doctorname,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              controller.categoriesModel[index].price + " L.E",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      width: 20,
                    ),
                  ),
                ),
              ),

              /// most selling
              CatogaryTitel(leftText: "17".tr, rightText: ""),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  height: 350,
                  child: ListView.separated(
                    itemCount: controller.bestCourseModel.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width * .4,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          controller
                                              .bestCourseModel[index].image,
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.grey.shade100,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 4,
                                      )
                                    ]),
                                child: Container(
                                  height: 220,
                                  width: MediaQuery.of(context).size.width * .4,
                                  // child: Image.network(

                                  //   fit: BoxFit.fill,
                                  // )
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                controller.bestCourseModel[index].name,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                controller.bestCourseModel[index].doctorname,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                controller.bestCourseModel[index].price +
                                    " L.E",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Get.to(WaitingScreen(
                              doctorname:
                                  controller.bestCourseModel[index].doctorname,
                              price: controller.bestCourseModel[index].price,
                              image: controller.bestCourseModel[index].image,
                              course: controller.bestCourseModel[index].name));
                          print("ee" +
                              controller.bestCourseModel[index].doctorname);
                          print("ee" + controller.bestCourseModel[index].name);

                          // Get.to(MaterialScreen(
                          //     doctor:
                          //         controller.bestCourseModel[index].doctorname,
                          //     course: controller.bestCourseModel[index].name));
                        },
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      width: 20,
                    ),
                  ),
                ),
              )
            ]),
    );
  }
}
