//
//
// import 'package:course_advanced/weather/presentation/resources/color_manager.dart';
// import 'package:course_advanced/weather/presentation/resources/styles_manager.dart';
// import 'package:flutter/material.dart';
//
// import 'custom_text.dart';
//
//   class CustomButton extends StatelessWidget {
//
//   final String  text;
//   final Function  onPressed;
//   final Color  color1,color2;
//
//   const CustomButton({
//     required this.text,
//     required this.onPressed,
//     required this.color1,
//     required this.color2,
//   });
//
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Container(
//         width:312,
//         height:46,
//         child: RaisedButton(
//           elevation: 10,
//           onPressed: onPressed(),
//           color: color1,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30)),
//           child: Padding(
//             padding: EdgeInsets.all(10),
//             child: Text(
//               text,
//               style: getRegularStyle(color: color2,fontSize:20)
//             ),
//           ),
//         ),
//       );
//
//
//
//     }
// }