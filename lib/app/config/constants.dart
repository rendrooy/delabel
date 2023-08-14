import 'package:flutter/material.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);
const kInactiveColor = Color(0xFFa6a6a6);
const kSecondaryColor = Color(0xFF979797);
const kFontColor = Color(0xFFfafafa);
const kBgWhite = Color(0xFFfafafa);

const String kDateFormatDetail = "EEEE, dd MMMM - HH:mm";
const String kDateFormatDateDetail = "EEEE, dd MMMM yyyy";
const String kDateFormatDateOnly = "dd-MM-yyyy";
const String kDateFormatTimeOnly = "HH:mm";

const kDefaultPadding = 16.0;

const String kUserData = "userData";

TextStyle get kDefaultTextStyle {
  return const TextStyle(
    color: kFontColor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );
}

BoxShadow kDefaultShadow = const BoxShadow(
  color: Colors.black12,
  blurRadius: 6.0,
  offset: Offset(0, 2),
);

const kDefaultBorderRadius = BorderRadius.all(
  Radius.circular(7),
);
const kDefaultBorderRadius10 = BorderRadius.all(
  Radius.circular(10),
);

const kDefaultFastDuration = Duration(milliseconds: 250);
const kDefaultDuration = Duration(milliseconds: 500);
const kDefaultSPlashRadius = 20.0;

const kDefaultConstrant = BoxConstraints(maxWidth: 768);
const kDefaultConstrantB = BoxConstraints(maxWidth: 425);
