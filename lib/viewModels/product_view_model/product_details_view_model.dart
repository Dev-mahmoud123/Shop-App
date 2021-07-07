import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shopping/models/products/product_details_model.dart';
import 'package:shopping/provider/providers.dart';
import 'package:shopping/services/remote/product/produc_details_service.dart';

class ProductDetailsViewModel extends ChangeNotifier {
  final Reader reader;

  ProductDetailsViewModel(this.reader);

  Future<void> fetchProductDetails(int id) async {

    final productDetails = reader(productDetailsProvider);
    final loadingState = reader(loadingStateProvider);

    final result = await productDetails.getProductDetails(id);
    if (result.status) {
      loadingState.state = false;
      return result;
    }
    notifyListeners();
  }
}
