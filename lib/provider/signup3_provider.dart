
import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vrouter/vrouter.dart';

import '../const.dart';
import '../services/services.dart';


class SignUp3Provider extends ChangeNotifier{

  bool isLoading = false;
  String verifyCode = '';
  Duration duration = const Duration(minutes: 5);
  Timer timer = Timer(Duration.zero, () {});
  String minutes = '05';
  String seconds = '00';


  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final TextEditingController phone = TextEditingController();
  final TextEditingController code = TextEditingController();
  var  codeValidator = (String? value) {
    if(value!.isEmpty){
      return 'Please fill in this field';
    }else{
      return null;
    }
  };
  var  phoneValidator = (String? value) {
    if(value!.isEmpty){
      return 'Please fill in this field';
    }else if(value.length !=11){
      return 'Please enter the correct mobile number';
    }else{
      return null;
    }
  };

  void startTimer() async {
    String towDigits(int n) => n.toString().padLeft(2, '0');
    timer = Timer.periodic(const Duration(seconds: 1),
      (timer) {
        if (duration.inSeconds > 0) {
          final time = duration.inSeconds - 1;
          duration = Duration(seconds: time);
          minutes = towDigits(duration.inMinutes.remainder(60));
          seconds = towDigits(duration.inSeconds.remainder(60));
          notifyListeners();
        } else {
          timer.cancel();
        }
      },
    );
  }

  void send(context)async{
    isLoading = true;
    notifyListeners();
    try{
      var response = await Services().verifyCode(phone.text);
      if(response['res'] == 'ok'){
        isLoading = false;
        notifyListeners();
        verifyCode = response['code'];
        VRouter.of(context).to('/signup4');
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
}