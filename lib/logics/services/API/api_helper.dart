import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class APIService {
  String endpoint = 'https://ssoad.pythonanywhere.com/';

  Future<dynamic> login(String phone_number) async {
    String funcURL = 'phone/register';
    var uri = Uri.parse(endpoint + funcURL);
    var response;
    try {
      response = await http.post(
        uri,
        body: {
          "phone_number": "+" + phone_number,
        },
      );
      var data = json.decode(response.body);

      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", data['session_token']);
      }
      print(data['session_token']);
    } catch (e) {
      print(e);
    }
    print(response.body);
    return response.statusCode;
  }

  Future<dynamic> otpcheck(String phone_number, String otp) async {
    String funcURL = 'phone/verify';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var uri = Uri.parse(endpoint + funcURL);
    var response;
    try {
      response = await http.post(
        uri,
        body: {
          "phone_number": "+" + phone_number,
          "session_token": token,
          "security_code": otp
        },
      );
      var data = json.decode(response.body);

      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("valid", true);
      }
    } catch (e) {
      print(e);
    }
    print(response.body);
    return response.statusCode;
  }

  Future<dynamic> checkAccountExist() async {
    String funcURL = 'accounts/details/';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? "";
    var uri = Uri.parse(endpoint + funcURL);
    var response;
    try {
      response = await http.get(uri, headers: {
        "Authorization": token,
      });
    } catch (e) {
      print(e);
    }
    print(response.statusCode);
    print(response.body);
    return response.statusCode == 200;
  }
}
