
import 'package:flutter/material.dart';

const kTextColor =Color(0xff001B33);
const kTextColorSystem =Color(0xff003666);
const kDarkBlue =Color(0xff1d958b);
const kLightBlue =Color(0xff89dfd4);
const kLightBlue2 =Color(0xff66d9cc);
const kLightBlue3 =Color(0xff39d2c0);
const kBlue =Color(0xff00519A);
const kBlue2 =Color(0xff156EBF);
const kTOrange =Color(0xffF07A24);
const kError =Color(0xffF04924);
const kGrey =Color(0xffC2C7CC);
const kLightGrey =Color(0xffEBEEF0);
const kBackground =Color(0xffF7F9FA);
final kTextBlackHint = const Color(0xFF444444).withOpacity(0.64);


const kGradientBlue = [
  kBlue2,
  kBlue
];

void snackBar (context,String text){
  var snackBar = SnackBar(
    duration: const Duration(milliseconds: 500),
    content: Text(text),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}