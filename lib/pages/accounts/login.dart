import 'package:flutter/material.dart';
import 'package:gsb_day03/components/user_form.dart';
import 'package:gsb_day03/models/http_status_msg.dart';
import 'package:gsb_day03/services/user_service.dart';
import 'package:gsb_day03/utils/alert_helper.dart';
import 'package:gsb_day03/utils/loading_progress.dart';
import 'package:gsb_day03/utils/local_storage.dart';


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
          UserForm(
            buttonLabel: 'Login',
            submit: _submit,
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
    LoadingProgress.inProgress(
        () async{
          UserService userService = UserService();
          HttpStatusMsg htm = await userService.login(username: username, password: password);
          if(htm.success){
            LocalStorage localStorage = LocalStorage();
            localStorage.storeToken('${htm.result}');
            AlertHelper.showBar(context: context, msg: 'Welcome to Inventory App');
            Navigator.pushNamed(context, '/home');
          }else{
            AlertHelper.showBar(context: context, msg: htm.err!, isError: true);
          }
        }
    );
  }
}
