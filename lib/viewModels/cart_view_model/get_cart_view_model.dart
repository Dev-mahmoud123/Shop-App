

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/provider/providers.dart';



class GetCartViewModel extends ChangeNotifier{
final Reader reader ;

  GetCartViewModel(this.reader);

  Future fetchCart()async{

    final cartService = reader(cartServiceProvider);
    final loadingState = reader(loadingStateProvider);
    
    final result = await cartService.getCart();
    if(result.status) {
      loadingState.state = false;
      return result;
    }
    notifyListeners();
  }

}