import 'package:course_app/constants/colors.dart';
import 'package:course_app/models/levels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CourseDescreotion extends StatelessWidget {
  final Levels levels;
  CourseDescreotion(this.levels);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 15,
                width: 20,
              ),
              Text(
                levels.Titel,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22, color: kFont),
              ),
              Container(
                height: 5,
                width: 5,
                decoration:
                    BoxDecoration(color: kFontLight, shape: BoxShape.circle),
              ),
            ],
          )
        ],
      ),
    );
  }
}
