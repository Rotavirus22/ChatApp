import 'package:chat_app/models/Landing_Page_Module/landing_Screen.dart';
import 'package:chat_app/models/Landing_Page_Module/landing_state.dart';
import 'package:chat_app/models/home_module/chat%20module/chat_screen.dart';
import 'package:chat_app/models/home_module/chat%20module/chat_state.dart';
import 'package:chat_app/models/home_module/home_page.dart';
import 'package:chat_app/models/home_module/home_state.dart';
import 'package:chat_app/models/login_model/login_screen.dart';
import 'package:chat_app/models/login_model/login_state.dart';
import 'package:chat_app/models/register_model/register_screen.dart';
import 'package:chat_app/models/register_model/register_state.dart';
import 'package:chat_app/models/splash_module.dart/splash_screen.dart';
import 'package:chat_app/models/splash_module.dart/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rohan Chat App',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 1,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 19,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ChangeNotifierProvider(
              create: (_) => SplashState(),
              child: const SplashScreen(),
            ),
        '/loginScreen': (context) => ChangeNotifierProvider(
              create: (_) => LoginState(),
              child: LoginScreen(),
            ),
        '/registerScreen': (context) => ChangeNotifierProvider(
              create: (_) => RegisterState(),
              child: RegisterScreen(),
            ),
        '/landingScreen': (context) => ChangeNotifierProvider(
              create: (_) => LandingState(),
              child: const LandingScreen(),
            ),
        '/homePage': (context) => ChangeNotifierProvider(
              create: (_) => HomeState(),
              child: const HomePage(),
            ),
        '/chatScreen': (context) => ChangeNotifierProvider(
              create: (_) => ChatState(context),
              child:  ChatScreen(),
            )
      },
    );
  }
}

initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
