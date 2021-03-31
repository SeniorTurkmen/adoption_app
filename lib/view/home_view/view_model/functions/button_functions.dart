import 'package:flutter/material.dart';

import '../../../../core/core.dart';

Color getButtonColor(isActive) {
  return isActive
      ? ColorPalette.instance.electricViolet
      : ColorPalette.instance.snuff;
}

Color getTextColor(isActive) {
  return isActive ? Colors.black : ColorPalette.instance.snuff;
}
