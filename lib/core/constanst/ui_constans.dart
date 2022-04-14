import 'package:flutter/material.dart';
import '../../ui/styles/palette.dart';

class UIConstants {
  static const double buttonSize = 45.0;
  static const double margin = 16.0;
  static const double buttonHalfSize = 20.0;
  static const double buttonQuartSize = 10.0;
  static const double borderRadius = 10;
  static const double marginCardTravel = 5;
  static final bottomSheetDecoration = BoxDecoration(
    color: Palette.white,
    borderRadius: const BorderRadius.all(Radius.circular(20)),
    boxShadow: [
      BoxShadow(
        color: Palette.black.withOpacity(0.2),
        blurRadius: 5,
        spreadRadius: 0.5,
        offset: const Offset(0, -2),
      )
    ],
  );
}
