import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping/constant/urls.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/models/home/category_model.dart';


class CategoryService  extends ChangeNotifier{
  CategoryModel loadCategories ;


  bool isLoading = false;
  // ignore: missing_return
  Future<CategoryModel> getCategories() async {
     isLoading = true;
    notifyListeners();
    try {
      final url = Uri.parse(URL.categories);
      final response = await http.get(
        url,
        headers: <String, String>{'lang': 'en'},
      );
      if (response.statusCode == 200) {
        String data = response.body;
        if (data.isNotEmpty) {
          final decodeData = json.decode(data);
          if (decodeData['status'] == true) {
            isLoading = false;
            loadCategories = CategoryModel.fromJson(decodeData);
            return loadCategories;
          }
        }
      }
    } catch (error) {
      isLoading = false;
      print(error);
    }
    notifyListeners();
  }
}
