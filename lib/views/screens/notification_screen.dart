import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 100, ),
        child: Text(
          "Notifications",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, ),
        ),
      ),
      ]
      )
    );
  }
}
