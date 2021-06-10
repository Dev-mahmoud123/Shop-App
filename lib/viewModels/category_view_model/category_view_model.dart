import 'package:flutter/material.dart';
import 'package:shopping/models/home/category_model.dart';
import 'package:shopping/services/remote/category/category_service.dart';


class CategoryViewModel extends ChangeNotifier {

  CategoryService categoryService = CategoryService();
  CategoryModel _category = CategoryModel();

  CategoryModel get category => _category;

  Future<CategoryModel> fetchCategory() async {
    _category = await categoryService.getCategories();
    notifyListeners();
    return _category;
  }




}
