import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kBrown = Color(0xFF292526);
const Color kDarkBrown = Color(0xFF1b2028);



const Color kBlack = Color(0xFF111111);

const Color kWhite = Color(0xFFffffff);

const Color kGrey = Color(0xFFa4aaad);
const Color kLightGrey = Color(0xFFededed);
const Color kDarkGrey = Color(0xFF878787);

const Color kYellow = Color(0xFFffd33c);
const Color kLightYellow = Color (0xFFfffee0);

const Color kBlue = Color (0xFFADD8E6);
const Color kLightBlue = Color (0xFFe7feff);


const double kBorderRadius = 12.0;
const double kPaddingHorizontal = 12.0;

final kInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(kBorderRadius),
  borderSide: const BorderSide(
    color: kLightGrey,
  ),
);

final kEncodeSansBold = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w700,
);

final kEncodeSansSemiBold = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w600,
);

final kEncodeSansMediumBold = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w500,
);

final kEncodeSansRegularBold = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w400,
);
