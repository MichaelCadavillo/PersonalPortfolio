import 'package:flutter/material.dart';

double deviceHeight = 0.0;
var hp;
var wp;

class ScreenUtils {
  Size screenSize;

  ScreenUtils(this.screenSize);

  double wp(percentage) {
    double result = (percentage * screenSize.width) / 100;
    return result;
  }

  double hp(percentage) {
    double result = (percentage * screenSize.height) / 100;
    return result;
  }
}
