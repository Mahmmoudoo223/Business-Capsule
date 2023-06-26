// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:course_app/screens/pdfs/pdf_api.dart';
// import 'package:course_app/screens/pdfs/pdf_viewer_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class PdfWidget extends StatefulWidget {
//   String cat, doctor;

//   PdfWidget({required this.cat, required this.doctor});

//   @override
//   State<PdfWidget> createState() => _PdfWidgetState();
// }

// class _PdfWidgetState extends State<PdfWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('pdfs')
//             .where('cat', isEqualTo: widget.cat)
//             .where('doctor', isEqualTo: widget.doctor)
//             .snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) return Center(child: Text('Loading'));
//           switch (snapshot.connectionState) {
//             case ConnectionState.waiting:
//               return new Text('Loading...');
//             default:
//               return Expanded(
//                   child: GridView.builder(
//                       itemCount: snapshot.data!.docs.length,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 1,
//                         childAspectRatio: 11 / 3,
//                         crossAxisSpacing: 1,
//                         mainAxisSpacing: 1,
//                       ),
//                       itemBuilder: (BuildContext context, int index) {
//                         DocumentSnapshot posts = snapshot.data!.docs[index];

//                         return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               height: 220,
//                               child: InkWell(
//                                   onTap: () async {
//                                     final url = posts['pdf'];
//                                     final file = await PDFApi.loadNetwork(url);
//                                     openPDF(file);
//                                     // Get.to( PdfScreen(
//                                     //   pdf_url: posts['pdf'],
//                                     // ));
//                                   },
//                                   child: Wrap(
//                                     children: <Widget>[
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                             left: 15, right: 15),
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(10)),
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   color: Colors.grey
//                                                       .withOpacity(0.5),
//                                                   spreadRadius: 5,
//                                                   blurRadius: 7,
//                                                   offset: Offset(0,
//                                                       3), // changes position of shadow
//                                                 ),
//                                               ]),
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 height: 60,
//                                                 width: 50,
//                                                 decoration: BoxDecoration(
//                                                     image: DecorationImage(
//                                                         fit: BoxFit.fill,
//                                                         image: AssetImage(
//                                                             "assets/images/pdf.png"))),
//                                               ),
//                                               // SizedBox(
//                                               //   width: 10,
//                                               // ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                   left: 30,
//                                                   right: 30,
//                                                 ),
//                                                 child: Text(
//                                                   posts["name"],
//                                                   style: TextStyle(
//                                                       fontSize: 18,
//                                                       color: Colors.black),
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   )),
//                             ));
//                       }));
//           }
//         });
//     // );
//   }
// }
// //       );
// // }

// void openPDF(File file) => Get.to(PDFViewerPage(file: file));
// // }
