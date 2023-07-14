import 'package:chat_app/main.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: MaterialButton(
                  height: 60,
                  onPressed: () {
                    navigatorKey.currentState!.pushNamed('/registerScreen');
                  },
                  color: Colors.blue,
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  height: 60,
                  onPressed: () {
                    navigatorKey.currentState!.pushNamed('/loginScreen');
                  },
                  color: Colors.blue,
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
