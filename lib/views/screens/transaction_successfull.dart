import 'package:etaka/logics/models/profile.dart';
import 'package:etaka/logics/services/API/api_helper.dart';
import 'package:etaka/views/components/constant.dart';
import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionSuccessful extends StatefulWidget {
  final String receiver;
  final double amount;
  const TransactionSuccessful(
      {Key? key, required this.receiver, required this.amount})
      : super(key: key);

  @override
  TransactionSuccessfulState createState() => TransactionSuccessfulState();
}

class TransactionSuccessfulState extends State<TransactionSuccessful> {
  late Profile profile;
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  Future<void> getdata() async {
    APIService api = APIService();
    var data = await api.getProfileData();
    profile = Profile.fromJson(data);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: !isLoading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                ),
                Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Image.asset("assets/img/checked.png"),
                  ),
                ),
                Center(
                  child: Text(
                    "Transaction Successful!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: 300,
                      height: 250,
                      decoration: BoxDecoration(
                        // border: Border.all(
                        //   color: Colors.black,
                        //   width: 1,
                        // ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(""" Receiver : ${widget.receiver}\n
         Amount : ${widget.amount.toStringAsFixed(2)}\n 
Available Balance : ${profile.balance.toStringAsFixed(2)}""",
                              maxLines: 20, style: TextStyle(fontSize: 20))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                      child: Text('Go Back To Home'),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: primaryColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            )
          : loading,
    );
  }
}
