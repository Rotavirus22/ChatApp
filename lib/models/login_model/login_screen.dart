import 'package:chat_app/common/buttons/small_button.dart';
import 'package:chat_app/models/login_model/login_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/common/constants.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: 'logo',
                  child: Image.asset('assets/images/Untitled design-9.png'),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    onChanged: loginState.onEmailChanged,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an email';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      value = loginState.email;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: inputDecoration,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: TextFormField(
                    onChanged: loginState.onPasswordChanged,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onSaved: (String? value) {
                      value = loginState.password;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an password';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: inputDecoration.copyWith(
                      hintText: 'Enter an password',
                    ),
                  ),
                ),
                SmallButton(
                  onPressed: () {
                    loginState.login();
                  },
                  color: Colors.blue,
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
