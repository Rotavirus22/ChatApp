import 'package:chat_app/mmodels/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeState extends ChangeNotifier {
  PageController pageController = PageController();
  int currentValue = 0;

  //Profile Page Variables
  String? name;
  String? email;
  String? uId;

  // search page variables
  String? searchQuery;

  onPageChanged(value) {
    currentValue = value;
    notifyListeners();
  }

  onTap(page) {
    currentValue = page;
    notifyListeners();
  }

  Future<void> getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userData = await FirebaseFirestore.instance
          .collection('user')
          .doc(user.uid)
          .get();
      if (userData.exists) {
        final userModel =
            UserModel.fromMap(userData.data() as Map<String, dynamic>);
        name = userModel.fullName;
        email = userModel.email;
        uId = userModel.uid;
        notifyListeners();
      }
    }
  }

  searchUser(String query) {
    searchQuery = query;
    notifyListeners();
  }
  
}
