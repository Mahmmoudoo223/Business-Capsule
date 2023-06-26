// import 'package:course_app/helper/sizeHelper.dart';
// import 'package:course_app/screens/doctors_screen.dart';
// import 'package:flutter/material.dart';

// import '../../../models/course.dart';
// import '../../../models/levels.dart';

// class CourseWidget extends StatelessWidget {
//   late final Course course;
//   CourseWidget(this.course);
//   @override
//   Widget build(BuildContext context) {
//     final size = SizeHelper(context);
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context).push(
//             MaterialPageRoute(builder: (context) => DoctorsScreen(course)));
//       },
//       child: Container(
//         height: size.getHeight(60),
//         padding: EdgeInsets.only(right: size.getWidth(10)),
//         margin: EdgeInsets.only(bottom: size.getHeight(10)),
//         child: Card(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             textDirection: TextDirection.rtl,
//             children: <Widget>[
//               Text(
//                 course.courseName,
//                 textDirection: TextDirection.rtl,
//                 style: TextStyle(
//                   fontSize: size.getWidth(18),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               //       Container(
//               //           padding: EdgeInsets.only(left: 10),
//               //           child: const Text('اضغط للتعرف على دكاترة المادة',
//               //               textDirection: TextDirection.ltr)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
