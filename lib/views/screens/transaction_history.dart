import 'package:etaka/logics/models/transaction.dart';
import 'package:etaka/logics/services/API/api_helper.dart';
import 'package:etaka/views/components/constant.dart';
import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:flutter/material.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  late List<Transaction> trns;
  bool isLoading = true;
  @override
  void initState() {
    getdata();
    super.initState();
  }

  Future<List<Transaction>> getdata() async {
    APIService api = APIService();
    var data = await api.gettranHistory();
    trns = transactionFromJson(data);
    print(trns.length);
    setState(() {
      isLoading = false;
    });
    return trns;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isRoot: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Transaction History".toUpperCase(),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder<List<Transaction>>(
              future: getdata(),
              builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                  snapshot.hasData
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, index) {
                            return TransactionHistoryItem(
                              trnsl: snapshot.data![index],
                            );
                          },
                        )
                      : Center(
                          child: blue_loading,
                        ))
          // Center(
          //   child: Card(
          //     elevation: 4,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     child: Container(
          //       padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
          //       width: 400,
          //       height: 70,
          //       decoration: BoxDecoration(
          //         border: Border.all(
          //           color: Colors.black12,
          //           width: 1,
          //         ),
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       child: Center(
          //         child: Row(
          //           children: [
          //             CircleAvatar(
          //               radius: 30,
          //               backgroundImage: NetworkImage(
          //                   'https://www.pngitem.com/pimgs/m/421-4213036_avatar-hd-png-download.png'),
          //             ),
          //             Column(
          //               children: [
          //                 Text(" Name ",
          //                     style: TextStyle(
          //                         fontSize: 20,
          //                         fontWeight: FontWeight.bold,
          //                         color: Colors.black)),
          //                 Text(
          //                   "22-Oct-2021     12:19 AM",
          //                   style: TextStyle(fontSize: 15, color: Colors.grey),
          //                 ),
          //               ],
          //             ),
          //             Spacer(
          //               flex: 2,
          //             ),
          //             Text(
          //               "- 6,000 Tk",
          //               style: TextStyle(
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.bold,
          //                   color: Colors.red),
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

class TransactionHistoryItem extends StatelessWidget {
  final Transaction trnsl;
  const TransactionHistoryItem({Key? key, required this.trnsl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 400,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset("assets/img/transaction.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(trnsl.transId,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      DateTime.parse(trnsl.datetime.toString())
                          .toString()
                          .substring(0, 19),
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                        color: Colors.blueAccent.shade100,
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            full_type(trnsl.transType).toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )),
                    Text(
                      trnsl.transType == "ADDMONEY" ||
                              trnsl.transType == "RECEIVE"
                          ? "+ ${trnsl.amount.toStringAsFixed(2)}"
                          : "- ${trnsl.amount.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: trnsl.transType == "ADDMONEY" ||
                                  trnsl.transType == "RECEIVE"
                              ? Colors.green
                              : Colors.redAccent),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

String full_type(String short) {
  if (short == "ADDMONEY") {
    return "Add Money";
  }
  return "";
}
