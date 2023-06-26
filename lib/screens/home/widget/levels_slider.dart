import 'package:course_app/constants/colors.dart';
import 'package:course_app/models/levels.dart';
import 'package:course_app/screens/detail/details_subject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../courses/choice.dart';

class LevelItem extends StatelessWidget {
  final Levels levels;
  LevelItem(this.levels);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 7,
              )
            ], color: kPrimaryLight, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.to(ChoiceScreen(
                          level: levels.id,
                          levels: levels,
                        ));
                      },
                      child: Image.asset(
                        levels.Image,
                        fit: BoxFit.fill,
                        height: 250,
                        width: 250,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            levels.Titel,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: kFont),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          // Positioned(
          //   bottom: 50,
          //   right: 20,
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //         primary: kAccent,
          //         elevation: 0,
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(15),
          //         )),
          //     onPressed: () {
          //       Navigator.of(context).push(MaterialPageRoute(
          //           builder: (context) => DetailsSubject(levels)));
          //     },
          //     child: Text("Enter"),
          //   ),
          // ),
        ],
      ),
    );
  }
}
