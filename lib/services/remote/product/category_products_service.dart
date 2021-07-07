import 'dart:convert';

import 'package:shopping/constant/urls.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/models/products/category_products.dart';

class CategoryProductsService {
  CategoryProductsModel categoryProducts;
  Map<int, bool> favorites = {};
  // ignore: missing_return
  Future<CategoryProductsModel> getProductsByCategory(int id) async {
    try {
      final url = Uri.parse('${URL.categoryProducts}=$id');
      final response = await http.get(url, headers: {
        'lang': 'en',
        'Content-Type': 'application/json',
        'Authorization': token ?? ''
      });

      if (response.statusCode == 200) {
        String data = response.body;
        final decodeData = json.decode(data);
        categoryProducts = CategoryProductsModel.fromJson(decodeData);
        categoryProducts.data.products.forEach((element) {
          favorites.addAll({element.id: element.inFavorites});
        });
        return categoryProducts;
      } else
        print('status code = ${response.statusCode}');
    } catch (error) {
      print(error);
    }
  }
}
