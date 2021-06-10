
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/models/contacts/contacts_model.dart';
import 'package:shopping/provider/providers.dart';

class ContactsViewModel extends ChangeNotifier{

  final Reader reader;

  ContactsViewModel(this.reader);

  // ignore: missing_return
  Future<ContactsModel> fetchContacts()async{

    final contacts = reader(contactProvider);
    final loadingState = reader(loadingStateProvider);

    final result = await contacts.getContacts();

    if(result.status){
      loadingState.state = false;
      return result;
    }

    notifyListeners();
  }


}
