import 'package:flutter/material.dart';

class ColorConst {
  static const Color darkWhite = Color(0xffF4FAFF);
  static const Color yellow = Color(0xffF6AE2D);
  static const Color orange = Color(0xFFFB8500);
  static const Color black = Color(0xFF212529);
  static const Color white = Color(0xFFFAFBFC);
  static const Color gray = Color (0xFFCBCBD4);
  static const Color backgroundColor = Color(0xFFccedeb);
  static const Color kBrown = Color (0xFF292526);
  static const Color kDarkBrown = Color (0xFF1b2028);
  static const Color kGrey = Color (0xFFa4aaad);
  static const Color kDarkGrey = Color (0xFF878787);
  static const Color kLightGrey = Color (0xFFededed);
  static const Color kWhite = Color (0xFFffffff);
  static const Color kBlack = Color (0xFF111111);
  static const Color kYellow = Color (0xFFffd33c);
  
  static const double kBorderRadius = 12.0;
  static const double kPaddingHorizontal = 12.0;
  final kInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(kBorderRadius),
    borderSide: const BorderSide(
      color: kLightGrey,
    )
  );
}
