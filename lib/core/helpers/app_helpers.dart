import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcamp/core/helpers/service_locator.dart';
import 'package:vcamp/core/routes/app_routes.dart';
import 'package:vcamp/main.dart';

logout() {
  locator<SharedPreferences>().clear();
  Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(
    AppRoutes.loginScreen,
    (route) => false,
  );
}

Future<bool> getConfirmationDialog({
  BuildContext? context,
  required String title,
}) async {
  return await showDialog(
    context: navigatorKey.currentContext!,
    builder: (context) {
      return AlertDialog(
        surfaceTintColor: Colors.grey,
        title: Text(
          "Are you sure?",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        content: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: <Widget>[
          MaterialButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          MaterialButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  ).then(
    (value) => value ?? false,
  );
}
