import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shopping/components/functions.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/constant/urls.dart';
import 'package:shopping/models/auth/auth_model.dart';
import 'package:shopping/services/local/catch_data.dart';
import 'package:shopping/views/home_screen/home.dart';

class UserHelper extends ChangeNotifier {

  bool isLoading = false;
  Auth login;


  Future<void> userLogin(
      {@required String email, @required String password, context}) async {
    isLoading = true;
    notifyListeners();
    try {
      final url = Uri.parse(URL.login);
      final response = await http.post(
        url,
        body: json.encode({
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        isLoading = false;
        final decodeResponse = json.decode(response.body);
        final token = decodeResponse['data']['token'];
        login = Auth.fromJson(decodeResponse);
        if (login.status == true) {
          defaultToast(color: Colors.green, message: login.message);
          CatchHelper.saveData(key: 'token', value: token).then((value) {
            navigateAndFinish(context, Home());
          });
          print('token $token');
        } else {
          defaultToast(color: Colors.red, message: login.message);
        }
      }
    } catch (error) {
      isLoading = false;
      throw error;
    }
    notifyListeners();
  }

}
