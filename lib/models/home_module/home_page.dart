import 'package:chat_app/models/home_module/features/messages.dart';
import 'package:chat_app/models/home_module/features/news_feed.dart';
import 'package:chat_app/models/home_module/features/profile.dart';
import 'package:chat_app/models/home_module/features/search.dart';
import 'package:chat_app/models/home_module/home_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeState>(context);
    List<Widget> pages = [
      NewsFeedScreen(),
      MessageScreen(),
      SearchScreen(),
      ProfileScreen()
    ];
    return Scaffold(
      body: pages[homeState.currentValue],
      bottomNavigationBar: BottomNavigationBar(
        onTap: homeState.onTap,
        type: BottomNavigationBarType.fixed,
        currentIndex: homeState.currentValue,
        items: [
           BottomNavigationBarItem(
            icon: SizedBox(
              width: 50,
              child: Icon(
                Icons.newspaper_outlined,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 50,
              child: Icon(
                Icons.message_outlined,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 50,
              child: Icon(
                Icons.search,
              ),
            ),
            label: '',

          ),
           BottomNavigationBarItem(
            icon: SizedBox(
              width: 50,
              child: Icon(
                Icons.person_outline_outlined,
              ),
            ),
            label: '',
            
          ),
        ])
    );
  }
}