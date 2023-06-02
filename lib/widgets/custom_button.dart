import 'package:flutter/material.dart';

import '../const.dart';
import '../styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.callback, required this.text, this.isLoading})
      : super(key: key);

  final VoidCallback callback;
  final String text;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: callback,
        child: Ink(
          width: double.infinity,
          height: 40,
          decoration: const BoxDecoration(color: kLightBlue3),
          child: isLoading ?? false ? const Center(child: Padding(padding: EdgeInsets.symmetric(vertical: 10),child: CircularProgressIndicator()),) : Center(child: Text(text,style: txt.txtMd.textWhite.txtBold.txtFontFamilyTextField,)),
        ),
      ),
    );
  }
}
