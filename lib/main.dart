import 'package:actividad_2/Model/UserResponse.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './Widgets/Form.dart';
import './Widgets/ButtonLogin.dart';
import './Widgets/ButtonRegister.dart';
import 'Views/DashBoard.dart';

void main() => runApp(
      ChangeNotifierProvider(
          create: (context) => UserResponse.empty(), child: MyHome()),
    );

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My nav',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var result = isUserLogged();
    if (result == true) {
       Navigator.push(
          context,
        MaterialPageRoute(builder: (context) => DashBoard()),
      );
    } else {
      return Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [Colors.blue, Colors.deepPurpleAccent],
            begin: const FractionalOffset(0.5, 0.1),
            end: const FractionalOffset(0.5, 0.9),
          ),
        ),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
          margin: EdgeInsets.only(left: 20, right: 20, top: 200, bottom: 200),
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(50),
                child: LoginAndSignupForm(
                    isSignUp: false,
                    fields: ["email", "password"],
                    color: Colors.deepPurple),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtonLogin(),
                  ButtonRegister(),
                ],
              )
            ],
          ),
        ),
      );
    }
  }

  isUserLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('token');
  }

  changeOfView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DashBoard()),
    );
  }
}
