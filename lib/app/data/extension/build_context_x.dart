import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  double get getWidth => MediaQuery.of(this).size.width;
  double get getHeight => MediaQuery.of(this).size.height;
  double get getDevicePixelRatio => MediaQuery.of(this).devicePixelRatio;
}
