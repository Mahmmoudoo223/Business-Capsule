import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


class TextForm extends StatelessWidget {
  const TextForm({
    Key? key,
    required this.controller,
    required this.text,
    required this.onSave,
    required this.validator,
    required this.textinputtype,
    required this.obscure,
  }) : super(key: key);
  final TextEditingController controller;
  final String text;
  final Function onSave;
  final Function validator;
  final TextInputType textinputtype;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 7,
            )
          ]),
      child: TextFormField(
        controller: controller,
        keyboardType: textinputtype,
        obscureText: obscure,
        onSaved: onSave(Null),
        validator: validator(Null),
        decoration: InputDecoration(
            hintText: text,
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(0),
            hintStyle: TextStyle(height: 1)),
      ),
    );
  }
}
