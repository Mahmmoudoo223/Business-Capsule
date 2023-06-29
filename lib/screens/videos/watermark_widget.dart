import 'package:flutter/material.dart';
import 'dart:math';

class Watarmark extends StatelessWidget {
  final int rowCount;
  final int columnCount;
  final String text;
  

 Watarmark({Key? key,required this.rowCount,required this.columnCount,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
        children: creatColumnWidgets(),
      )),
    );
  }

  List<Widget> creatRowWdiges() {
    List<Widget> list = [];
    for (var i = 0; i < rowCount; i++) {
      final widget = Expanded(
          child: Text(
            text,
            style: TextStyle(
            color: Color(0x30000000),
            fontSize: 50,
            decoration: TextDecoration.none),
          ));
      list.add(widget);
    }
    return list;
  }

  List<Widget> creatColumnWidgets() {
    List<Widget> list = [];
    for (var i = 0; i < columnCount; i++) {
      final widget = Expanded(
        flex: 2,
          child: Row(
        children: creatRowWdiges(),
      ));
      list.add(widget);
    }
    final wid2 = Expanded(flex: 2,child: SizedBox(),);
    list.add(wid2);
    return list;
  }
  
}