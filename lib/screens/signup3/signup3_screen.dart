import 'package:example_varknow/provider/signup3_provider.dart';
import 'package:example_varknow/styles.dart';
import 'package:example_varknow/widgets/custom_container.dart';
import 'package:example_varknow/widgets/custom_textfield.dart';
import 'package:example_varknow/widgets/cuztom_background.dart';
import 'package:example_varknow/widgets/title_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

import '../../const.dart';
import '../../widgets/custom_button.dart';

class SignUp3Screen extends StatelessWidget {
  const SignUp3Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var signup3Provider = Provider.of<SignUp3Provider>(context, listen: false);
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
                        key: signup3Provider.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () {
                                VRouter.of(context).to('/signup2');
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
                              text: 'Phone',
                              name: 'phone',
                              controller: signup3Provider.phone,
                              validator: signup3Provider.phoneValidator,
                            ),
                            h(10),
                            Padding(
                              padding: const EdgeInsets.only(right: 5, left: 8),
                              child: Text(
                                'We need to Verify your phone number. We will send a code to the below number via SMS to authenticate you:',
                                style: txt.txtFontFamilyTextField.txtSm.txtBold
                                    .textGrey.txtHeight,
                              ),
                            ),
                            h(80),
                            const Spacer(),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: const LinearProgressIndicator(
                                color: kDarkBlue,
                                minHeight: 13,
                                value: 0.75,
                              ),
                            ),
                            h(10),
                            Consumer<SignUp3Provider>(
                              builder: (context, value, child) {
                                return CustomButton(
                                  isLoading: value.isLoading,
                                  callback: () {
                                    if (signup3Provider.formKey.currentState!.validate()) {
                                      signup3Provider.send(context);
                                    }
                                  },
                                  text: 'Send Verification code',
                                );
                              },
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
