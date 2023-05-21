import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObscure;
  final IconData icon;
  final TextInputType textInputType;

  const TextInputField(
      {Key? key,
      required this.controller,
      required this.labelText,
      required this.icon,
      required this.textInputType,
      this.isObscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon,),
          labelStyle: const TextStyle(fontSize: 20, ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide()),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide())),
      obscureText: isObscure,
    );
  }
}
