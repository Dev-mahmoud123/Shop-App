import 'dart:convert';

import 'package:shopping/components/functions.dart';
import 'package:shopping/constant/urls.dart';
import 'package:shopping/models/address/get_address_model.dart';
import 'package:http/http.dart' as http;

class GetAddressService {
  // ignore: missing_return
  Future<GetAddressModel> getAddress() async {
    try {
      final url = Uri.parse(URL.address);
      final response = await http.get(
        url,
        headers: {
          'lang': 'en',
          'Content-Type': 'application/json',
          'Authorization': token ?? ''
        },
      );
      if (response.statusCode == 200) {
        String data = response.body;
        final decodeData = json.decode(data);
        final result = GetAddressModel.fromJson(decodeData);
        return result;
      }
    } catch (error) {
      print(error);
    }
  }
}
