import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/screens/home/widget/Bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:get/get.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({Key? key}) : super(key: key);

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  bool isfetching = true;
  String? description,promoCode,title,image;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAds();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor:isfetching? Color(0xFFDAEFE8):Colors.white,
      body:isfetching?Center(child: Text("Loading")): Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(image??
                "https://img.freepik.com/free-vector/special-offer-creative-sale-banner-design_1017-16284.jpg?1"),
          ),
          buttonArrow(context),
          scroll(),
        ],
      ),
    ));
  }

  buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              // child: const Icon(
              //   Icons.skip_next_outlined,
              //   size: 20,
              //   color: Colors.black,
              // ),
            ),
          ),
        ),
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Color(0xFFDAEFE8),
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(25),
                  topRight: const Radius.circular(25)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    title??"Offer",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    description??"",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text(
                    "Code",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    promoCode??"",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.off(BottomBar());
                    },
                    child: AnimatedContainer(
                      margin: EdgeInsets.all(20),
                      width: 180,
                      height: 48,
                      duration: Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient:
                            LinearGradient(colors: [Colors.red, Colors.blue]),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Skip",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
  
  void getAds()async{
    try{
          setState(() {
      isfetching = true;
    });
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('ads')
          .where("active", isEqualTo: true).get();
    if(querySnapshot.docs.isEmpty){
      Get.off(BottomBar());
    }
    Map data = querySnapshot.docs[0].data() as Map<String, dynamic>;
    //print("_questionList ============== " + _questionList.length.toString());
    setState(() {
      description = data["description"]!=null?data["description"]:null;
      image =data["image"]!=null? data["image"]:null;
      promoCode = data["code"]!=null?data["code"]:null;
      title = data["title"]!=null?data["title"]:null;
      isfetching = false;
    });
    }catch(e){
      print("_questionList ============== EEErrrooorrr");
      setState(() {
      isfetching = false;
    });

    }
  }
}
