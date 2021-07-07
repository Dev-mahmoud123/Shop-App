import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping/components/functions.dart';
import 'package:shopping/constant/urls.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/models/auth/auth_model.dart';

class GetProfileService extends ChangeNotifier {
  Auth profile;
 bool isLoading = false;

  // ignore: missing_return
  Future<Auth> getProfile() async {
    isLoading = true;
    notifyListeners();

    try {
      final url = Uri.parse(URL.profile);
      final response = await http.get(
        url,
        headers: {
          'lang': 'en',
          'Content-Type': 'application/json',
          'Authorization': token ?? ''
        },
      );

      if (response.statusCode == 200) {
        isLoading = false;
        String data = response.body;
        final decodeData = json.decode(data);
        profile = Auth.fromJson(decodeData);
        printFullText(profile.data.toString());
      }
    } catch (error) {
      isLoading = false;
      print(error);
    }
    notifyListeners();
  }
}
