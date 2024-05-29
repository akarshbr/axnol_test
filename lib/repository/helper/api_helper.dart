import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiHelper {
  static postData({
    required String baseUrl,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  }) async {
    log("Api-helper -> postData");
    log("$body");
    final url = Uri.parse(baseUrl);
    try {
      var response = await http.post(url, body: body);
      log("Api Called -> status code -> ${response.statusCode}");
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var data = {"status": 1, "data": decodedData};
        return data;
      } else {
        log("Else Condition -> Api failed");
        var data = {"status": 0, "data": null};
        return data;
      }
    } catch (e) {
      log("$e");
    }
  }
}