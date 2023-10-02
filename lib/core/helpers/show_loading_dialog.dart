import 'package:flutter/material.dart';
import 'package:vcamp/main.dart';
import 'package:vcamp/widgets/loader.dart';

showLoadingDialog() {
  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    context: navigatorKey.currentContext!,
    builder: (appContext) {
      return Material(
        color: Colors.grey.withOpacity(0.4),
        child: const SizedBox(
          height: 150,
          child: Center(
            child: Loader(),
          ),
        ),
      );
    },
  );
}

hideLoadingDialog() {
  Navigator.of(navigatorKey.currentContext!).pop();
}
