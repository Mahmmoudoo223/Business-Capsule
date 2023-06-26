// import 'package:course_app/models/levels.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomSubjectBar extends StatelessWidget {
//   final Levels levels;
//   CustomSubjectBar(this.levels);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Stack(children: [
//       Column(
//         children: [
//           Container(
//             height: 270,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(40),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.2),
//                     blurRadius: 8,
//                   )
//                 ]),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(40),
//               child: Image.asset(
//                 levels.Image,
//                 fit: BoxFit.fitHeight,
//               ),
//             ),
//           ),
//           Container(
//             height: 20,
//           ),
//         ],
//       ),
//       Positioned(
//           top: MediaQuery.of(context).padding.top,
//           left: 25,
//           child: Container(
//             height: 50,
//             width: 50,
//             padding: EdgeInsets.only(left: 2),
//             decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.3),
//                 borderRadius: BorderRadius.circular(20)),
//             child: IconButton(
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.white,
//               ),
//               iconSize: 25,
//               onPressed: () => {Navigator.of(context).pop()},
//             ),
//           )),
//       // Positioned(
//       //     top: MediaQuery.of(context).padding.top,
//       //     right: 25,
//       //     child: Container(
//       //       height: 50,
//       //       width: 50,
//       //       padding: EdgeInsets.only(left: 1),
//       //       decoration: BoxDecoration(
//       //           color: Colors.black.withOpacity(0.3),
//       //           borderRadius: BorderRadius.circular(20)),
//       // child: IconButton(
//       //   icon: Icon(
//       //     Icons.bookmark,
//       //     color: Colors.white,
//       //   ),
//       //   iconSize: 20,
//       //   onPressed: () {},
//       // ),
//     ]));
//   }
// }
