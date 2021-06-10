import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shopping/components/functions.dart';
import 'package:shopping/constant/urls.dart';
import 'package:shopping/models/search/search_model.dart';
import 'package:http/http.dart' as http;

class SearchService  {
  // ignore: missing_return
  Future<SearchModel> search(String text) async {
    try {
      final url = Uri.parse(URL.search);
      final response = await http.post(
        url,
        body: json.encode({'text': text}),
        headers: {
          'lang': 'en',
          'Content-Type': 'application/json',
          'Authorization': token ?? ''
        },
      );

      if (response.statusCode == 200) {
        String data = response.body;
        final decodeData = json.decode(data);
        final result = SearchModel.fromJson(decodeData);
        return result;
      }
    } catch (error) {
      print(error);
    }
  }
}
