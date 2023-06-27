import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/models/course_model.dart';
import 'package:course_app/screens/pay/pay_screen.dart';
import 'package:course_app/screens/videos/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoWidget extends StatefulWidget {
  String sectionID;
  CourseModel courseModel;
  bool haveSubscription;

  VideoWidget({required this.sectionID,this.haveSubscription=false,required this.courseModel});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('videos')
            .where('sectionID', isEqualTo: widget.sectionID)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Center(child: Text('Loading'));
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
            var res = snapshot.data!.docs;
            if(res.length>=2)
            {try{
              res.sort((a, b) => a["order"].compareTo(b["order"]));
            }catch(e){
              print("Sorting Error");
            }
            }
              return res.length>0 ?
              Column(children: res.map((e) {
                return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                         // height: 220,
                          child: InkWell(
                              onTap: () {
                                    if (widget.haveSubscription || isfreefile(e)) {
                                      Get.to(VideoScreen(
                                        url: e['video'],
                                        title: e['name'],
                                      ));
                                    } else {
                                      Get.to(PayScreen(
                                          courseModel: widget.courseModel,
                                        ));
                                    }
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
                                            width: 60,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        "assets/images/play.jpg"))),
                                          ),
                                          // SizedBox(
                                          //   width: 10,
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
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
          }
        });
  }
}

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
