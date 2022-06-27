import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final String buttonLabel;
  final Function submit;
  const UserForm({Key? key, required this.buttonLabel, required this.submit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final keyForm = GlobalKey<FormState>();
    String username = '';
    String password = '';
    return Form(
      key: keyForm,
      child: Column(
        children: [
          ListTile(
            title: TextFormField(
              onSaved: (String? value) {
                username = value!;
              },
              validator: _validateString,
              decoration: InputDecoration(labelText: 'Username'),
            ),
          ),
          ListTile(
            title: TextFormField(
              onSaved: (String? value) {
                password = value!;
              },
              validator: _validateString,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
          ),
          ListTile(
            title: ElevatedButton(
              child: Text(buttonLabel),
              onPressed: () {
                if (keyForm.currentState!.validate()) {
                  keyForm.currentState!.save();
                  print('user:$username pass:$password');
                  submit(username,password);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  String? _validateString(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pleas fill data';
    }
    return null;
  }
}