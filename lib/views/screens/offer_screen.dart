import 'package:etaka/logics/models/offer.dart';
import 'package:etaka/logics/services/API/api_helper.dart';
import 'package:etaka/views/components/constant.dart';
import 'package:etaka/views/components/reuseable_widgets.dart';
import 'package:flutter/material.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  late List<Offer> offers;
  bool isLoading = true;
  @override
  void initState() {
    getdata();
    super.initState();
  }

  Future<List<Offer>> getdata() async {
    APIService api = APIService();
    var data = await api.getOffers();
    offers = offersFromJson(data);
    print(offers.length);
    setState(() {
      isLoading = false;
    });
    return offers;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isRoot: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 5, right: 25, bottom: 15),
            child: Text(
              "Current Offers".toUpperCase(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          // !isLoading
          //     ? ListView.builder(
          //         itemCount: offers.length,
          //         shrinkWrap: true,
          //         itemBuilder: (context, index) {
          //           return OfferItemCard(
          //             title: offers[index].title,
          //             details: offers[index].details,
          //           );
          //         })
          //     : Padding(
          //         padding: const EdgeInsets.fromLTRB(0, 150, 0, 20),
          //         child: Center(child: blue_loading),
          //       )
          FutureBuilder<List<Offer>>(
              future: getdata(),
              builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                  snapshot.hasData
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, index) {
                            return OfferItemCard(
                              title: snapshot.data![index].title,
                              details: snapshot.data![index].details,
                            );
                          },
                        )
                      : Center(
                          child: blue_loading,
                        ))
        ],
      ),
    );
  }
}
