import 'package:chat_app/common/constants.dart';
import 'package:chat_app/mmodels/user_model.dart';
import 'package:chat_app/models/home_module/home_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  final UserModel? userModel;
  final User? firebaseUser;
  const SearchScreen({super.key, this.userModel, this.firebaseUser});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _formKey = GlobalKey<FormState>();
  String? name;

  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeState>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SizedBox(
          height: 50,
          width: 50,
          child: Image.asset(
            'assets/images/Untitled design-9.png',
            scale: 0.8,
          ),
        ),
      ),
      key: _formKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: TextField(
                onChanged:  homeState.searchUser,
                decoration: searchDecoration,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
              child: MaterialButton(
                onPressed: () {
                  setState(() {});
                },
                color: Colors.purple,
                child: Text(
                  'Search',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('user')
                  .where('fullName', isEqualTo: homeState.searchQuery)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                  return Text('No users found');
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    var users = snapshot.data!.docs[index].data();
                    if (users is Map<String, dynamic>) {
                      return ListTile(
                        title: Text(users['fullName'] ?? 'unknown'),
                        subtitle: Text(users['email'] ?? ''),
                      );
                    }
                    else{
                      return ListTile(
                        title: Text('unknown'),
                        subtitle: Text(''),
                      );
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
