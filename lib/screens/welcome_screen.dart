import 'package:flutter/material.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset("assets/img/bck.png"),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  height: 300,
                  child: Stack(
                    children: [
                      Image.asset("assets/img/vector_1.png"),
                      Image.asset("assets/img/vector_2.png"),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                    height: 179,
                    width: 240,
                    child: Center(child: Image.asset("assets/img/logo.png"))),
              ),
              Spacer(),
              // SizedBox(
              //   height: 200,
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Container(
                  height: 80,
                  alignment: Alignment.center,
                  child: Image.asset("assets/img/btn.png"),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
