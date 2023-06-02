import 'package:example_varknow/provider/signup2_provider.dart';
import 'package:example_varknow/widgets/custom_container.dart';
import 'package:example_varknow/widgets/custom_textfield.dart';
import 'package:example_varknow/widgets/cuztom_background.dart';
import 'package:example_varknow/widgets/title_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';
import '../../const.dart';
import '../../styles.dart';
import '../../widgets/custom_button.dart';

class SignUp2Screen extends StatelessWidget {
  const SignUp2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var signup2Provider = Provider.of<SignUp2Provider>(context, listen: false);
    return CustomBackground(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title('We need a few more details',
                'Enter your details to proceed further'),
            customContainer(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () {
                        VRouter.of(context).to('/signup');
                      },
                      child: Ink(
                        child: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Form(
                      key: signup2Provider.formKey,
                      child: Expanded(
                        flex: 1,
                        child: ListView(
                          children: [
                            h(20),
                            CustomTextFieldForm(
                              text: 'First Name',
                              name: 'fname',
                              controller: signup2Provider.fName,
                              validator: signup2Provider.textValidator,
                            ),
                            h(5),
                            CustomTextFieldForm(
                              text: 'Last Name',
                              name: 'lname',
                              controller: signup2Provider.lName,
                              validator: signup2Provider.textValidator,
                            ),
                            h(5),
                            CustomTextFieldForm(
                              text: 'User Name',
                              name: 'username',
                              controller: signup2Provider.userName,
                              validator: signup2Provider.textValidator,
                            ),
                            h(5),
                            CustomTextFieldForm(
                              text: 'Password',
                              name: 'pass',
                              controller: signup2Provider.password,
                              validator: signup2Provider.passValidator,
                            ),
                            h(10),
                            Padding(
                                padding:
                                    const EdgeInsets.only(right: 5, left: 8),
                                child: Text(
                                  '6 to 15 characters with at least one lowercase letter, one uppercase letter, one numeric digit, and one special character',
                                  style: txt.txtFontFamilyTextField.txtBold
                                      .txtSm.textGrey.txtHeight,
                                )),
                            h(10),
                            CustomTextFieldForm(
                              text: 'Confirm password',
                              name: 'confirmPass',
                              controller: signup2Provider.confirmPassword,
                              validator: (String? value) {
                                if(value!.isEmpty){
                                  return 'Please fill in this field';
                                }else if (value != signup2Provider.password.text){
                                  return 'Password confirmation is not the same as password';
                                }else{
                                  return null;
                                }
                              },
                            ),
                            h(10),
                            Consumer<SignUp2Provider>(
                              builder: (context, value, child) {
                                return Row(
                                  children: [
                                    Radio(
                                        activeColor: kLightBlue3,
                                        value: RadioItem.agree,
                                        groupValue: value.radioItem,
                                        onChanged: (val) {
                                          value.changeRadioSelected(val);
                                        }),
                                    Text(
                                      'I agree with Terms & Conditions *',
                                      style: txt.txtFontFamilyTextField.txtBold,
                                    ),
                                  ],
                                );
                              },
                            ),
                            h(10),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: const LinearProgressIndicator(
                                color: kDarkBlue,
                                minHeight: 13,
                                value: 0.5,
                              ),
                            ),
                            h(10),
                            Consumer<SignUp2Provider>(builder: (context, value, child) {
                              return CustomButton(
                                isLoading: value.isLoading,
                                callback: () async{

                                  if(signup2Provider.formKey.currentState!.validate()){
                                    if(signup2Provider.radioItem == RadioItem.agree){
                                      signup2Provider.send(context);
                                    }else{
                                      snackBar(context, 'Please accept the rules');
                                    }
                                  }
                                },
                                text: 'Continue',
                              );
                            },),
                            h(10)
                          ],
                        ),
                      ),
                    ),
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


