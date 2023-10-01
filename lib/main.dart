import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcamp/blocs/generate_meal_plan_cubit/generate_meal_plan_cubit.dart';
import 'package:vcamp/blocs/profile_cubit/profile_cubit.dart';
import 'package:vcamp/core/constants/app_constants.dart';
import 'package:vcamp/core/helpers/service_locator.dart';
import 'package:vcamp/core/helpers/theme_data.dart';
import 'package:vcamp/core/routes/app_router.dart';
import 'package:vcamp/core/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await setupLocator();
  String? accessToken =
      locator<SharedPreferences>().getString(AppConstants.accessToken);
  runApp(
    MyApp(
      accessToken: accessToken,
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final String? accessToken;
  const MyApp({
    super.key,
    this.accessToken,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: locator<GenerateShoppingListCubit>(),
            ),
            BlocProvider.value(
              value: locator<ProfileCubit>(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'VCAMP',
            navigatorKey: navigatorKey,
            theme: appTheme,
            scrollBehavior: BouncingScrollBehavior(),
            onGenerateRoute: onGenerateRoute,
            initialRoute: accessToken != null
                ? AppRoutes.homeScreen
                : AppRoutes.loginScreen,
            builder: (context, widget) {
              return MediaQuery(
                ///Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
          ),
        );
      },
    );
  }
}

class BouncingScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
