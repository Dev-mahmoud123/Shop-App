import 'dart:convert';

import 'package:shopping/constant/urls.dart';
import 'package:shopping/models/auth/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  Auth signUp;
  String token;

  Future<void> register(
      {@required String name,
      @required String phone,
      @required String email,
      @required String password  , context}) async {

    try {
      final url = Uri.parse(URL.register);

      final response = await http.post(url,
          body: json.encode({
            'name': name,
            'phone': phone,
            'email': email,
            'password': password,
          }),
          headers: {'lang': 'en', 'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final decodeData = json.decode(response.body);
        print(decodeData.toString());
        token = decodeData['data']['token'];
        signUp = Auth.fromJson(decodeData);
      }
    } catch (error) {
      print(error);
    }
  }
}
