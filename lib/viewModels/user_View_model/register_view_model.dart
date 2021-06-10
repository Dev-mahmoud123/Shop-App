

import 'package:flutter/material.dart';
import 'package:shopping/components/functions.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/models/auth/auth_model.dart';
import 'package:shopping/services/local/catch_data.dart';
import 'package:shopping/services/remote/auth/register_service.dart';
import 'package:shopping/views/home_screen/home.dart';

class RegisterViewModel extends ChangeNotifier{

  RegisterService service = RegisterService();
  Auth register = Auth();
  bool isLoading = false;

  Future<void> postUserData (
      {String n,
      String ph,
      String em,
      String pass,
      context}) async {

    isLoading = true;
    notifyListeners();
     await service.register(name: n, phone: ph, email: em, password: pass);
     isLoading = false;
    if(register.status == true){
      defaultToast(color: Colors.green, message: register.message);
      CatchHelper.saveData(key: 'token', value:service.token).then((value) {
        navigateAndFinish(context, Home());
      });
    }else{
      defaultToast(color: Colors.red, message: register.message);
    }
    notifyListeners();

  }



}