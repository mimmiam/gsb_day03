import 'package:flutter/material.dart';
import 'package:gsb_day03/components/user_form.dart';
import 'package:gsb_day03/models/http_status_msg.dart';
import 'package:gsb_day03/services/user_service.dart';
import 'package:gsb_day03/utils/alert_helper.dart';
import 'package:gsb_day03/utils/loading_progress.dart';

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
    LoadingProgress.inProgress(() async{
      UserService userService = UserService();
      HttpStatusMsg htm = await userService.register(username, password);
      if(htm.success){
        AlertHelper.showBar(context: context, msg: 'complete');
      }else{
        AlertHelper.showBar(context: context, msg: htm.err! ,isError: true);
      }
    });
  }
}
