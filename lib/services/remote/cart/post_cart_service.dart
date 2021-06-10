import 'dart:convert';

import 'package:shopping/constant/urls.dart';
import 'package:shopping/models/carts/post_cart_model.dart';
import 'package:http/http.dart' as http;

class PostCartService {
  // ignore: missing_return
  Future<PostCartModel> addAndDeleteCart(int productId) async {
    try {
      final url = Uri.parse(URL.carts);
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

      if (response.statusCode == 200) {
        String data = response.body;
        final decodeData = json.decode(data);
        final result = PostCartModel.fromJson(decodeData);
        return result;
      }
    } catch (error) {
      print(error);
    }
  }
}
