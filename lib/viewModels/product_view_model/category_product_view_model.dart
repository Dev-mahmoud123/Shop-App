import 'package:flutter/material.dart';
import 'package:shopping/models/products/category_products.dart';
import 'package:shopping/services/remote/product/category_products_service.dart';

class CategoryProductsViewModel extends ChangeNotifier {

  CategoryProductsService categoryProductsService = CategoryProductsService();
  CategoryProductsModel _categoryProducts = CategoryProductsModel();
  CategoryProductsModel get categoryProduct => _categoryProducts;
  bool isLoading = false;



  Future<CategoryProductsModel> fetchProductsByCategory(int id) async {


    isLoading = true;
    notifyListeners();
    _categoryProducts = await categoryProductsService.getProductsByCategory(id);
      isLoading = false;
    notifyListeners();
    return _categoryProducts;
  }
}
