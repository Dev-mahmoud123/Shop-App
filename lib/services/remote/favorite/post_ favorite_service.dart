import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping/components/functions.dart';
import 'package:shopping/constant/urls.dart';
import 'package:shopping/models/products/change_favorite_model.dart';
import 'package:http/http.dart' as http;

class PostFavProductService {
  // ignore: missing_return
  Future<ChangeFavoriteModel> changeFavorite({int productId}) async {
    try {
      final url = Uri.parse(URL.favorites);
      final response = await http.post(
        url,
        body: json.encode(
          {'product_id': productId},
        ),
        headers: {
          'lang': 'en',
          'Content-Type': 'application/json',
          'Authorization': token ?? ''
        },
      );

      final data = response.body;
      final decodeData = json.decode(data);
      final result = ChangeFavoriteModel.fromJson(decodeData);
      return result;
    } catch (error) {
      print(error);
    }
  }
}
