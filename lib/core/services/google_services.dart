import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleServices {
  Future<String?> signInWithGoogle() async {
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
    return await user.user?.getIdToken();
  }

  Future<String?> getFcmToken() async {
    return FirebaseMessaging.instance.getToken();
  }
}
