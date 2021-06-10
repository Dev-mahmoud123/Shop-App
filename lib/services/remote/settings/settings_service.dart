import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping/constant/urls.dart';
import 'package:shopping/models/settings/setting_model.dart';
import 'package:http/http.dart' as http;

class SettingsService extends ChangeNotifier {
  SettingsModel settingModel;

  // ignore: missing_return
  Future<SettingsModel> getSetting() async {
    try {
      final url = Uri.parse(URL.settings);
      final response = await http.get(url, headers: {'lang': 'en'});

      if (response.statusCode == 200) {
        String data = response.body;
        final decodeData = json.decode(data);

        settingModel = SettingsModel.fromJson(decodeData);
        return settingModel;
      }
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }
}
