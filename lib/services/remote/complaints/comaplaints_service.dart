import 'dart:convert';

import 'package:shopping/constant/urls.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/models/complaints/complaints_model.dart';

class ComplaintsService {
  // ignore: missing_return
  Future<ComplaintsModel> postComplaints(
    String name,
    String email,
    String phone,
    String message,
  ) async {
    try {
      final url = Uri.parse(URL.complaints);
      final response = await http.post(
        url,
        body: json.encode(
          {
            'name': name,
            'phone': phone,
            'email': email,
            'message': message,
          },
        ),
        headers: {
          'lang': 'en',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        String data = response.body;
        final decodeData = json.decode(data);
        final result = ComplaintsModel.fromJson(decodeData);
        return result;
      }
    } catch (error) {
      print(error);
    }
  }
}
