
import 'dart:convert';

import 'package:shopping/constant/urls.dart';
import 'package:http/http.dart' as http;
class BannerHelper{

   Future<List> fetchBanner()async{
    List banners = [];
    try{
      final url = Uri.parse(URL.banner);
      final response = await http.get(url);

      if(response.statusCode == 200){
        final decodeResponse = json.decode(response.body);
        banners = decodeResponse['banners'];
      }      return banners;
    }catch(error){
      throw error;
    }
  }

}