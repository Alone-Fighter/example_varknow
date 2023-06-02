
import 'dart:convert';
import 'dart:developer';

import 'package:example_varknow/const.dart';
import 'package:example_varknow/models/user_model.dart';
import 'package:example_varknow/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vrouter/vrouter.dart';


enum RadioItem { agree, notAgree }

bool isValidPassword(String password) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,15}$';
  RegExp regExp = RegExp(pattern);

  return regExp.hasMatch(password);
}


class SignUp2Provider extends ChangeNotifier{

  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final TextEditingController fName = TextEditingController();
  final TextEditingController lName = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  var  textValidator = (String? value) {
    if(value!.isEmpty){
      return 'Please fill in this field';
    }else{
      return null;
    }
  };

  var  passValidator = (String? value) {
    if(value!.isEmpty){
      return 'Please fill in this field';
    }else if(!isValidPassword(value)){
      return 'Enter the password correctly';
    }else{
      return null;
    }
  };

  void send(context)async{
    isLoading = true;
    notifyListeners();
    try{
      UserModel user = UserModel(fName: fName.text, lName: lName.text, userName: userName.text, password: password.text);
      var json = jsonEncode(user.toJson());
      var response = await Services().signup(json);
      if(response['res'] == 'ok'){
        isLoading = false;
        notifyListeners();
        VRouter.of(context).to('/signup3');
      }else{
        isLoading = false;
        notifyListeners();
        snackBar(context, 'Please try again');
      }
    }catch(e){
      log(e.toString());
      isLoading = false;
      notifyListeners();
      snackBar(context, 'Please try again');
    }

  }

  // Radio Item and Function for update value
  RadioItem radioItem = RadioItem.notAgree;
  void changeRadioSelected (val){
   radioItem = val;
   notifyListeners();
  }





}