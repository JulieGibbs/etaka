import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(
            height: 250,
            color: Color(0xFF2F75FD),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("BDT 24,000",
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                    Text("active balance".toUpperCase(),
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.6))),
                  ],
                ),
              ),
            ]),
          )
        ]));
  }
}
