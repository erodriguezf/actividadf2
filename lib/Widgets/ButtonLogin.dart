import 'package:actividad_2/Model/UserRequests.dart';
import 'package:actividad_2/Model/UserResponse.dart';
import 'package:actividad_2/Views/DashBoard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserResponse>(builder: (context, userResponse, child) {
      return MaterialButton(
        color: Colors.deepPurpleAccent,
        elevation: 4,
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {

          login(userResponse.email, userResponse.password)
          .then( (val) {
            if(val.error != null) print("Error: ${val.error}");
            else changeOfView(context);
          })
          .catchError((error) {
            print("Error: $error");
          });
        },
      );
    });
  }

  Future<UserResponse> login(String email, String password) {
    return UserRequests().login(email, password);
  }

  changeOfView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DashBoard()),
    );
  }
}
