import 'package:etaka/logics/services/API/api_helper.dart';
import 'package:etaka/views/components/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String pin, phoneNumber;
  late bool isLoading, isInit = false;

  @override
  void initState() {
    // TODO: implement initState
    // // get();
    // get().whenComplete(() {
    //   setState(() {});
    // });
    super.initState();
    get();
  }

  Future<void> get() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.setString("phone", "+881725683936");
    phoneNumber = pref.getString("phone")!;
    setState(() {
      isLoading = false;
      isInit = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                height: h,
                width: w,
                child: Image.asset("assets/img/bck_r.png")),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  width: double.infinity,
                  height: 300,
                  child: Stack(
                    children: [
                      Image.asset("assets/img/vector_1_r.png"),
                      Image.asset("assets/img/vector_2_r.png"),
                    ],
                  ),
                )
              ],
            ),
            isInit
                ? Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        Container(
                            padding: EdgeInsets.all(12),
                            height: 83,
                            child: Image.asset("assets/img/logo_2.png")),
                        Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 0, 0, 10),
                                child: Text(
                                  "Into Your eTaka Wallet",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 5, 30, 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Phone Number",
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 18),
                                    ),
                                    TextFormField(
                                      initialValue: phoneNumber,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          hintText: "+8801774000000"),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 5, 30, 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Enter Pin",
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 18),
                                    ),
                                    TextField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (val) {
                                        setState(() {
                                          pin = val;
                                        });
                                      },
                                      obscureText: true,
                                      decoration:
                                          InputDecoration(hintText: "******"),
                                    ),
                                  ],
                                ),
                              ),
                              if (isLoading)
                                Center(
                                  child: Container(
                                      padding: EdgeInsets.all(30),
                                      height: 100,
                                      width: 100,
                                      child: CircularProgressIndicator()),
                                ),
                              if (!isLoading)
                                Center(
                                  child: Container(
                                    padding: EdgeInsets.all(40),
                                    height: 100,
                                    width: 100,
                                    // child: CircularProgressIndicator(),
                                  ),
                                ),
                              GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  APIService api = APIService();
                                  bool ch = await api.pin_login(pin);
                                  setState(() {
                                    isLoading = false;
                                  });
                                  if (ch) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DashboardMain()));
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 80,
                                  child:
                                      Image.asset("assets/img/login_btn.png"),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
