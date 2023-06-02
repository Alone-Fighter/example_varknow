
import 'dart:developer';

import 'package:example_varknow/const.dart';
import 'package:example_varknow/provider/signup1_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

import '../../../main.dart';
import '../../../styles.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';


class PageView2 extends StatelessWidget {
  const PageView2({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignUp1Provider>(context,listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Form(
              key: signupProvider.formKey2,
              child: Column(
                children: [
                  CustomTextFieldForm(
                    controller: signupProvider.email,
                    validator: signupProvider.emailValidator,
                    text: 'Email',
                    name: 'Email',
                  ),
                  Consumer<SignUp1Provider>(
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                  activeColor: kLightBlue3,
                                  value: RadioItem.agree,
                                  groupValue: value.radioItem2,
                                  onChanged: (val) {
                                    value.changeRadioSelected2(val);
                                  }),
                              Text(
                                'I agree with Terms & Conditions *',
                                style: txt.txtFontFamilyTextField.txtBold,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  h(80),
                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: const LinearProgressIndicator(
                      color: kDarkBlue,
                      minHeight: 13,
                      value: 0.25,
                    ),
                  ),
                  h(10),
                  CustomButton(
                    callback: () {
                      if(signupProvider.formKey.currentState!.validate()){
                        if(signupProvider.radioItem == RadioItem.agree){
                          VRouter.of(context).to('/signup2');
                        }else{
                          snackBar(context, 'Please accept the rules');
                        }
                      }
                      },
                    text: 'Continue',
                  ),
                  h(10)
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
