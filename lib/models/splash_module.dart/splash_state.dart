import 'package:chat_app/common/local_storage.dart';
import 'package:chat_app/main.dart';
import 'package:flutter/foundation.dart';

class SplashState extends ChangeNotifier {
  SplashState() {
    var accessTkn = localStorage.read("accessToken");
    Future.delayed(const Duration(seconds: 2), () {
      goToNext();
    });
  }
  goToNext() {
    var accessTkn = localStorage.read("accessToken");
    if (accessTkn == null) {
      navigatorKey.currentState!
          .pushNamedAndRemoveUntil('/loginScreen', (route) => false);
    }
    if (accessTkn != null) {
      navigatorKey.currentState!
          .pushNamedAndRemoveUntil('/homePage', (route) => false);
    }
  }
}
