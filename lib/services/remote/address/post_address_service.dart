import 'dart:convert';

import 'package:shopping/constant/urls.dart';
import 'package:shopping/models/address/post_address_model.dart';
import 'package:shopping/models/carts/post_cart_model.dart';
import 'package:http/http.dart' as http;

class PostAddressService {
  // ignore: missing_return
  Future<PostAddressModel> postAddress(
    String name,
    String city,
    String region,
    String details,
    String notes,
    double latitude,
    double longitude,
  ) async {
    try {
      final url = Uri.parse(URL.address);
      final response = await http.post(
        url,
        body: json.encode(
          {
            'name': name,
            'city': city,
            'region': region,
            'details': details,
            'notes': notes,
            'latitude': latitude,
            'longitude': longitude,
          },
        ),
        headers: {
          'lang': 'en',
          'Content-Type': 'application/json',
          'Authorization': token ?? ''
        },
      );

      if (response.statusCode == 200) {
        String data = response.body;
        final decodeData = json.decode(data);
        final result = PostAddressModel.fromJson(decodeData);
        return result;
      }
    } catch (error) {
      print(error);
    }
  }
}
