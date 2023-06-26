

import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatefulWidget {

  final String text;
  final String hint;
  final Function onSave;
  bool obs ;
  bool obx;
  final Function validator;
  final TextEditingController controller;
  final Color color;

  CustomTextFormField({required this.text,
    required this.hint,
    required this.onSave,
    required this.obx,
    required this.obs,
    required this.controller,
    required this.validator,
    required this.color,
  }
      ) ;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        child:  Column(
            children:[
              Custom_Text(
                  text:widget.text,fontSize: 14,color:Colors.grey
              ),


              if(widget.obx==true)
                TextFormField(
                  onSaved: widget.onSave(),
                  validator:widget.validator() ,
                  //    textDirection:TextDirection.rtl,
                  obscureText:widget.obs,
                  controller: widget.controller,
                  // textAlign:TextAlign.end,

                  decoration: InputDecoration(
                    hintText:widget.hint,
                    hintStyle: TextStyle(color:Colors.grey),
                    fillColor:Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(
                        widget.obs ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.obs= !widget.obs;
                        });
                      },
                    ),

                  ),

                ),

              if(widget.obx==false)
                TextFormField(
                  onSaved: widget.onSave(),
                  validator:widget.validator() ,
                  //    textDirection:TextDirection.rtl,
                  obscureText:widget.obs,
                  controller: widget.controller,
                  // textAlign:TextAlign.end,
                  decoration: InputDecoration(
                    hintText:widget.hint,
                    hintStyle: TextStyle(color:Colors.grey),
                    fillColor:Colors.white,
                  ),

                )
            ]
        )
    );
  }
}
