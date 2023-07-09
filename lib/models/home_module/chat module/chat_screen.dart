import 'package:chat_app/mmodels/message_model.dart';
import 'package:chat_app/models/home_module/chat%20module/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatState = Provider.of<ChatState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(chatState.name ?? ''),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<MessageModel>>(
              stream: chatState.messagesStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('No messages found'),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  reverse: true,
                  itemBuilder: (BuildContext context, int index) {
                    var message = snapshot.data![index];
                    return ListTile(
                      title: Text(message.content ?? ''),
                      subtitle: Text(message.sender ?? ''),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        onChanged: chatState.onMessageChanged,
                        decoration: const InputDecoration(
                          labelText: 'Message',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        chatState.sendMessage();
                        _formKey.currentState!.reset();
                      },
                      icon: const Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
