// import 'package:course_app/provider/course_provider.dart';
// import 'package:course_app/screens/detail/widget/course_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'package:course_app/models/course.dart';
// import 'package:provider/provider.dart';

// import '../../../models/levels.dart';

// class CourseSub extends StatelessWidget {
//   late final Levels level;
//   CourseSub(this.level);
//   // final lvlCourses = Course.getCourseById(2);
//   @override
//   Widget build(BuildContext context) {
//     final lvlCourses = Provider.of<CourseProvider>(context).getCourseById(level.levelNumber);
//     return Container(
//       height: 500,
//       child: ListView.builder(
//         itemCount: lvlCourses!.length,
//         // shrinkWrap: true,
//         itemBuilder: (context, index) => CourseWidget(lvlCourses[index]),
//       ),
//     );
//   }
// }
