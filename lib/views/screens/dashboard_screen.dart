import 'package:etaka/logics/models/profile.dart';
import 'package:etaka/logics/services/API/api_helper.dart';
import 'package:etaka/views/components/constant.dart';
import 'package:etaka/views/components/pie_chart.dart';
import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:etaka/views/screens/send_money_screen.dart';
import 'package:flutter/material.dart';

import 'add _money.dart';
import 'bill_payment_screen.dart';
import 'cash_out_screen.dart';
import 'mobile_recharge_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return CustomScaffold(
      isRoot: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "My Account",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          Center(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: 500,
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Colors.black,
                  //   width: 1,
                  // ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                            'https://www.pngitem.com/pimgs/m/421-4213036_avatar-hd-png-download.png'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name ", style: TextStyle(fontSize: 24)),
                        Text("Mobile Number", style: TextStyle(fontSize: 18)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const <Widget>[
              Text(
                "Settings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.password,
                    color: Colors.pink,
                  ),
                  title: Text('Change PIN'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.language,
                    color: Colors.purple,
                  ),
                  title: Text('Change Language'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.perm_data_setting,
                    color: Colors.amber,
                  ),
                  title: Text('Change Permissions'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Text(
                "etaka Support",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.support_agent, color: Colors.lightBlue,),
                  title: Text('24x7 Support'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.support, color: Colors.red,),
                  title: Text('FAQ'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),

              Text("Account Services",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              Card(
                child: ListTile(
                  leading: Icon(Icons.info, color: Colors.cyan,),
                  title: Text('Update MNP Info'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),

              Text("Terms & Policies",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Card(
                child: ListTile(
                  leading: Icon(Icons.message, color: Colors.deepPurpleAccent,),
                  title: Text('Terms Of Use'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.privacy_tip, color: Colors.green,),
                  title: Text('Privacy Policy'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Card(
                  child: ListTile(
                      leading: Icon(Icons.logout, color: Colors.red,),
                      title: Text("Log Out",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red)))),
            ],
          )
        ],
      ),
    );
  }
}
