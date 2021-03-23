import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/*
SizeConfig file is a tool to adopt to different screen sizes.
It will take the origiginal design values and adopt to current 
screen size with multipliers. This will allow to keep the original 
design on every screen size including ipad amd tablet.
 */

class SizeConfig {
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _blockSizeHorizontal;
  static late double _blockSizeVertical;

  static late Orientation orientation;
  static late double text;
  static late double image;
  static late double height;
  static late double width;
  static late double maxWidth;
  static late double maxHeight;

  void init(BoxConstraints constraints, Orientation _orientation) {
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
