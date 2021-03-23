import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height * .01;
  double get width => MediaQuery.of(this).size.height * .01;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
