import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';

import 'API/api_helper.dart';

class Payment {
  Future<dynamic> gotoSSL(double amount) async {
    Sslcommerz sslcommerz = await Sslcommerz(
      initializer: SSLCommerzInitialization(
          //   ipn_url: "www.ipnurl.com",
          // multi_card_name: "visa,master,bkash",
          currency: SSLCurrencyType.BDT,
          product_category: "Digital Goods",
          sdkType: SSLCSdkType.TESTBOX,
          store_id: "soads616dcff831a24",
          store_passwd: "soads616dcff831a24@ssl",
          total_amount: amount,
          tran_id: "ETAKA1234${amount}"),
    );
    SSLCTransactionInfoModel data = await sslcommerz.payNow();
    print(data.cardNo);
    print(data.cardIssuer);
    print(data.amount);
    print(data.bankTranId);
    print(data.status);
    if (data.status == "VALID") {
      APIService api = APIService();
      await api.AddMoney(data.cardNo.toString(), data.bankTranId.toString(),
          data.cardIssuer.toString(), double.parse(data.amount.toString()));
      return true;
    }
    return false;
  }
}
