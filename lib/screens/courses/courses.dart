import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/screens/courses/doctors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/color_manager.dart';

class CoursesViewScreen extends StatefulWidget {
  String cat, level;

  CoursesViewScreen({required this.cat, required this.level});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<CoursesViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 50,
          elevation: 0,
          backgroundColor: Colors.transparent,
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
          title: Text(
            "20".tr,
            style: TextStyle(
                fontSize: 20,
                color: ColorManager.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          color: Colors.white38,
          child: Column(children: [
            SizedBox(height: 30),
            Flexible(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('courses')
                      .where('cat', isEqualTo: widget.cat)
                      .where('level', isEqualTo: widget.level)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData)
                      return Center(child: Text('Loading'));
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return new Text('Loading...');
                      default:
                        return GridView.builder(
                            itemCount: snapshot.data!.docs.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 14 / 3,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 1,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot posts =
                                  snapshot.data!.docs[index];

                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 330,
                                    height: 390,
                                    child: InkWell(
                                      child: Card(
                                        color: Colors.white,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ]),
                                          child: Column(
                                            children: [
                                              // Container(
                                              //   width: 420,
                                              //   height: 185,
                                              //   child: Image.network(
                                              //       posts['image'],
                                              //       fit: BoxFit.fill),
                                              // ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20, top: 8),
                                                    child: Text(
                                                      (posts['name']),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // Row(
                                              //   children: [
                                              //
                                              //     // Container(
                                              //     //   width: 100,
                                              //     //   height:20 ,
                                              //     //   child: Image.network(
                                              //     //       posts['image'],
                                              //     //       fit: BoxFit.fill),
                                              //     // ),
                                              //     Directionality(
                                              //       textDirection:
                                              //           TextDirection.rtl,
                                              //       child: Container(
                                              //         alignment:
                                              //             Alignment.centerRight,
                                              //         child: Padding(
                                              //           padding:
                                              //               const EdgeInsets
                                              //                   .only(right: 7),
                                              //           child: Text(
                                              //             (posts['name']),
                                              //             style: TextStyle(
                                              //               color: Colors.black,
                                              //               fontSize: 18,
                                              //               // fontWeight:
                                              //               // FontWeight.bold,
                                              //             ),
                                              //           ),
                                              //         ),
                                              //       ),
                                              //     ),
                                              //     SizedBox(
                                              //       height: 7,
                                              //     ),
                                              //
                                              //     // RatingBar(
                                              //     //   ignoreGestures:
                                              //     //   true,
                                              //     //   initialRating: posts
                                              //     //       .data()['star'],
                                              //     //   direction:
                                              //     //   Axis.horizontal,
                                              //     //   allowHalfRating:
                                              //     //   true,
                                              //     //   itemCount: 5,
                                              //     //   itemSize: 18,
                                              //     //   maxRating: 5,
                                              //     //   ratingWidget:
                                              //     //   RatingWidget(
                                              //     //     full: Icon(
                                              //     //       Icons.star,
                                              //     //       color: Colors
                                              //     //           .yellow,
                                              //     //     ),
                                              //     //     half: Icon(
                                              //     //       Icons
                                              //     //           .star_half_outlined,
                                              //     //       color: Colors
                                              //     //           .yellow,
                                              //     //     ),
                                              //     //     empty: Icon(
                                              //     //       Icons
                                              //     //           .star_border,
                                              //     //       color: Colors
                                              //     //           .yellow,
                                              //     //     ),
                                              //     //   ),
                                              //     //   //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                              //     //   onRatingUpdate:
                                              //     //       (rating) {
                                              //     //     print(rating);
                                              //     //   },
                                              //     // ),
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Get.to(DoctorsViewScreen(
                                          course: posts['name'],
                                        ));
                                      },
                                    ),
                                  ));
                            });
                    }
                  }),
            ),
            //),
            //  ]),
          ]),
        ));
  }
}
