import 'package:flutter/material.dart';
import 'package:gsb_day03/components/user_form.dart';
import 'package:gsb_day03/service/user_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: UserForm(
        buttonLabel: 'register',
        submit: _submit,
      ),
    );
  }

  _submit(String username, String password) async{
    UserService userService = UserService();
    await userService.register(username, password);
  }
}
