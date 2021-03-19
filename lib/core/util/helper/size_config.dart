import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/*
SizeConfig file is a tool to adopt to different screen sizes.
It will take the origiginal design values and adopt to current 
screen size with multipliers. This will allow to keep the original 
design on every screen size including ipad amd tablet.
 */

class SizeConfig{
  late double _screenWidth;
  late double _screenHeight;
  late double _blockSizeHorizontal;
  late double _blockSizeVertical;

  late Orientation orientation;
  late double text;
  late double image;
  late double height;
  late double width;
  late double maxWidth;
  late double maxHeight;

  SizeConfig.init(BoxConstraints constraints, Orientation _orientation) {
    orientation = _orientation;
    if (_orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      maxWidth = constraints.maxWidth;
      maxHeight = constraints.maxHeight;
    } else {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      maxWidth = constraints.maxWidth;
      maxHeight = constraints.maxHeight;
    }

    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    text = _blockSizeVertical;
    image = _blockSizeHorizontal;
    height = _blockSizeVertical;
    width = _blockSizeHorizontal;

    print('height: $_blockSizeVertical');
    print('width: $_blockSizeHorizontal');
  }
}
