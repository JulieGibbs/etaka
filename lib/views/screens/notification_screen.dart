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
        SizedBox(
          height: 10,
        ),
          
          Center(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                width: 400,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://www.pngitem.com/pimgs/m/421-4213036_avatar-hd-png-download.png'),
                      ),

                      Column(
                        children:[
                          Text(" New Offer on Payment ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
                          Text("Offer Details .....",style: TextStyle(fontSize: 15, color: Colors.grey))

                        ],
                      ),
                      //Spacer(flex: 2,),
                      Column(
                        children:[
                          Text("12:19 AM", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),),
                          Text("22-Oct-2021",style: TextStyle(fontSize: 15, color: Colors.grey),)
                        ]
                      ),
                    ],
                  ),
                ),
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
                padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                width: 400,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://www.pngitem.com/pimgs/m/421-4213036_avatar-hd-png-download.png'),
                      ),

                      Column(
                        children:[
                          Text(" New Offer on Payment ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
                          Text("Offer Details .....",style: TextStyle(fontSize: 15, color: Colors.grey))

                        ],
                      ),
                      //Spacer(flex: 2,),
                      Column(
                          children:[
                            Text("12:19 AM", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),),
                            Text("22-Oct-2021",style: TextStyle(fontSize: 15, color: Colors.grey),)
                          ]
                      ),
                    ],
                  ),
                ),
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
                padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                width: 400,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://www.pngitem.com/pimgs/m/421-4213036_avatar-hd-png-download.png'),
                      ),

                      Column(
                        children:[
                          Text(" New Offer on Payment ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
                          Text("Offer Details .....",style: TextStyle(fontSize: 15, color: Colors.grey))

                        ],
                      ),
                      //Spacer(flex: 2,),
                      Column(
                          children:[
                            Text("12:19 AM", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),),
                            Text("22-Oct-2021",style: TextStyle(fontSize: 15, color: Colors.grey),)
                          ]
                      ),
                    ],
                  ),
                ),
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
                padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                width: 400,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://www.pngitem.com/pimgs/m/421-4213036_avatar-hd-png-download.png'),
                      ),

                      Column(
                        children:[
                          Text(" New Offer on Payment ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
                          Text("Offer Details .....",style: TextStyle(fontSize: 15, color: Colors.grey))

                        ],
                      ),
                      //Spacer(flex: 2,),
                      Column(
                          children:[
                            Text("12:19 AM", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),),
                            Text("22-Oct-2021",style: TextStyle(fontSize: 15, color: Colors.grey),)
                          ]
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ]
      )
    );
  }
}
