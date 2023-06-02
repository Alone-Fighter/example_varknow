import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'const.dart';




extension TextStyleExtension on TextStyle {

  TextStyle get txt0 => merge(const TextStyle(fontSize: 0));
  TextStyle get txt3Xs => merge(const TextStyle(fontSize: 6));
  TextStyle get txt2Xs => merge(const TextStyle(fontSize: 9));
  TextStyle get txtXs => merge(const TextStyle(fontSize: 10));
  TextStyle get txtSm => merge(const TextStyle(fontSize: 12));
  TextStyle get txtMd => merge(const TextStyle(fontSize: 14));
  TextStyle get txtLg => merge(const TextStyle(fontSize: 16));
  TextStyle get txtXl => merge(const TextStyle(fontSize: 18));
  TextStyle get txt1Xl => merge(const TextStyle(fontSize: 20));
  TextStyle get txt2Xl => merge(const TextStyle(fontSize: 22));
  TextStyle get txt3Xl => merge(const TextStyle(fontSize: 24));
  TextStyle get txt4Xl => merge(const TextStyle(fontSize: 28));
  TextStyle get textWhite => merge(const TextStyle(color: Colors.white));
  TextStyle get textGrey => merge(const TextStyle(color: Colors.grey));
  TextStyle get textBlue => merge( const TextStyle(color: CupertinoColors.activeBlue));
  TextStyle get textBlue2 => merge(const TextStyle(color: CupertinoColors.systemBlue));
  TextStyle get textBlack => merge(const TextStyle(color: Colors.black));
  TextStyle get textRed => merge(const TextStyle(color: Colors.red));
  TextStyle get textHintColor => merge(TextStyle(color: kTextBlackHint));


  TextStyle get txtFontFamilyTextField => merge( TextStyle(fontFamily: GoogleFonts.poppins().fontFamily));
  TextStyle get txtHeavy => merge(const TextStyle(fontWeight: FontWeight.w400));
  TextStyle get txtBold => merge(const TextStyle(fontWeight: FontWeight.bold));
  TextStyle get txtBold2 => merge(const TextStyle(fontWeight: FontWeight.w900));


  TextStyle get txtHeight => merge(const TextStyle(height: 1.5));


  TextStyle get heading1 => merge(TextStyle(fontWeight: FontWeight.w900,fontFamily: fontFamily,fontSize: 28,));
  TextStyle get heading2 => merge(TextStyle(fontWeight: FontWeight.w700,fontFamily: fontFamily,fontSize: 20,));
  TextStyle get heading3 => merge(TextStyle(fontWeight: FontWeight.w500,fontFamily: fontFamily,fontSize: 18,));
  TextStyle get body => merge(TextStyle(fontWeight: FontWeight.w400,fontFamily: fontFamily,fontSize: 16,));
  TextStyle get bodyTextField => merge(const TextStyle(fontWeight: FontWeight.w400,fontFamily: 'IranSans',fontSize: 16,));
  TextStyle get caption => merge(TextStyle(fontWeight: FontWeight.w400,fontFamily: fontFamily,fontSize: 14,));



}

const TextStyle txt  = TextStyle();


final roundedSm = BorderRadius.circular(12);
final roundedMd = BorderRadius.circular(16);
final roundedLg = BorderRadius.circular(20);


w(double size) => SizedBox(width: size,);
h(double size) => SizedBox(height: size,);

const mainPadding = EdgeInsets.symmetric(horizontal: 15);
const topPadding = EdgeInsets.symmetric(vertical: 15,horizontal: 15);



final shadowLG = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 10,
    blurRadius: 7,
    offset: const Offset(0, 10), // changes position of shadow
  ),
];

final shadowSM = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.15),
    spreadRadius: 1,
    blurRadius: 10,
    offset: const Offset(0, 3), // changes position of shadow
  ),
];


