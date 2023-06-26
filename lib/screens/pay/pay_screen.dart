import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/screens/courses/material.dart';
import 'package:course_app/screens/pay/vodafone_cash.dart';
import 'package:course_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PayScreen extends StatefulWidget {
  String? doctorname, image, price, email, cat, course;
  bool? pay;
  List? courses;

  PayScreen(
      {this.doctorname,
      this.image,
      this.price,
      this.course,
      this.email,
      this.pay,
      this.cat,
      this.courses});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String e = box.read('email');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 1,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0)),
            gradient: LinearGradient(
              colors: [Colors.red, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              height: 180,
              child: Stack(
                children: [
                  Positioned(
                      top: 30,
                      child: Material(
                        child: Container(
                          height: 180,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  offset: Offset(-10.0, 10.0),
                                  blurRadius: 20,
                                  spreadRadius: 4.0,
                                )
                              ]),
                        ),
                      )),
                  Positioned(
                    top: 10,
                    left: 15,
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(widget.image!))),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 60,
                      left: 170,
                      child: Container(
                        height: 150,
                        width: 180,
                        child: Column(children: [
                          Custom_Text(
                            text: widget.doctorname!,
                            fontSize: 18,
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Custom_Text(
                            text: widget.price! + " L.E",
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ]),
                      )),
                ],
              ),
            ),
            Container(
              height: 80,
              child: Image.asset('assets/images/lock.png'),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 120,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Color.fromARGB(255, 116, 27, 27),
                onPressed: () async {
                  Get.to(VodafoneCash(
                    email: e,
                    price: widget.price.toString(),
                    course: widget.course.toString(),
                    image: widget.image.toString(),
                    doctorname: widget.doctorname.toString(),
                    coursex: widget.courses!,
                  ));

                  // final CollectionReference _updates =
                  // FirebaseFirestore.instance.collection('user');

                  // await _updates //.where('course',isEqualTo:'ahmed')
                  //     .where('email',isEqualTo:e)
                  //     .get().then((snapshot) {
                  //
                  //       widget.course!.add(widget.name);
                  //       print('vvv='+widget.course.toString());
                  //   snapshot.docs.last.reference.update({
                  //     'pay':true,
                  //      'course':widget.course,
                  //       'price':widget.price,
                  //   });
                  // });
                },
                child: Text("47".tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
