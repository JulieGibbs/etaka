import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:flutter/material.dart';

class Notification extends StatefulWidget {
  const Notification({Key? key}) : super(key: key);

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column()

    );
  }
}
