import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/constant/urls.dart';
import 'package:shopping/models/home/home_model.dart';

class HomeHelper extends ChangeNotifier {
  bool isLoading = false;
  HomeModel homeModel = HomeModel();


  Future<void> getHomeData() async {
    isLoading = true;
    notifyListeners();
    try {
      final url = Uri.parse(URL.home);

      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'lang': 'en',
        'Authorization': token ?? ''
      });
      final decodeResponse = json.decode(response.body);

      isLoading = false;
      homeModel = HomeModel.fromJson(decodeResponse);

    } catch (error) {
      isLoading = false;
      print(error);
    }
    notifyListeners();
  }
}
