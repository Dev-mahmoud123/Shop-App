

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/models/carts/post_cart_model.dart';
import 'package:shopping/provider/providers.dart';

class PostCartViewModel extends ChangeNotifier{

  final Reader reader ;
  PostCartViewModel(this.reader);

  // ignore: missing_return
  Future<PostCartModel> postCart({int productId})async{

  final postCartService = reader(postCartServiceProvider);

  final result = await postCartService.addAndDeleteCart(productId);

  if(result.status){
    return result;
  }
  notifyListeners();
  }

}