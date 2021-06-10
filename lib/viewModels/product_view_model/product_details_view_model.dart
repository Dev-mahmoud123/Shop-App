
import 'package:flutter/material.dart';
import 'package:shopping/models/products/product_details_model.dart';
import 'package:shopping/services/remote/product/produc_details_service.dart';

class ProductDetailsViewModel extends ChangeNotifier{

  ProductDetailsService service = ProductDetailsService();

  ProductDetailsModel _detailsModel = ProductDetailsModel();
  ProductDetailsModel get detailsModel => _detailsModel;
  bool isLoading  = false;

  Future<void> fetchProductDetails(int id) async{

    isLoading = true;
    notifyListeners();
    _detailsModel = await service.getProductDetails(id);
    isLoading = false;
    notifyListeners();

  }
}