import 'dart:convert';

import 'package:http/http.dart' as http;
import './UserResponse.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserRequests {
  UserRequests();

  Future<UserResponse> login(String email, String password) async {
    final response = await http.post('https://movil-api.herokuapp.com/signin',
        body: {"email": "$email", "password": "$password"});


    if (response.statusCode == 200) {

      var serializedData = UserResponse.fromJson(json.decode(response.body));
      saveDataInLocasStorage(serializedData);

      return serializedData;
    } else {
      return UserResponse.error(json.decode(response.body));
    }
  }

  Future<UserResponse> signup(
      String email, String name, String password, String username) async {
    final response =
        await http.post('https://movil-api.herokuapp.com/signup', body: {
      "email": "$email",
      "password": "$password",
      "name": "$name",
      "username": "$username"
    });

    if (response.statusCode == 200) {

      var serializedData = UserResponse.fromJson(json.decode(response.body));
      saveDataInLocasStorage(serializedData);

      return serializedData;
    } else {
      return UserResponse.error(json.decode(response.body));
    }
  }

  saveDataInLocasStorage(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', data.email);
    prefs.setString('name', data.name);
    prefs.setString('token', data.token);
    prefs.setString('username', data.username);
  }
}
