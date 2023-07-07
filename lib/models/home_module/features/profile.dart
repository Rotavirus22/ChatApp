import 'package:chat_app/models/home_module/home_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeState>(context);
    homeState.getUserData();
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.fromLTRB(50, 50, 50, 50)),
              CircleAvatar(
                radius: 50,
                backgroundColor: const Color.fromARGB(255, 9, 9, 9),
              ),
              Text(homeState.name ?? 'unknown', style: TextStyle(
                fontSize: 25,
              ),),
              Text(homeState.email ?? 'unknown', style: TextStyle(
                fontSize: 25,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
