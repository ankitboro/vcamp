import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vcamp/core/routes/app_routes.dart';
import 'package:vcamp/main.dart';

showInfoDialog({
  required String message,
  VoidCallback? onOkPressed,
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
              // Navigator.of(context).pop();
              if (onOkPressed != null) {
                onOkPressed();
              }
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
