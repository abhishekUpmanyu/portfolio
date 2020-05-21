import 'package:portfolio/enums/screen_type.dart';
import 'package:flutter/cupertino.dart';

ScreenType getDeviceType(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.shortestSide;

  if (deviceWidth>950) {
    return ScreenType.desktop;
  }

  if (deviceWidth>600) {
    return ScreenType.tablet;
  }

  return ScreenType.mobile;
}