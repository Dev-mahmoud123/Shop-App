import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/models/favorites_products/favorites_products_model.dart';
import 'package:shopping/provider/providers.dart';
import 'package:shopping/services/remote/category/category_service.dart';

class GetFavViewModel extends ChangeNotifier {
  final Reader reader;

  GetFavViewModel(this.reader);

  // ignore: missing_return
  Future<GetFavoritesModel> fetchFavoriteProduct() async {
    final favouriteServicesProvider = reader(favouriteServiceProvider);
    final loadingState = reader(loadingStateProvider);

    final result = await favouriteServicesProvider.getFavoritesProducts();

    if (result.status) {
      defaultToast(message: 'Success', color: Colors.green);
      loadingState.state = false;
      return result;
    }
    defaultToast(message: 'Error', color: Colors.red);
    notifyListeners();
  }
}
