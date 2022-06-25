import 'package:flutter/material.dart';
import 'package:gsb_day03/components/user_form.dart';
import 'package:gsb_day03/services/user_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200,
            margin: EdgeInsets.all(30),
            child: Image.asset('assets/images/vegetable.png'),
          ),
          Container(
            child: UserForm(
              buttonLabel: 'Login',
              submit: _submit,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
          },
              child: Text('Register'))
        ],
      ),
    );
  }

  _submit(String username, String password) async{
    UserService userService = UserService();
    await userService.login(username: username, password: password);
  }

}
