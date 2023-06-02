
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


bool isValidEmail(String email) {
  String pattern =
      r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(email);
}
enum RadioItem { agree, notAgree }


class SignUp1Provider extends ChangeNotifier{

  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  var  emailValidator = (String? value) {
    if(value!.isEmpty){
      return 'Please Enter Email';
    }else if(!isValidEmail(value)){
      return 'Please enter the correct email';
    }else{
      return null;
    }
  };


  // Radio Item and Function for update value
  RadioItem radioItem = RadioItem.notAgree;
  void changeRadioSelected (val){
   radioItem = val;
   notifyListeners();
  }

  RadioItem radioItem2 = RadioItem.notAgree;
  void changeRadioSelected2 (val){
    radioItem2 = val;
    notifyListeners();
  }




}