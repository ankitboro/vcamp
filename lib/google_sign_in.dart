import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcamp/core/constants/app_constants.dart';
import 'package:vcamp/core/helpers/service_locator.dart';
import 'package:vcamp/core/network/base_client.dart';
import 'package:vcamp/core/network/get_parsed_data.dart';

Future<String> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the   UserCredential
  UserCredential user =
      await FirebaseAuth.instance.signInWithCredential(credential);
  return await user.user?.getIdToken() ?? '';
}

signIn(String token) async {
  try {
    final response = await locator<BaseClient>().postRequest(
      path: "/auth/",
      data: {
        "token": "Bearer $token",
      },
    );
    // print(response.statusCode);
    if (response?.statusCode == 200) {
      locator<SharedPreferences>().setString(
          AppConstants.accessToken, response?.data['data']['access_token']);
      String? fcmToken = await getFcmToken();
      if (fcmToken != null) {
        registerFcmToken(fcmToken);
      }
    }
  } catch (e) {
    print(e.toString());
  }
}

registerFcmToken(String fcmToken) async {
  final response =
      await locator<BaseClient>().postRequest(path: "/set-fcm-token/", data: {
    "fcm-token": fcmToken,
  });
  // return getParsedData(response, );
  print(response);
}

Future<String?> getFcmToken() async {
  return FirebaseMessaging.instance.getToken();
}
