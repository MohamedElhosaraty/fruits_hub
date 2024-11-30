import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:twitter_login/twitter_login.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
          "Exception in FirebaseAuthServices.createUserWithEmailAndPassword : ${e
              .toString()} and code : ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomException(
            message: 'الرقم السري ضعيف. الرجاء المحاولة مرة أخرى.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message:
            'لقد قمت بالتسجيل مسبقا. الرجاء التحقق من البريد الإلكتروني.');
      } else if (e.code == "network-request-failed") {
        throw CustomException(
            message: "لا يوجد اتصال بالانترنت. الرجاء المحاولة مرة أخرى.");
      } else if (e.code == "invalid-email") {
        throw CustomException(
            message: "البريد الإلكتروني غير صالح. الرجاء المحاولة مرة أخرى.");
      } else {
        throw CustomException(
            message: "لقد حدث خطأ. الرجاء المحاولة مرة أخرى.");
      }
    } catch (e) {
      log(
          "Exception in FirebaseAuthServices.createUserWithEmailAndPassword : ${e
              .toString()}");

      throw CustomException(
          message: "لقد حدث خطأ. الرجاء المحاولة مرة أخرى.");
    }
  }

  //-------- sign in with email and password -------

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthServices.signInWithEmailAndPassword : ${e
          .toString()} and code : ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'الرقم السري او البريد الإلكتروني غير صحيح.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'الرقم السري او البريد الإلكتروني غير صحيح.');
      } else if (e.code == "network-request-failed") {
        throw CustomException(
            message: "لا يوجد اتصال بالانترنت. الرجاء المحاولة مرة أخرى.");
      } else if (e.code == "invalid-email") {
        throw CustomException(
            message: "البريد الإلكتروني غير صالح. الرجاء المحاولة مرة أخرى.");
      } else {
        throw CustomException(
            message: "لقد حدث خطأ. الرجاء المحاولة مرة أخرى.");
      }
    } catch (e) {
      log("Exception in FirebaseAuthServices.signInWithEmailAndPassword : ${e
          .toString()}");
      throw CustomException(
          message: "لقد حدث خطأ. الرجاء المحاولة مرة أخرى.");
    }
  }

  //----------------- Sign in with google ---------------------

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow هنا بيظهر ال الشاشه عشان يدخل الايميل بتاعه
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request  هنا بعمل عمليه الربط
    final GoogleSignInAuthentication? googleAuth = await googleUser
        ?.authentication;

    // Create a new credential بربط البيانات بالفير عشان يرجع ال credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }


  //----------------- Sign in with facebook ---------------------

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance
        .login(); // by default we request the email and the public profile

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider
        .credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(
        facebookAuthCredential)).user!;
  }

  //----------------- Sign in with apple ---------------------

  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return (await FirebaseAuth.instance.signInWithCredential(oauthCredential)).user!;
  }


  // --------------------- Sign in with Twitter ---------------------


Future<User> signInWithTwitter() async {

    final TwitterLogin twitterLogin = TwitterLogin(
        apiKey: "khjOHpXq2yQXa1NxndEckEv9Z",
        apiSecretKey:'ZetFy3DwtBfDE4KOUyfEegIQANhusVCyr54Jeg5Wu52GG8Nqux',
        redirectURI: 'https://developer.x.com/en/portal/projects/1858922644709494784/apps/29639731'
    );
    // Trigger the sign-in flow
    final result = await twitterLogin.login();
    // Create a credential from the access token
    final token = TwitterAuthProvider.credential(
      accessToken: result.authToken!,
      secret: result.authTokenSecret!,
    );
    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(token)).user!;
  }


  // ----------------- delete user ---------------------

  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}