import 'package:actividad_2/Model/UserResponse.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:actividad_2/main.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserResponse>(
        builder: (context, userResponse, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'Bienvenido ${userResponse.name}',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
              MaterialButton(
                child: Text("Log out", style: TextStyle(color: Colors.white),),
                color: Colors.red,
                onPressed: () async {
                  userResponse.resetData();
                  goToLogin(context);
                },
              )
            ],
          );
        }
      )
    );
  }

  goToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHome()),
    );
  }
}