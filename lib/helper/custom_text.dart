import 'package:flutter/material.dart';

class Custom_Text extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final double height;
  const Custom_Text(
      {this.text = "",
      this.fontSize = 18.0,
      this.color = Colors.black,
      this.alignment = Alignment.topLeft,
      this.height = 1});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        alignment: alignment,
        child: Text(
          text,
          style: TextStyle(
              color: color,
              height: height,
              fontSize: fontSize,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
