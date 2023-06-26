import 'package:course_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CatogaryTitel extends StatelessWidget {
  final String leftText;
  final String rightText;

  const CatogaryTitel(
      {super.key, required this.leftText, required this.rightText});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: kFont,
            ),
          ),
          Text(rightText)
        ],
      ),
    );
  }
}
