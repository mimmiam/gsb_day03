import 'dart:convert';

import 'package:gsb_day03/models/http_status_msg.dart';
import 'package:http/http.dart'as http;

import '../constant.dart';

class UserService{

  Future<HttpStatusMsg> register(String username, String password) async{
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
    HttpStatusMsg htm = HttpStatusMsg();
    if(res.statusCode == 200){
      htm.success = true;
    }else if(res.statusCode == 400){
      htm.success = false;
      htm.err = 'User already registered';
      return htm;
    }
    htm.success = false;
    htm.err = 'Something went wrong';
    return htm;
  }

  login({required String username, required String password}) async{
    Uri uri = Uri.parse('$HOST/token');
    final res = await http.post(uri,
        headers:{'Content-Type' : 'application/x-www-form-urlencoded'},
        body:{
          'username' : username,
          'password' : password
        }
    );
    HttpStatusMsg htm = HttpStatusMsg();
    print(res.body);
    if(res.statusCode == 200){

    }else{

    }
  }
}