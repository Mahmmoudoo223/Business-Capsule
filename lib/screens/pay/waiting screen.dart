// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:course_app/resources/color_manager.dart';
// import 'package:course_app/screens/courses/material.dart';
// import 'package:course_app/screens/pay/pay_screen.dart';
// import 'package:course_app/widgets/custom_text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class WaitingScreen extends StatefulWidget {
//   String doctorname, image, price, course;

//   WaitingScreen(
//       {required this.doctorname,
//       required this.image,
//       required this.price,
//       required this.course});

//   @override
//   _PostsScreenState createState() => _PostsScreenState();
// }

// class _PostsScreenState extends State<WaitingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final box = GetStorage();
//     String e = box.read('email') ?? "";

//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.grey,
//           toolbarHeight: 1,
//         ),
//         backgroundColor: Colors.white,
//         body: Column(children: [
//           SizedBox(height: 30),
//           Flexible(
//               child: StreamBuilder(
//                   stream: FirebaseFirestore.instance
//                       .collection('user')
//                       .where('email', isEqualTo: e)
//                       .snapshots(),
//                   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                     if (!snapshot.hasData)
//                       return Center(child: Text('Loading'));
//                     switch (snapshot.connectionState) {
//                       case ConnectionState.waiting:
//                         return Center(child: new CircularProgressIndicator());
//                       default:
//                         return ListView.builder(
//                           itemCount: snapshot.data!.docs.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             DocumentSnapshot posts = snapshot.data!.docs[index];

//                             List courses = posts['course'];

//                             return Column(
//                               children: [
//                                 SizedBox(
//                                   height: 15,
//                                 ),
//                                 Container(
//                                   height: 80,
//                                   // width: 200,
//                                   child: Image.asset(
//                                     'assets/images/lock.png',
//                                     // fit:BoxFit.fill,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 15,
//                                 ),
//                                 Center(
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(17.0),
//                                     child: Center(
//                                       child: Text(
//                                         "46".tr,
//                                         style: TextStyle(
//                                             fontSize: 19,
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Container(
//                                   height: 60,
//                                   width: 100,
//                                   child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Color.fromARGB(255, 116, 27, 27),
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(10)),
//                                     ),
//                                     onPressed: () {
//                                       //   if (controller.codeModel[index].codes.contains(code.text.toString())) {
//                                       if (posts['pay'] == true &&
//                                           posts['course']
//                                               .contains(widget.doctorname)) {
//                                         print("paid");

//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     MaterialScreen(
//                                                         doctor: widget
//                                                             .doctorname
//                                                             .toString(),
//                                                         cat: widget.course
//                                                             .toString())));
//                                       } else {
//                                         Get.to(PayScreen(
//                                           doctorname: widget.doctorname,
//                                           image: widget.image,
//                                           price: widget.price,
//                                           pay: posts['pay'],
//                                           course: widget.course,
//                                           courses: courses,
//                                           email: posts['email'],
//                                           cat: widget.course.toString(),
//                                         ));
//                                       }
//                                     },
//                                     child: Text("45".tr,
//                                         style: TextStyle(
//                                             color: Colors.white, fontSize: 20)),
//                                   ),
//                                 ),
//                               ],
//                             );
//                             //   Padding(
//                             //   padding: const EdgeInsets.only(
//                             //       left: 20, right: 12),
//                             //   child: InkWell(
//                             //     onTap: () {
//                             //       Get.to  ( PayScreen(
//                             //         name: posts['name'],
//                             //         price: posts['price'],
//                             //         image: posts['image'],
//                             //       ));
//                             //
//                             //       // Get.to(MaterialScreen(
//                             //       //     doctor: posts["name"],
//                             //       //     cat: posts["course"]));
//                             //
//                             //
//                             //     },
//                             //     child:
//                             //     Container(
//                             //       height: 180,
//                             //       child: Stack(
//                             //         children: [
//                             //           Positioned(
//                             //               top: 30,
//                             //               child: Material(
//                             //                 child: Container(
//                             //                   height: 180,
//                             //                   width: 350,
//                             //                   decoration: BoxDecoration(
//                             //                       color: Colors.white,
//                             //                       borderRadius:
//                             //                       BorderRadius.circular(
//                             //                           0.0),
//                             //                       boxShadow: [
//                             //                         BoxShadow(
//                             //                           color: Colors.grey
//                             //                               .withOpacity(0.3),
//                             //                           offset: Offset(
//                             //                               -10.0, 10.0),
//                             //                           blurRadius: 20,
//                             //                           spreadRadius: 4.0,
//                             //                         )
//                             //                       ]),
//                             //                 ),
//                             //               )),
//                             //           Positioned(
//                             //             top: 10,
//                             //             left: 15,
//                             //             child: Card(
//                             //               elevation: 10,
//                             //               shadowColor:
//                             //               Colors.grey.withOpacity(0.5),
//                             //               shape: RoundedRectangleBorder(
//                             //                 borderRadius:
//                             //                 BorderRadius.circular(15.0),
//                             //               ),
//                             //               child: Container(
//                             //                 height: 120,
//                             //                 width: 100,
//                             //                 decoration: BoxDecoration(
//                             //                     borderRadius:
//                             //                     BorderRadius.circular(
//                             //                         10.0),
//                             //                     image: DecorationImage(
//                             //                         fit: BoxFit.fill,
//                             //                         image: NetworkImage(
//                             //                             posts["image"]))),
//                             //               ),
//                             //             ),
//                             //           ),
//                             //           Positioned(
//                             //               top: 60,
//                             //               left: 170,
//                             //               child: Container(
//                             //                 height: 150,
//                             //                 width: 180,
//                             //                 child: Column(children: [
//                             //                   Custom_Text(
//                             //                     text: posts["name"],
//                             //                     fontSize: 18,
//                             //                   ),
//                             //                   Divider(
//                             //                     color: Colors.black,
//                             //                   ),
//                             //                   SizedBox(
//                             //                     height: 5,
//                             //                   ),
//                             //                   Custom_Text(
//                             //                     text:
//                             //                     posts["price"] + " L.E",
//                             //                     fontSize: 15,
//                             //                     color: Colors.grey,
//                             //                   ),
//                             //                 ]),
//                             //               )),
//                             //         ],
//                             //       ),
//                             //     ),
//                             //   ),
//                             // );
//                           },
//                           // separatorBuilder:
//                           //     (BuildContext context, int index) => SizedBox(
//                           //   height: 20,
//                           // ),
//                         );
//                     }
//                   }))
//         ]));
//   }
// }
