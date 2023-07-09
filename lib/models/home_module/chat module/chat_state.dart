import 'package:chat_app/common/constants.dart';
import 'package:chat_app/mmodels/message_model.dart';
import 'package:chat_app/mmodels/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatState extends ChangeNotifier {
  ChatState(context) {
    final args = ModalRoute.of(context)!.settings.arguments as dynamic;
    userId = args["userId"];
    name = args["name"];
    getCurrentUser();
    fetchMessage();
  }
  String? userId;
  String? senderId;
  String? name;
  String? email;
  String? sender;
  String? message;
  DateTime? createdOn;
  bool? seen;
  List<MessageModel> messages = [];

  onMessageChanged(value) {
    message = value;
    notifyListeners();
  }

  getCurrentUser() async {
    try {
      final user = await FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userData = await FirebaseFirestore.instance
            .collection('user')
            .doc(user.uid)
            .get();
        if (userData.exists) {
          final userModel =
              UserModel.fromMap(userData.data() as Map<String, dynamic>);
          sender = userModel.fullName;
          email = userModel.email;
          senderId = userModel.uid;
          notifyListeners();
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendMessage() async {
    MessageModel newMessage = MessageModel(
        receiverId: userId,
        receiver: name,
        content: message,
        createdOn: DateTime.now(),
        seen: false,
        sender: sender,
        senderId: senderId);
    await FirebaseFirestore.instance
        .collection('messages')
        .add(newMessage.toMap());
    messages.add(newMessage);
    if (newMessage != null) {
      // Clear the message input field
      message = '';

      notifyListeners();
    } else {
      print('Error sending message');
    }
  }

  Stream<List<MessageModel>> get messagesStream {
    return FirebaseFirestore.instance
        .collection('messages')
        .where('receiverId', isEqualTo: userId)
        .where('senderId', isEqualTo: senderId)
        .orderBy('createdOn', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return MessageModel.fromMap(doc.data());
      }).toList();
    });
  }

  Future<void> fetchMessage() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('messages')
          .where('receiverId', isEqualTo: userId)
          .where('senderId', isEqualTo: senderId)
          .orderBy('createdOn', descending: true)
          .get();
      messages = querySnapshot.docs.map((doc) {
        return MessageModel.fromMap(doc.data());
      }).toList();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
