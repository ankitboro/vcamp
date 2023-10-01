import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vcamp/core/helpers/service_locator.dart';
import 'package:vcamp/core/routes/app_router.dart';
import 'package:vcamp/core/routes/app_routes.dart';
import 'package:vcamp/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VCAMP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      scrollBehavior: BouncingScrollBehavior(),
      onGenerateRoute: onGenerateRoute,
      initialRoute: AppRoutes.loginScreen,
    );
  }
}

class BouncingScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
