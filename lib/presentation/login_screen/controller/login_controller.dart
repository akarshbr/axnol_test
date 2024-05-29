import 'dart:convert';
import 'dart:developer';

import 'package:clean_code_demo/presentation/profile_screen/view/profile_screen.dart';
import 'package:clean_code_demo/repository/api/login_screen/model/login_response_model.dart';
import 'package:clean_code_demo/repository/api/login_screen/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends ChangeNotifier {
  LoginResponseModel loginResponseModel = LoginResponseModel();
  late SharedPreferences sharedPreferences;

  onLogin(email, passWord, context) {
    log("LoginController -> onLogin()");
    var body = {"email": "$email", "password": "$passWord"};
    LoginService.onLogin(body).then((value) {
      if (value["status"] == 1) {
        var data = value["data"];
        storeReceivedData(data);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
        log("$value");
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Login Failed"), backgroundColor: Colors.red));
      }
      notifyListeners();
    });
  }

  storeReceivedData(data) async {
    sharedPreferences = await SharedPreferences.getInstance();
    String storeData = jsonEncode(data);
    sharedPreferences.setString("response", storeData);
  }
}
