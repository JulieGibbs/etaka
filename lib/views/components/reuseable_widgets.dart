import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'constant.dart';

class DashBoardMainItemCard extends StatelessWidget {
  final String asset;
  final String title;
  final Function onTap;
  const DashBoardMainItemCard(
      {Key? key, required this.asset, required this.title, required this.onTap})
      : super(key: key);

 