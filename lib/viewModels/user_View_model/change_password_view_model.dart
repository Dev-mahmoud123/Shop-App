import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/models/auth/change_password_model.dart';
import 'package:shopping/provider/providers.dart';

class ChangePasswordViewModel extends ChangeNotifier {
  final Reader reader;

  ChangePasswordViewModel(this.reader);

  // ignore: missing_return
  Future<ChangePasswordModel> changePass({
    String currentPassword,
    String newPassword,
  }) async {
    final changePasswordProvider = reader(changePassProvider);

    final result = await changePasswordProvider.changePassword(
        currentPassword: currentPassword, newPassword: newPassword);

    if(result.status){
      defaultToast(message: result.message, color: Colors.green);
      return result ;
    }
    defaultToast(message: result.message, color: Colors.red);
  }
}
