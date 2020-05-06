import 'package:actividad_2/Model/UserResponse.dart';
import 'package:actividad_2/Views/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserResponse>(builder: (context, userResponse, child) {
      return MaterialButton(
        color: Colors.redAccent,
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          changeOfView(context);
        },
      );
    });
  }

  changeOfView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUp()),
    );
  }
}
