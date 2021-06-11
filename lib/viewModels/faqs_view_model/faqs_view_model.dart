import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/models/faqs/faqs_model.dart';
import 'package:shopping/provider/providers.dart';

class FAQsViewModel extends ChangeNotifier {
  final Reader reader;

  FAQsViewModel(this.reader);

  // ignore: missing_return
  Future<FAQsModel> fetchFaqs() async {
    final faqs = reader(faqsProvider);
    final loadingState = reader(loadingStateProvider);

    final result = await faqs.getFaqs();

    if (result.status) {
      loadingState.state = false;
      return result;
    }

    notifyListeners();
  }
}
