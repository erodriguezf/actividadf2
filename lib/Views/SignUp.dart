import 'package:actividad_2/Views/DashBoard.dart';
import 'package:actividad_2/main.dart';

import 'package:flutter/material.dart';

import 'package:actividad_2/Model/UserResponse.dart';
import 'package:actividad_2/Model/UserRequests.dart';
import 'package:provider/provider.dart';

import '../Widgets/Form.dart';

class SignUp extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [Colors.orangeAccent, Colors.red],
            begin: const FractionalOffset(0.5, 0.1),
            end: const FractionalOffset(0.5, 0.9),
          ),
        ),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0)),
            margin: EdgeInsets.only(left: 20, right: 20, top: 128, bottom: 128),
            child:
                Consumer<UserResponse>(builder: (context, userResponse, child) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(50),
                      child: LoginAndSignupForm(
                          isSignUp: true,
                          fields: ["email", "name", "username", "password"],
                          color: Colors.red),
                    ),
                    Column(
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.red,
                          onPressed: () {
                            var response = signup(
                                userResponse.email,
                                userResponse.name,
                                userResponse.password,
                                userResponse.username);
                            response.then((val) {
                              if (val.error != null)
                                throw val.error;
                              else
                                goToDashBoard(context);
                            }).catchError((error) {
                              print(error);
                            });
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        RaisedButton(
                          child: Text('back', style: TextStyle(color: Colors.white)),
                          color: Colors.deepPurple,
                          onPressed: () {
                            goToLogin(context);
                          },
                        ),
                      ],
                    )
                  ]);
            })));
  }

  Future<UserResponse> signup(
      String email, String name, String password, String username) {
    return UserRequests().signup(email, name, password, username);
  }

  goToDashBoard(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DashBoard()),
    );
  }

  goToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHome()),
    );
  }
}
