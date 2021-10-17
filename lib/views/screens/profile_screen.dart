import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const <Widget>[
              Card(
                  child: ListTile(
                      title: Text("Settings",
                          style: TextStyle(fontWeight: FontWeight.bold)))),
              Card(
                child: ListTile(
                  leading: Icon(Icons.password),
                  title: Text('Change PIN'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.language),
                  title: Text('Change Language'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.perm_data_setting),
                  title: Text('Change Permissions'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                  child: ListTile(
                      title: Text("Etaka Support",
                          style: TextStyle(fontWeight: FontWeight.bold)))),
              Card(
                child: ListTile(
                  leading: Icon(Icons.support_agent),
                  title: Text('24x7 Support'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.support),
                  title: Text('FAQ'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                  child: ListTile(
                      title: Text("Account Services",
                          style: TextStyle(fontWeight: FontWeight.bold)))),
              Card(
                child: ListTile(
                  leading: Icon(Icons.info),
                  title: Text('Update MNP Info'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                  child: ListTile(
                      title: Text("Policies",
                          style: TextStyle(fontWeight: FontWeight.bold)))),
              Card(
                child: ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Terms Of Use'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.privacy_tip),
                  title: Text('Privacy Policy'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                  child: ListTile(
                      leading: Icon(Icons.logout),
                      title: Text("Log Out",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)))),
            ],
          )
        ],
      ),
    );
  }
}
