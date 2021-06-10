import 'dart:convert';

import 'package:shopping/constant/urls.dart';
import 'package:shopping/models/contacts/contacts_model.dart';
import 'package:http/http.dart' as http;

class ContactService {
  // ignore: missing_return
  Future<ContactsModel> getContacts() async {
    try {
      final url = Uri.parse(URL.contacts);
      final response = await http.get(url, headers: {'lang': 'en'});

      if (response.statusCode == 200) {
        String data = response.body;
        final decodeData = json.decode(data);
        final result = ContactsModel.fromJson(decodeData);
        return result;
      }
    } catch (error) {
      print(error);
    }
  }
}
