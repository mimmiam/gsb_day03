import 'package:flutter/material.dart';

class AlertHelper{
  static showBar({
    required BuildContext context,
    required String msg,
    bool isError = false
  }){
    SnackBar snackBar = SnackBar(
      backgroundColor: isError == true ? Colors.red : Colors.green,
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static alertPopup({
    required BuildContext context,
    required String title,
    required String desc,
    required Function function,
    bool isCloseAuto = true
}) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(title),
            content: Text(desc),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('cancel')),
              TextButton(
                  onPressed: () {
                    function();
                    if(isCloseAuto == true){
                      Navigator.pop(context);
                    }
                  },
                  child: Text('OK'))
            ],
          );
        });
  }
}