import 'dart:convert';
import 'package:shopping/components/functions.dart';
import 'package:shopping/constant/urls.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/models/faqs/faqs_model.dart';

class FAQsService {
  // ignore: missing_return
  Future<FAQsModel> getFaqs() async {
    try {
      final url = Uri.parse(URL.faqs);
      final response = await http.get(url, headers: {'lang': 'en'});

      if (response.statusCode == 200) {
        String data = response.body;
        final decodeData = json.decode(data);
        printFullText(decodeData.toString());
        final result = FAQsModel.fromJson(decodeData);
        return result;
      }
    } catch (error) {
      print(error);
    }
  }
}
