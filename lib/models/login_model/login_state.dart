// ignore_for_file: unnecessary_null_comparison

import 'package:chat_app/common/local_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/main.dart';

class LoginState extends ChangeNotifier {
  String? email;
  String? password;
  bool isLoading = false;

  onEmailChanged(value) {
    email = value;
    notifyListeners();
  }

  onPasswordChanged(value) {
    password = value;
    notifyListeners();
  }

  login() async {
    UserCredential? credential;
    try {
      isLoading = true;
      notifyListeners();
      credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      if (credential != null) {
        var token = await credential.user!.getIdToken();
        var accessTkn = localStorage.write("accessToken", token);
        print('Login Successful');
        print(accessTkn);
        navigatorKey.currentState!.pushReplacementNamed('/homePage');
      }
    } on FirebaseAuthException catch (e) {
      print(e.code.toString());
    }
    isLoading = false;
    notifyListeners();
  }
}
