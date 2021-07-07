class GetFavoritesModel {
  bool status;
  Data data;

  GetFavoritesModel({this.status, this.data});

  GetFavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {
  int currentPage;
  List<ProductData> productData;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String path;
  int to;
  int total;


  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['productData'] != null) {
      productData = [];
      json['productData'].forEach((v) {
        productData.add(new ProductData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    path = json['path'];
    to = json['to'];
    total = json['total'];
  }


}

class ProductData {
  int id;
  Product product;

  ProductData({this.id, this.product});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

}

class Product {
  int id;
  int price;
  int discount;
  String image;
  String name;
  String description;

  Product(
      {this.id,
        this.price,
        this.discount,
        this.image,
        this.name,
        this.description});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

}
