import 'package:flutter/material.dart';

import '../../../../core/constants/color_constants.dart';

Color getButtonColor(isActive) {
  return isActive
      ? ColorPalette.instance.electricViolet
      : ColorPalette.instance.snuff;
}

Color getTextColor(isActive) {
  return isActive ? Colors.black : ColorPalette.instance.snuff;
}
