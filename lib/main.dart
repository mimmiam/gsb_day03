import 'package:flutter/material.dart';
import 'package:gsb_day03/home.dart';
import 'package:gsb_day03/pages/accounts/login.dart';
import 'package:gsb_day03/pages/accounts/register.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gsb_day03/utils/local_storage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/register' : (context) => RegisterScreen(),
        '/home' : (context) => HomeScreen()
      },
      theme: ThemeData(
          primarySwatch: Colors.lightGreen,
      ),
      home: FutureBuilder(
        future: LocalStorage().getToken(),
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot)
        {
          if(snapshot.hasData){
            return HomeScreen();
          }
          return LoginScreen();
        },
      ),
      builder: EasyLoading.init(),
    );
  }
}

