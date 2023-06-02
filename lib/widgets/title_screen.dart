import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles.dart';

Widget title (String title,String subTitle){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        h(40),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SvgPicture.asset(
            'assets/images/logo.svg',
            width: 143,
            height: 58,
            fit: BoxFit.cover,
            semanticsLabel: 'A shark?!',
            placeholderBuilder: (BuildContext context) =>
                Container(
                    padding: const EdgeInsets.all(30.0),
                    child: const CircularProgressIndicator()),
          ),
        ),
        h(20),
        Text(
          title,
          style: txt
              .txtFontFamilyTextField.txt4Xl.txtBold.textBlack,
        ),
        h(10),
        Text(
          subTitle,
          style: txt.txtFontFamilyTextField.txtXl.textBlack,
        ),
        h(40),
      ],
    ),
  );
}