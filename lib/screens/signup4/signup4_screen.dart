import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

import '../../const.dart';
import '../../provider/signup3_provider.dart';
import '../../styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/cuztom_background.dart';
import '../../widgets/title_screen.dart';

class SignUp4Screen extends StatelessWidget {
  const SignUp4Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var signup3Provider = Provider.of<SignUp3Provider>(context, listen: false);
    signup3Provider.timer.isActive ? null : signup3Provider.startTimer();

    return CustomBackground(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title(
                'Phone Verification', 'Enter your details to proceed further'),
            customContainer(
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Form(
                        key: signup3Provider.formKey2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () {
                                signup3Provider.timer.cancel();
                                VRouter.of(context).to('/signup3');
                              },
                              child: Ink(
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            h(10),
                            CustomTextFieldForm(
                              text: 'Enter the code',
                              name: 'code',
                              controller: signup3Provider.code,
                              validator: signup3Provider.codeValidator,
                            ),
                            h(10),
                            Padding(
                              padding: const EdgeInsets.only(right: 5, left: 8),
                              child: Text(
                                'The verification code sent to your number. You have 5 minutes to verify the code and complete the registration.',
                                style: txt.txtFontFamilyTextField.txtSm.txtBold
                                    .textGrey.txtHeight,
                              ),
                            ),
                            h(60),
                            const Spacer(),
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '${context.watch<SignUp3Provider>().minutes}:${context.watch<SignUp3Provider>().seconds}',
                                  style: txt.txtFontFamilyTextField.txtMd
                                      .textBlack.txtBold,
                                )),
                            h(10),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: const LinearProgressIndicator(
                                color: kDarkBlue,
                                minHeight: 13,
                                value: 1,
                              ),
                            ),
                            h(10),
                            CustomButton(
                              callback: () {
                                if (signup3Provider.formKey2.currentState!.validate()) {
                                  if(signup3Provider.verifyCode == signup3Provider.code.text){
                                    signup3Provider.timer.cancel();
                                    snackBar(context, 'SignUp success');
                                  }else{
                                    snackBar(context, 'Wrong Code');
                                  }

                                }
                              },
                              text: 'Verify',
                            ),
                            h(10)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
