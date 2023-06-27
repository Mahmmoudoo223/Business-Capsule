import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/models/course_model.dart';
import 'package:course_app/screens/pay/pay_screen.dart';
import 'package:course_app/screens/pdfs/pdf_api.dart';
import 'package:course_app/screens/pdfs/pdf_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class PdfWidget extends StatefulWidget {
  String sectionID;
  bool haveSubscription;
  CourseModel courseModel;

  PdfWidget({required this.sectionID,this.haveSubscription=false,required this.courseModel});

  @override
  State<PdfWidget> createState() => _PdfWidgetState();
}

class _PdfWidgetState extends State<PdfWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(
              'pdfs',
            )
            .where(
              'sectionID',
              isEqualTo: widget.sectionID,
            )
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Center(child: Text('Loading'));
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return snapshot.data!.docs.length>0 ?
              Column(children: snapshot.data!.docs.map((e) {
                 return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                         // height: 220,
                          child: InkWell(
                              onTap: () async {
                                if(widget.haveSubscription || isfreefile(e)){
                                  final url = e['pdf'];
                                  final file = await PDFApi.loadNetwork(url);
                                  openPDF(file);
                                }else{
                                  Get.to(PayScreen(
                                          courseModel: widget.courseModel,
                                        ));
                                }
                                // Get.to( PdfScreen(
                                //   pdf_url: posts['pdf'],
                                // ));
                              },
                              child: Wrap(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
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
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        "assets/images/pdf.png"))),
                                          ),
                                          // SizedBox(
                                          //   width: 10,
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 30,
                                              right: 30,
                                            ),
                                            child: Text(
                                              e["name"],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Spacer(),
                                          widget.haveSubscription==true || isfreefile(e)?SizedBox():lockIcon()
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ));
              }).toList(),)
              :Text('Empty');
              // return GridView.builder(
              //     itemCount: snapshot.data!.docs.length,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 1,
              //       childAspectRatio: 11 / 3,
              //       crossAxisSpacing: 1,
              //       mainAxisSpacing: 1,
              //     ),
              //     itemBuilder: (BuildContext context, int index) {
              //       DocumentSnapshot posts = snapshot.data!.docs[index];

                    
              //     });
          
          }
        });
    // );
  }
}
//       );
// }

void openPDF(File file) => Get.to(PDFViewerPage(file: file));
// }
bool isfreefile(QueryDocumentSnapshot<Object?> e) {
  try{
    return e["free"]!=null && e["free"]==true;
  }catch(e){
    return false;
  }
}

Widget lockIcon() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Icon(
      Icons.lock,
      color: Colors.grey,
    ),
  );
}