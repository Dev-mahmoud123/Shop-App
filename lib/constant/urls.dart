class URL {

  static String baseURL = 'https://student.valuxapps.com/api';

  static get login => '$baseURL/login';
  static get register => '$baseURL/register';
  static get home => '$baseURL/home';
  static get banner => '$baseURL/banner';
  static get categories => '$baseURL/categories';
  static get categoryProducts => '$baseURL/products?category_id';
  static get favorites => '$baseURL/favorites';
  static get products => '$baseURL/products';
  static get settings => '$baseURL/settings';
  static get profile => '$baseURL/profile';
  static get updateProfile => '$baseURL/update-profile';
  static get carts => '$baseURL/carts';
  static get notification => '$baseURL/notifications';
  static get search => '$baseURL/products/search';
  static get changePassword => '$baseURL/change-password';
  static get contacts => '$baseURL/contacts';
  static get faqs => '$baseURL/faqs';



}


String token = '';
String googleApiKey = 'AIzaSyD4GeecoVUCG8yJW1r3y_X9M_C4csJ-SYE';