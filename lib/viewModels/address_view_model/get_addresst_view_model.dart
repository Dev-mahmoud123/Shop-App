
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/provider/providers.dart';

class GetAddressViewModel extends ChangeNotifier{
final Reader reader ;

  GetAddressViewModel(this.reader);

  Future fetchAddress()async{

    final address = reader(addressServiceProvider);
    final loadingState = reader(loadingStateProvider);
    
    final result = await address.getAddress();
    if(result.status) {
      loadingState.state = false;
      return result;
    }
    notifyListeners();
  }

}