import 'package:etaka/logics/models/merchant.dart';
import 'package:etaka/logics/services/API/api_helper.dart';
import 'package:etaka/views/components/constant.dart';
import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:etaka/views/utils/app_const.dart';
import 'package:flutter/material.dart';

class PayBillConfirm extends StatefulWidget {
  final Merchant mechant;
  const PayBillConfirm({Key? key, required this.mechant}) : super(key: key);

  @override
  _PayBillConfirmState createState() => _PayBillConfirmState();
}

class _PayBillConfirmState extends State<PayBillConfirm> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${getFullName(widget.mechant.merchantType)} Bill Payment"
                .toUpperCase(),
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            "Enter Your Payment Details",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.grey.shade500,
                ),
          ),
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
            child: TextField(
              onChanged: (val) {
                //agent = val;
              },
              decoration: InputDecoration(
                  hintText: "A102020", labelText: "Enter Reference Number"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
              bottom: 10,
            ),
            child: TextField(
              onChanged: (val) {
                //amount = double.parse(val);
              },
              decoration:
                  InputDecoration(hintText: "1000", labelText: "Enter Amount"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
            child: TextField(
              onChanged: (val) {
                //pin = val;
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: "******",
                labelText: "Enter Pin",
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
                child: Text('CONFIRM'),
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
                //bool ch = await api.CashOut(agent, amount);
                // if (ch) {
                //   Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => TransactionSuccessful(
                //         receiver: agent,
                //         amount: amount,
                //       ),
                //     ),
                //   );
                // }
              },
            ),
          )
        ],
      ),
    );
  }
}
