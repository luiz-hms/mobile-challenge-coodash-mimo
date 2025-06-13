// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

InputDecoration FieldsDecoration(String hint, [Icon? prefix, Widget? sufix]) {
  return InputDecoration(
    prefixIcon: prefix,
    prefixIconColor: Color(0xfff56E0f),
    suffixIcon: sufix,
    suffixIconColor: Color(0xfff56E0f),
    hintText: hint,
    hintStyle: TextStyle(color: Color(0xff151419)),
    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
