import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

bool isTablet(MediaQueryData query) {
  var deviceType = getDeviceType(query.size);
  switch (deviceType) {
    case DeviceScreenType.desktop:
      return true;
    case DeviceScreenType.tablet:
      return true;
    case DeviceScreenType.mobile:
      return false;
    case DeviceScreenType.watch:
      return false;
    default:
      return false;
  }
}
