import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcamp/blocs/generate_meal_plan_cubit/generate_meal_plan_cubit.dart';
import 'package:vcamp/blocs/generate_recipe_cubnit/generate_recipe_cubit.dart';
import 'package:vcamp/blocs/profile_cubit/profile_cubit.dart';
import 'package:vcamp/blocs/user_meal_plan_cubit/user_meal_plan_cubit.dart';
import 'package:vcamp/blocs/user_recipe_cuibit/user_recipe_cubit.dart';
import 'package:vcamp/core/constants/app_constants.dart';
import 'package:vcamp/core/helpers/service_locator.dart';
import 'package:vcamp/core/helpers/theme_data.dart';
import 'package:vcamp/core/routes/app_router.dart';
import 'package:vcamp/core/routes/app_routes.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  // if (message.notification != null) {
  //   CloudNotification().showNotification(message);
  // }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await setupLocator();
  FirebaseMessaging.onBackgroundMessage(
    firebaseMessagingBackgroundHandler,
  );
  String? accessToken =
      locator<SharedPreferences>().getString(AppConstants.accessToken);
  runApp(
    const MyApp(),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
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
            BlocProvider.value(
              value: locator<UserRecipeCubit>(),
            ),
            BlocProvider.value(
              value: locator<GenerateRecipeCubit>(),
            ),
            BlocProvider.value(
              value: locator<UserMealPlanCubit>(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'VCAMP',
            navigatorKey: navigatorKey,
            theme: appTheme,
            scrollBehavior: BouncingScrollBehavior(),
            onGenerateRoute: onGenerateRoute,
            initialRoute: AppRoutes.loaderScreen,
            builder: (context, widget) {
              return MediaQuery(
                ///Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1.0,
                ),
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
