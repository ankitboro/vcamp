import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vcamp/main.dart';

showInfoDialog({
  required String message,
  BuildContext? context,
}) {
  showDialog(
    context: context ?? navigatorKey.currentContext!,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text("Info!"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "OK",
            ),
          )
        ],
      );
    },
  );
}