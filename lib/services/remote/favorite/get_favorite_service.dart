
import 'dart:convert';


import 'package:shopping/components/functions.dart';
import 'package:shopping/constant/urls.dart';
import 'package:shopping/models/favorites_products/favorites_products_model.dart';
import 'package:http/http.dart' as http;

class GetFavProductService {

  // ignore: missing_return
  Future<GetFavoritesModel> getFavoritesProducts() async {

    try {
      final url = Uri.parse(URL.favorites);
      final response = await http.get(
        url,
        headers: {
          'lang': 'en',
          'Content-Type': 'application/json',
          'Authorization': token ?? ''
        },
      );

      if (response.statusCode == 200) {
        String data = response.body;
        final decodeData = json.decode(data);
        final result = GetFavoritesModel.fromJson(decodeData);
        return result ;
      }
      else
        print('response = ${response.statusCode}');

    } catch (error) {
      print(error);
    }

  }

}


