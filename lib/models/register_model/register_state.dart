import 'package:chat_app/main.dart';
import 'package:chat_app/mmodels/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterState extends ChangeNotifier {
  String? fullName;
  String? email;
  String? password;
  bool isLoading = false;

  onFullNameChanged(value) {
    fullName = value;
    notifyListeners();
  }

  onEmailChanged(value) {
    email = value;
    notifyListeners();
  }

  onPasswordChanged(value) {
    password = value;
    notifyListeners();
  }

  register() async {
    UserCredential? credential;
    print('yaha samma aayo hai');
    try {
      isLoading = true;
      notifyListeners();
      credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      print('successful');
      if (credential != null) {
        String uid = credential.user!.uid;
        UserModel newUser = UserModel(
          uid: uid,
          fullName: fullName,
          email: email,
        );
        await FirebaseFirestore.instance
            .collection("user")
            .doc(uid)
            .set(newUser.toMap())
            .then((value) {
          print('New user created');
          navigatorKey.currentState!.pushReplacementNamed('/homePage');
        });
        isLoading = false;
        notifyListeners();
      }
    } on FirebaseAuthException catch (e) {
      print(e.code.toString());
    }
  }
}
