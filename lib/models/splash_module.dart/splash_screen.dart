import 'package:chat_app/models/splash_module.dart/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashState = Provider.of<SplashState>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 200,
                child: Image.asset('assets/images/Untitled design-9.png'),
              ),
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
