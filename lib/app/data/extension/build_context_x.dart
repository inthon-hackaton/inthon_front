import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

extension BuildContextX on BuildContext {
  double get getWidth => MediaQuery.of(this).size.width;
  double get getHeight => MediaQuery.of(this).size.height;
  double get getDevicePixelRatio => MediaQuery.of(this).devicePixelRatio;
  ShadThemeData get getTheme => ShadTheme.of(this);
  ShadColorScheme get getColorScheme => ShadTheme.of(this).colorScheme;
  ShadTextTheme get getTextTheme => ShadTheme.of(this).textTheme;
}
