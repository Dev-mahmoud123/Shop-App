import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/models/search/search_model.dart';
import 'package:shopping/provider/providers.dart';

class SearchViewModel extends ChangeNotifier {
  final Reader reader;

  SearchViewModel(this.reader);

// ignore: missing_return
  Future<SearchModel> searchProduct(String text) async {
    final search = reader(searchProvider);
    final loadingState = reader(loadingStateProvider);

    final result = await search.search(text);
    if (result.status) {
      loadingState.state = false;
      return result;
    }
    notifyListeners();
  }
}
