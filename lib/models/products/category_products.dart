import 'package:shopping/models/home/product_model.dart';

class CategoryProductsModel {
  bool status;
  Data data;


  CategoryProductsModel({this.status, this.data});

  CategoryProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {
  int currentPage;
  List<Products> products;
  String firstPageUrl;
  int lastPage;
  String lastPageUrl;
  String path;
  int perPage;
  int total;


  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      products = [];
      json['data'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    total = json['total'];
  }

}
