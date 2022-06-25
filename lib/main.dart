import 'package:flutter/material.dart';
import 'package:gsb_day03/pages/accounts/login.dart';
import 'package:gsb_day03/pages/accounts/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/register' : (context) => RegisterScreen()
      },
      home: LoginScreen(),
    );
  }
}

