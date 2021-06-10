import 'dart:convert';
import 'package:shopping/constant/urls.dart';
import 'package:shopping/models/carts/get_cart_model.dart';
import 'package:http/http.dart' as http;


class GetCartService  {

  // ignore: missing_return
  Future<CartsModel> getCart() async {

    try {
      final url = Uri.parse(URL.carts);
      final response = await http.get(url, headers: {
        'lang': 'en',
        'Content-Type': 'application/json',
        'Authorization': token ?? ''
      });

      if (response.statusCode == 200) {
        String data = response.body;
        final decodeData = json.decode(data);
        final result = CartsModel.fromJson(decodeData);
        return result;
      } else {
        print('response status :${response.statusCode}');
      }
    } catch (error) {

      print(error);
    }
  }
}
