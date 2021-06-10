import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/models/products/change_favorite_model.dart';
import 'package:shopping/provider/providers.dart';

class FavoriteViewModel extends ChangeNotifier {
  final Reader reader;

  FavoriteViewModel(this.reader);

  // ignore: missing_return
  Future<ChangeFavoriteModel> addAndDeleteFavorite({int productId}) async {
    final favServiceProvider = reader(postFavServiceProvider);

    final result =
        await favServiceProvider.changeFavorite(productId: productId);

    if (result.status) {
      defaultToast(message: result.message, color: Colors.green);
      return result;
    }
    defaultToast(message: result.message, color: Colors.red);
    notifyListeners();
  }
}
