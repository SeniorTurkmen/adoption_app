import 'package:adoption_app/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

Color getButtonColor(isActive) {
  return isActive
      ? ColorPalette.instance.electricViolet
      : ColorPalette.instance.snuff;
}

Color getTextColor(isActive) {
  return isActive ? Colors.black : ColorPalette.instance.snuff;
}
