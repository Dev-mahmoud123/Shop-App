import 'dart:convert';

import 'package:shopping/components/functions.dart';
import 'package:shopping/constant/urls.dart';
import 'package:shopping/models/notification/notification_model.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  // ignore: missing_return
  Future<NotificationModel> getNotification() async {

    try {
      final url = Uri.parse(URL.notification);
      final response = await http.get(url, headers: {
        'lang': 'en',
        'Content-Type': 'application/json',
        'Authorization': token ?? ''
      });

      if (response.statusCode == 200) {
        String data = response.body;
        final decodeData = json.decode(data);
        printFullText(decodeData.toString());
        final result = NotificationModel.fromJson(decodeData);
        return result;
      }
    } catch (error) {
      print(error);
    }
  }
}
