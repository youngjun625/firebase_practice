import 'package:flutter/material.dart';
//todo L14
const textInputDecoration = InputDecoration(
  //0hintText: 'Email', we dont want this hard coded so it can be different for all textforms
  fillColor: Colors.white,
  filled: true, //must be true to show fillColor
  enabledBorder: OutlineInputBorder( //applied when not in focused.
    borderSide: BorderSide(color: Colors.white, width: 2.0)
  ),
  focusedBorder: OutlineInputBorder( //applied when focused.
    borderSide: BorderSide(color: Colors.pink, width: 2.0)
  ),
);