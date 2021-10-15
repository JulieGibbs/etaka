import 'package:etaka/views/components/constant.dart';
import 'package:etaka/views/screens/register_screen.dart';
import 'package:etaka/views/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();
  }

  Future<void> navigate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? user_exist = pref.getBool("user_exist");
    String? token = pref.getString("token");
    String? phone = pref.getString("phone_number");

    if (token != null && user_exist != null && user_exist) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else if (token != null && (user_exist == null || !user_exist)) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => RegistrationScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
      color: primaryColor,
    )));
  }
}
