import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:flutter/material.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
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
            padding: const EdgeInsets.only(left: 65),
            child: Text(
            "Transaction History",
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

                          Text(" Name ", style: TextStyle(fontSize: 20)),
                          Spacer(flex: 2,),
                          Text("Amount", style: TextStyle(fontSize: 20),)
                        ],
                      ),
                  ),


                ),
              ),
            )
          ],
        ),

    );
  }
}
