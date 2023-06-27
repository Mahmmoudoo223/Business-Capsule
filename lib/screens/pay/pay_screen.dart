import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/models/course_model.dart';
import 'package:course_app/models/promocode_model.dart';
import 'package:course_app/screens/courses/material.dart';
import 'package:course_app/screens/pay/vodafone_cash.dart';
import 'package:course_app/widgets/custom_button.dart';
import 'package:course_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PayScreen extends StatefulWidget {
  CourseModel courseModel;
  PayScreen({required this.courseModel});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  final TextEditingController promoCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isfetching = false;
  bool wrongPromo = false;
  PromoCodeModel? promoCodeModel;
  double? total;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      total= widget.courseModel.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String e = box.read('email');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
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
        child: isfetching
            ? Center(child: Text("Loading .."))
            : SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                        image: _getImage(widget.courseModel))),
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
                                    text: widget.courseModel.doctorname ??
                                        "Unkown Doctor",
                                    fontSize: 18,
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Custom_Text(
                                    text: total.toString() +" "+"56".tr,
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ]),
                              )),
                        ],
                      ),
                    ),
                    // Container(
                    //   height: 80,
                    //   child: Image.asset('assets/images/lock.png'),
                    // ),
                    _PromoCodeForm(),
                    SizedBox(
                      height: 30,
                    ),
                    _summeryRow(
                        "52".tr, widget.courseModel.name ?? "Unkown"),
                    _summeryRow("53".tr,
                        widget.courseModel.doctorname ?? "Unkown"),
                    _summeryRow(
                      "54".tr,
                      widget.courseModel.price != null
                          ? widget.courseModel.price!.toString()
                          : "Unkown",
                    ),
                    _summeryRow("55".tr,promoCodeModel!=null?promoCodeModel!.percent != null?"-"+_getDiscount(widget.courseModel.price!,promoCodeModel!.percent!).toString():"-0.0":"-0.0"),
                    Divider(
                      color: Colors.black,
                    ),
                    _summeryTotalRow(widget.courseModel),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Color.fromARGB(255, 116, 27, 27),
                        ),
                        onPressed: () async {
                          Get.to(VodafoneCash(
                            email: e,
                            price: widget.courseModel.price.toString(),
                            course: widget.courseModel.name.toString(),
                            image: widget.courseModel.image.toString(),
                            doctorname:
                                widget.courseModel.doctorname.toString(),
                            coursex: [],
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
      ),
    );
  }

  _getImage(CourseModel currentCourse) {
    try {
      if (currentCourse.image != null)
        return NetworkImage(currentCourse.image!);
      else
        return AssetImage("assets/images/pdf.png");
    } catch (e) {
      print("_getImage Throw");
      return AssetImage("assets/images/profile.png");
    }
  }

  Widget _summeryRow(String key, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Custom_Text(
              text: key + " : ",
              fontSize: 20,
              color: Colors.grey,
            ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Custom_Text(
                  text: value,
                  fontSize: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  _summeryTotalRow(CourseModel courseModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Custom_Text(
                text: "37".tr,
                fontSize: 24,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Custom_Text(
                text: total.toString() + " " + "56".tr,
                fontSize: 20,
                color: Color.fromARGB(255, 116, 27, 27),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _PromoCodeForm() {
    return Form(
      key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 7,
                        )
                      ]),
                  child: TextFormField(
                    controller: promoCodeController,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    onFieldSubmitted: (value) async =>
                        await _applyPromoCode(context, value.trim()),
                    decoration: InputDecoration(
                        hintText: "50".tr,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(0),
                        hintStyle: TextStyle(height: 1)),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Container(
                          height: 50,
                          width: 120,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Color.fromARGB(255, 116, 27, 27),
                            ),
                            onPressed: ()async=>await _applyPromoCode(context,promoCodeController.text.trim()),
                            child: Text("57".tr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                )),
                          ),
                        ),
                  ],
                ),
                Row(children: [Visibility(visible: wrongPromo,child: Text("51".tr,style: TextStyle(color: Colors.red,fontSize: 15),))],)
            ],
          ),
        ));
  }

  Future<void> _applyPromoCode(BuildContext context, String value) async {
    try {
      if (promoCodeController.text.isEmpty) {
      setState(() {
        wrongPromo = true;
      });
      return;
    }
    double price = widget.courseModel.price??0;
      setState(() {
        isfetching=true;
        total = price;
        promoCodeModel = null;
      });
      QuerySnapshot querySnapshot=  await FirebaseFirestore.instance
            .collection('promocodes')
            .where("name", isEqualTo: value)
            .get();
      if(querySnapshot.docs.isEmpty){
        setState(() {
          wrongPromo = true;
          isfetching=false;
        });
        return;
      }
      setState(() {
        promoCodeModel = PromoCodeModel.fromFirestore(querySnapshot.docs[0]);
        total = price - _getDiscount(price,promoCodeModel!.percent!);
        isfetching=false;
        wrongPromo = false;
      });
    } catch (e) {
      setState(() {
        wrongPromo = true;
        isfetching=false;
      });
      print('Error check promo from Firestore: $e');
      //rethrow;
    }
  }
}

double _getDiscount(double price, double value) {
  try{
    double per = price*value;
    double res = per/100;
    print("resssssss "+res.toString());
  return res;
  }catch(e){
    print("Error in _getDiscount");
    return 0.0;
  }
}
