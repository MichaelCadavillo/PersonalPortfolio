import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

bool isTablet(MediaQueryData query) {
  var deviceType = getDeviceType(query.size);
  switch (deviceType) {
    case DeviceScreenType.desktop:
      return true;
      break;
    case DeviceScreenType.tablet:
      return true;
      break;
    case DeviceScreenType.mobile:
      return false;
      break;
    case DeviceScreenType.watch:
      return false;
      break;
    default:
      return false;
  }
}
