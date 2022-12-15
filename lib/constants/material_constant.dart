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
  double get secondaryHP => screenHeight * 0.025;
  // SECONDARY Width Padding
  double get secondaryWP => screenWidth * 0.025;
  // TERTIARY Height Padding
  double get tertiaryHP => screenHeight * 0.015;
  // TERTIARY Width Padding
  double get tertiaryWP => screenWidth * 0.015;
  
  //price
  double get ticketPrice => 16;
}

// TODO: Polish -> app theme
