import 'package:flutter/material.dart';
import 'package:test_app/string.dart';
import 'extensions/color_extension.dart';

Color? rgbListToColor(List<int> list) {
  if (list.length != 3) return null;
  final red = list[0];
  if (!valueInRGBRange(red)) return null;
  final green = list[1];
  if (!valueInRGBRange(green)) return null;
  final blue = list[2];
  if (!valueInRGBRange(blue)) return null;
  return Color.fromRGBO(red, green, blue, 1);
}

Color? rgbListToInvertedColor(List<int> list) {
  if (list.length != 3) return null;
  final red = 255 - list[0];
  if (!valueInRGBRange(red)) return null;
  final green = 255 - list[1];
  if (!valueInRGBRange(green)) return null;
  final blue = 255 - list[2];
  if (!valueInRGBRange(blue)) return null;
  return Color.fromRGBO(red, green, blue, 1);
}

String rgbListToHexString(List<int> list) {
  if (list.length != 3) return wrongData;
  final red = list[0];
  if (!valueInRGBRange(red)) return wrongData;
  final green = list[1];
  if (!valueInRGBRange(green)) return wrongData;
  final blue = list[2];
  if (!valueInRGBRange(blue)) return wrongData;
  return 'Hex: ${list.toHex()}';
}

String rgbListToRGBString(List<int> list) {
  if (list.length != 3) return wrongData;
  final red = list[0];
  if (!valueInRGBRange(red)) return wrongData;
  final green = list[1];
  if (!valueInRGBRange(green)) return wrongData;
  final blue = list[2];
  if (!valueInRGBRange(blue)) return wrongData;
  return 'RGB: ($red,$green,$blue)';
}

bool valueInRGBRange(int value) => value >= 0 && value <= 255;
