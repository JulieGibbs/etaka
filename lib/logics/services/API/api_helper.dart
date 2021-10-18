import 'dart:convert';

import 'package:etaka/views/components/toast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class APIService {
  String endpoint = 'https://ssoad.pythonanywhere.com/';

  Future<dynamic> login(String phoneNumber) async {
    String funcURL = 'phone/register';
    var uri = Uri.parse(endpoint + funcURL);
    var response;
    try {
      response = await http.post(
        uri,
        body: {
          "phone_number": "+" + phoneNumber,
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

  Future<dynamic> otpcheck(String phoneNumber, String otp) async {
    String funcURL = 'phone/verify';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var uri = Uri.parse(endpoint + funcURL);
    var response;
    try {
      response = await http.post(
        uri,
        body: {
          "phone_number": "+" + phoneNumber,
          "session_token": token,
          "security_code": otp
        },
      );
      var data = json.decode(response.body);

      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("valid", true);
        prefs.setString("phone", "+" + phoneNumber);
      }
    } catch (e) {
      print(e);
    }
    print(response.body);
    return response.statusCode == 200;
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
    if (response.statusCode == 200) {
      prefs.setBool("user_exist", true);
    } else {
      prefs.setBool("user_exist", false);
    }
    return response.statusCode == 200;
  }

  Future<dynamic> customerRegister(
      {required String first_name,
      required String last_name,
      String email = "",
      required String pin,
      required String nid}) async {
    String funcURL = '/accounts/customer_register/';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? "";
    var uri = Uri.parse(endpoint + funcURL);
    var response;
    try {
      response = await http.post(uri, headers: {
        "Authorization": token,
      }, body: {
        "first_name": first_name,
        "last_name": last_name,
        "email": email,
        "pin": pin,
        "nid": nid,
      });
    } catch (e) {
      print(e);
    }
    var data = json.decode(response.body);
    print(response.statusCode);
    print(data);
    if (response.statusCode != 200) {
      error_toast("Email or Mobile or NID Already Exist");
    } else {
      success_toast("Registration is Successful");
    }
    prefs.setBool("user_exist", true);
    return response.statusCode == 200;
  }

  Future<dynamic> pin_login(String pin) async {
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
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (data['pin'] == pin) {
        success_toast("Login Success");
        return true;
      }
      prefs.setBool("user_exist", true);
    } else {
      prefs.setBool("user_exist", false);
    }
    error_toast("Invalid Pin");
    return false;
  }

  Future<dynamic> getProfileData() async {
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
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data;
    } else {
      prefs.setBool("user_exist", false);
    }
    error_toast(
      "Profile not found",
    );
    return null;
  }
}
