import 'dart:convert';

import 'package:shopping/constant/urls.dart';
import 'package:shopping/models/auth/change_password_model.dart';
import 'package:http/http.dart' as http;

class ChangePasswordService {
  // ignore: missing_return
  Future<ChangePasswordModel> changePassword({String currentPassword,
    String newPassword,}) async {
    try {
      final url = Uri.parse(URL.changePassword);
      final response = await http.post(
        url,
        body: json.encode(
          {
            'current_password': currentPassword,
            'new_password': newPassword,
          },
        ),
        headers: {
          'lang': 'en',
          'Content-Type': 'application/json',
          'Authorization': token ?? ''
        },
      );

      if (response.statusCode == 200) {
        String data = response.body;
        final decodeData = json.decode(data);
        final result = ChangePasswordModel.fromJson(decodeData);
        return result;
      }
    } catch (error) {
      print(error);
    }
  }
}
