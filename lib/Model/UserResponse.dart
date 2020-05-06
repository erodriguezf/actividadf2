import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserResponse extends ChangeNotifier{

  String _email;
  String _name;
  String _password;
  String _username;
  String _token;
  String _error;

  UserResponse.empty() {
    _name = 'cosita';
    _username = 'cosa';
    _token = 'token';   
    _password = "123";
    _error = 'sorry';
    _email = 'cosota@bonito.com';
  }

  UserResponse(String email, String name, String username, String token){
    _email = email;
    _name = name;
    _username = username;
    _token = token;
  }

  UserResponse.Error(this._error);

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(json['email'], json['name'], json['username'], json['token']);
  }

  factory UserResponse.error(Map<String, dynamic> json) {
    return UserResponse.Error(json['error']);
  }

  get name => _name;
  get username => _username;
  get token => _token;
  get error => _error;
  get password => _password;
  get email => _email;

  set name(String name) {
    _name = name;
    notifyListeners();
  }

  set username(String username) {
    _username= username;
    notifyListeners();
  }

  set password(String password) {
    _password = password;
    notifyListeners();
  }

  set email(String email) {
    _email = email;
    notifyListeners();
  }

  void resetData() {
    _email = '';
    _password = '';
    _token = '';
    _name = '';
    _username = '';

    cleanLocalStorage();

    notifyListeners();
  }

  void cleanLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    prefs.remove("email");
    prefs.remove("name");
    prefs.remove("username");
  }
}
