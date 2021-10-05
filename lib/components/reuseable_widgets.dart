import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashBoardMainItemCard extends StatelessWidget {
  final String asset;
  final String title;
  final Function onTap;
  const DashBoardMainItemCard(
      {Key? key, required this.asset, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Card(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  child: SvgPicture.asset(asset),
                ),
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onTap: () {
                          onTap.call();
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                        )))
              ],
            ),
            SizedBox(height: 5),
            Text(title,
                style: TextStyle(
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}

class PayBillsItem extends StatelessWidget {
  final String asset;
  final String title;
  const PayBillsItem({Key? key, required this.asset, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
          // height: 80,
          // width: 55,
          child: Column(
        children: [
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(asset),
            ),
          ),
          SizedBox(height: 2),
          Text(title)
        ],
      )),
    );
  }
}
