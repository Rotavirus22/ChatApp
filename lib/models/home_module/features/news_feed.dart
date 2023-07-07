import 'package:flutter/material.dart';

class NewsFeedScreen extends StatelessWidget {
  NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Text('This is newfeed'),
      ),
    );
  }
}
