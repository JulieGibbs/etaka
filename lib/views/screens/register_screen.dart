import 'package:etaka/logics/services/API/api_helper.dart';
import 'package:etaka/views/components/constant.dart';
import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:flutter/material.dart';

import 'dashboard_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String first_name, last_name, email, nid, pin;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Register",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 0, 10),
            child: Text(
              "Into Your eTaka Wallet",
              style: TextStyle(fontSize: 20),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       TextField(
          //         decoration: InputDecoration(
          //             hintText: "+8801774000000", labelText: "Phone Number"),
          //       ),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onChanged: (val) {
                    setState(() {
                      first_name = val;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: "Enter First Name", labelText: "First Name"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onChanged: (val) {
                    setState(() {
                      last_name = val;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Last Name", labelText: "Last Name"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Your Email",
                      labelText: "Email (Optional)"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onChanged: (val) {
                    setState(() {
                      nid = val;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Your NID Number", labelText: "NID"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  pin = val;
                });
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: "******",
                labelText: "Pin",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "******",
                labelText: "Confirm Pin",
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Center(
            child: ElevatedButton(
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 250,
                child: Text('Register',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: primaryColor,
              ),
              onPressed: () async {
                APIService api = APIService();
                bool ch = await api.customerRegister(
                    first_name: first_name,
                    email: email,
                    last_name: last_name,
                    pin: pin,
                    nid: nid);
                if (ch) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
