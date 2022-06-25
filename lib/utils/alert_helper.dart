import 'package:flutter/material.dart';

class AlertHelper{
  static showBar({
    required BuildContext context,
    required String msg,
    bool isError = false
  }){
    SnackBar snackBar = SnackBar(
      backgroundColor: isError == true ? Colors.red : Colors.green,
        content: Text('complete')
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}