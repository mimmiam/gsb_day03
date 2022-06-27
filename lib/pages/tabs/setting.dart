import 'package:flutter/material.dart';
import 'package:gsb_day03/utils/alert_helper.dart';
import 'package:gsb_day03/utils/local_storage.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _logout,
          child: Text('Log on'),
        ),
      ),
    );
  }

  _logout() async{
    AlertHelper.alertPopup(
        context: context,
        title: 'Logout',
        desc: 'Are you sure want to logout',
        isCloseAuto: false,
        function: () {
          LocalStorage localStorage = LocalStorage();
          localStorage.removeToken();
          Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
        }
    );
  }
}
