import 'package:flutter/material.dart';

// SCREEN Main Padding
extension Screen on BuildContext {
  // SCREEN Height
  double get screenHeight => MediaQuery.of(this).size.height;
  // SCREEN Width
  double get screenWidth => MediaQuery.of(this).size.width;
  // MAIN Height Padding
  double get mainHP => screenHeight * 0.050;
  // MAIN Width Padding
  double get mainWP => screenWidth * 0.050;
  // SECONDARY Height Padding
  double get secondaryHP => screenWidth * 0.025;
  // SECONDARY Width Padding
  double get secondaryWP => mainWP * 0.025;
}

// TODO: Polish -> app theme