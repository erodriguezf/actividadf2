import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/UserResponse.dart';

class LoginAndSignupForm extends StatelessWidget {
  LoginAndSignupForm({Key key, this.isSignUp, this.fields, this.color}) : super(key: key);
  final isSignUp;
  final fields;
  final color;

  void changeData(userResponse, field, data) {
    switch(field) {
      case 'email':
        userResponse.email = data;
      break;
      case 'name':
        userResponse.name = data;
      break;
      case 'username':
        userResponse.username = data;
      break;
      case 'password':
        userResponse.password = data;
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserResponse>(builder: (context, userResponse, child) {
      return login(userResponse);
    });
  }

  Widget login(UserResponse user) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        for(int i = 0; i < fields.length; i++) 
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 16),
            child: TextField(
              obscureText: fields[i] == 'password',
              decoration: textFieldStyle(fields[i]),
              onChanged: (text) {
                changeData(user, fields[i], text);
              },
            ),
          )
      ],
    );
  }

  textFieldStyle(String text) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(color: color)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0), gapPadding: 5.0),
      labelText: '$text',
    );
  }
}
