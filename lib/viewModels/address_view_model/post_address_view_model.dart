import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/models/address/post_address_model.dart';
import 'package:shopping/models/carts/post_cart_model.dart';
import 'package:shopping/provider/providers.dart';

class PostAddressViewModel extends ChangeNotifier {
  final Reader reader;

  PostAddressViewModel(this.reader);

  // ignore: missing_return
  Future<PostAddressModel> addAddress(
      {String name,
      String city,
      String region,
      String details,
      String notes,
      double latitude,
      double longitude}) async {
    final postAddressService = reader(postAddressServiceProvider);

    final result = await postAddressService.postAddress(
        name, city, details, region, notes, latitude, longitude);

    if (result.status) {
      defaultToast(message: result.message, color: Colors.green);
      return result;
    }
    notifyListeners();
  }
}
