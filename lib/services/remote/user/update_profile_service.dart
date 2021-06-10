import 'dart:convert';

import 'package:shopping/constant/urls.dart';
import 'package:shopping/models/auth/auth_model.dart';
import 'package:http/http.dart' as http;

class UpdateUserProfile {
  // ignore: missing_return
  Future<Auth> updateProfile(
      {String name,
      String email,
      String password,
      String image,
      String phone}) async {
    try {
      final url = Uri.parse(URL.updateProfile);
      final response = await http.put(
        url,
        body: json.encode({
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'image': image
        }),
        headers: {
          'lang': 'en',
          'Content-Type': 'application/json',
          'Authorization': token ?? ''
        },
      );

      if (response.statusCode == 200) {
        String data = response.body;
        final decodeData = json.decode(data);
        final result = Auth.fromJson(decodeData);
        return result;
      }
    } catch (error) {
      print(error);
    }
  }
}
