import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class KSize {
  static double getWidth(BuildContext context, width) {
    double _width = (((100 / 414) * width) / 100) * context.screenWidth;
    return _width;
  }

  static double getHeight(BuildContext context, height) {
    double _height = (((100 / 896) * height) / 100) * context.screenHeight;
    return _height;
  }
}
