import 'dart:developer';

import '../../../helper/api_helper.dart';

class LoginService{
  static Future<dynamic> onLogin(Map<String, String> body)async {
    try {
      var decodedData = ApiHelper.postData(
          baseUrl: "http://axnoldigitalsolutions.in/Training/api/login",
          body: body);
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }

}