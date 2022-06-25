import 'dart:convert';

import 'package:http/http.dart'as http;

import '../constant.dart';

class UserService{

  register(String username, String password) async{
    Uri uri = Uri.parse('$HOST/user/');
    final res = await http.post(uri,headers: {
      'Content-Type' : 'application/json'
    },
      body: jsonEncode({
        'username': username,
        'password' : password,
      })
    );
    print(res.body);
    if(res.statusCode == 200){

    }else if(res.statusCode == 400){

    }
  }
}