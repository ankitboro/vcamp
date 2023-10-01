import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showErrorToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.red,
  );
}

showSuccessToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.red,
  );
}
