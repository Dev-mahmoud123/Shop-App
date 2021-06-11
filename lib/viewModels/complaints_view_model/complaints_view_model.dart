import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/models/carts/post_cart_model.dart';
import 'package:shopping/models/complaints/complaints_model.dart';
import 'package:shopping/provider/providers.dart';

class ComplaintsViewModel extends ChangeNotifier {
  final Reader reader;

  ComplaintsViewModel(this.reader);

  // ignore: missing_return
  Future<ComplaintsModel> sendComplaint({
    String name,
    String email,
    String phone,
    String message,
  }) async {
    final complaints = reader(complaintsProvider);

    final result = await complaints.postComplaints(name, email, phone, message);

    if (result.status) {
      defaultToast(message: result.message, color: Colors.green);
      return result;
    }
    notifyListeners();
  }
}
