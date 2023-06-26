// import 'package:flutter/material.dart';
// import 'package:course_app/helper/sizeHelper.dart';
// import 'package:course_app/models/doctor.dart';
// import 'package:avatar_view/avatar_view.dart';

// class DoctorItem extends StatefulWidget {
//   late final Doctor doctorDetails;
//   DoctorItem(this.doctorDetails);

//   @override
//   State<DoctorItem> createState() => _DoctorItemState();
// }

// class _DoctorItemState extends State<DoctorItem> {
//   @override
//   Widget build(BuildContext context) {
//     final size = SizeHelper(context);
//     return Column(children: [
//       Container(
//         padding: EdgeInsets.all(size.getHeight(10)),
//         child: ListTile(
//           leading: AvatarView(
//             radius: size.getHeight(30),
//             imagePath:
//                 widget.doctorDetails.imagePath ?? 'assets/images/default.jpg',
//           ),
//           title: Text(
//             'د/ ${widget.doctorDetails.name}',
//             textDirection: TextDirection.rtl,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: size.getWidth(20),
//             ),
//           ),
//           onTap: (() {}),
//         ),
//       ),
//       // Container(
//       //   height: size.getHeight(300),
//       //
//       //   child:ListView.builder(
//       //       itemBuilder: (ctx,index) =>widget.doctorDetails.pdfImagesPath!.length ==0 ? Image.asset('assets/images/default.jpg'):
//       //       Image.asset(widget.doctorDetails.pdfImagesPath![index]),
//       //       itemCount:widget.doctorDetails.pdfImagesPath!.length),
//       //
//       // ),
//     ]);
//   }
// }
// /*
// ListView.builder(
//               itemBuilder: (ctx,index) =>widget.doctorDetails.pdfImagesPath!.length ==0 ? Image.asset('assets/images/default.jpg'):
//               Image.asset(widget.doctorDetails.pdfImagesPath![index]),
//           itemCount:1),
//  */
