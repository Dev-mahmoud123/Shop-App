import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/components/functions.dart';
import 'package:shopping/constant/urls.dart';
import 'package:shopping/models/products/product_details_model.dart';
import 'package:http/http.dart' as http;

class ProductDetailsService  extends ChangeNotifier {

  ProductDetailsModel productDetailsModel;

  // ignore: missing_return
  Future<ProductDetailsModel> getProductDetails(int id) async {
    try {
      final url = Uri.parse('${URL.products}/$id');
      final response = await http.get(
            url,
            headers: {
              'lang': 'en',
              'Content-Type':'application/json',
              'Authorization' : token ?? ''
            },
          );

      if (response.statusCode == 200) {
        String data = response.body;
        final decodeData = json.decode(data);
        productDetailsModel = ProductDetailsModel.fromJson(decodeData);
        printFullText(productDetailsModel.toString());
        return productDetailsModel;
      }
      else
        print('statusCode = ${response.statusCode}');

    } catch (error) {
      print(error);
    }
    notifyListeners();
  }
}
