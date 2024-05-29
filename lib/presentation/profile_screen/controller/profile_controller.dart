import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends ChangeNotifier{

  bool isLoading = false;
  var getData;
  late SharedPreferences sharedPreferences;

  getReceivedData() async {
    isLoading = true;
    notifyListeners();
    sharedPreferences = await SharedPreferences.getInstance();
    var storeData = sharedPreferences.getString("response");
    getData = jsonDecode(storeData!);

    log("response -> $getData");
    isLoading = false;
    notifyListeners();
  }
}