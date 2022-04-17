import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {

  static error(String text) {
      Fluttertoast.showToast(
        msg: text,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}