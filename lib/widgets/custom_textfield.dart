import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../const.dart';
import '../styles.dart';

class CustomTextFieldForm extends StatefulWidget {
  const CustomTextFieldForm({Key? key,
    required this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.inputType,
    required this.name,
    this.controller,
    this.validator,
    this.onChange,
    this.label,
    this.textDirection,
    this.enable,
    this.obscureText,
    this.maxLength,
    })
      : super(key: key);

  final String text;
  final String? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? inputType;
  final String name;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final void Function(String? val)? onChange;
  final TextDirection? textDirection;
  final bool? obscureText;
  final int? maxLength;
  final bool? enable;

  @override
  State<CustomTextFieldForm> createState() => _CustomTextFieldFormState();
}

class _CustomTextFieldFormState extends State<CustomTextFieldForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      // height: 40,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: FormBuilderTextField(
          keyboardType: widget.inputType,
          onChanged: widget.onChange,
          maxLength: widget.maxLength,
          controller: widget.controller,
          validator: widget.validator,
          obscureText:widget.obscureText ?? false,
          textAlign: TextAlign.left,
          enabled: widget.enable ?? true,
          name: widget.name,
          textAlignVertical: TextAlignVertical.center,
          style: txt.txtFontFamilyTextField.txtBold,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            filled: true,
            fillColor: Colors.white,
            hintText: widget.text,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            errorStyle: txt.txtFontFamilyTextField.txtHeavy.textRed.txtSm,
            hintStyle: txt.txtFontFamilyTextField.txtBold.textGrey.txtSm,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: kGrey),
                borderRadius: BorderRadius.circular(8)),
            // Set border for focused state
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: kGrey),
                borderRadius: BorderRadius.circular(8)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.red),
                borderRadius: BorderRadius.circular(8)),
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: kGrey),
                borderRadius: BorderRadius.circular(8)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: kGrey),
                borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
    );
  }
}

