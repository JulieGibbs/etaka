import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const Color primaryColor = Color(0xFF005CEE);

final loading = SpinKitThreeBounce(
  color: Colors.white,
  size: 30.0,
);

final blue_loading = SpinKitThreeBounce(
  color: primaryColor,
  size: 30.0,
);
