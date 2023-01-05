import 'package:flutter/material.dart';

const kInputDecorationField = InputDecoration(
  hintText: '',
  hintStyle: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w600,
      fontSize: 20.0,
      fontStyle: FontStyle.italic,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff1b75bb), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff1b75bb), width: 3.5),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

