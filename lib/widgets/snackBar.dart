// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Utils {

  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String text, Color color){
    final snackBar = SnackBar(
      content: Text(text, style: const TextStyle(fontSize: 14),), 
      backgroundColor: color,
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}