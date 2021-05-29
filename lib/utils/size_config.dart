import 'package:flutter/cupertino.dart';
import 'dart:math';

class SizeConfig {
 late MediaQueryData _mediaQueryData;
 late double screenWidth;
 late double screenHeight;
 late double blockSizeHorizontal;
 late double blockSizeVertical;

 late double _safeAreaHorizontal;
 late double _safeAreaVertical;
 late double safeBlockHorizontal;
 late double safeBlockVertical;
 late double safeMinBlock;


  SizeConfig(BuildContext context)
  {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

    safeMinBlock = min(safeBlockHorizontal, safeBlockVertical);
  }

  double getFontSize(defaultFontSize)
  {
    return (blockSizeHorizontal/4.5)*defaultFontSize;
  }

}
