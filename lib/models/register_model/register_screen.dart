import 'package:chat_app/models/register_model/register_state.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/common/constants.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/common/buttons/small_button.dart';

class RegisterScreen extends StatelessWidget {
  final formKey = GlobalKey<FormFieldState>();
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerState = Provider.of<RegisterState>(context);
    return Scaffold(
      key: formKey,
      body: Center(
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
                  onChanged: registerState.onFullNameChanged,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a Name';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    value = registerState.fullName;
                  },
                  decoration: inputDecoration.copyWith(hintText: 'Full name'),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  onChanged: registerState.onEmailChanged,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    value = registerState.email;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: inputDecoration,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  onChanged: registerState.onPasswordChanged,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    value = registerState.password;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  decoration:
                      inputDecoration.copyWith(hintText: 'Enter an Password'),
                ),
              ),
              SmallButton(
                onPressed: () {
                  registerState.register();
                },
                color: Colors.blue,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
