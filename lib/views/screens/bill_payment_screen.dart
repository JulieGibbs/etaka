import 'package:etaka/logics/models/merchant.dart';
import 'package:etaka/logics/services/API/api_helper.dart';
import 'package:etaka/views/components/constant.dart';
import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:etaka/views/screens/pay_bill_confirm.dart';
import 'package:etaka/views/utils/app_const.dart';
import 'package:flutter/material.dart';

class BillPayment extends StatefulWidget {
  final String type;
  const BillPayment({Key? key, required this.type}) : super(key: key);

  @override
  _BillPaymentState createState() => _BillPaymentState();
}

class _BillPaymentState extends State<BillPayment> {
  late List<Merchant> merchants;
  bool isLoading = true;

  @override
  void initState() {
    get_merchant_data();
  }

  Future<void> get_merchant_data() async {
    APIService api = APIService();
    var data = await api.getMerchantData(filter: widget.type);
    merchants = merchantFromJson(data.toString());
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "${getFullName(widget.type)} Bill Payment".toUpperCase(),
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            "Choose Your Provider",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.grey.shade500,
                ),
          ),
          SizedBox(
            height: 30,
          ),
          !isLoading
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: merchants.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => PayBillConfirm(
                              mechant: merchants[index],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 2,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          padding: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Icon(Icons.wc, color: Colors.grey),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(merchants[index].orgName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                            fontWeight: FontWeight.w300,
                                          )),
                                  Text(
                                      getFullName(
                                          merchants[index].merchantType),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontWeight: FontWeight.w300,
                                          )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Container(height: 400, child: Center(child: blue_loading))
        ],
      ),
    );
  }
}
