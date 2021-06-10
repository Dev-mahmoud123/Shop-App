import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/models/auth/auth_model.dart';
import 'package:shopping/provider/providers.dart';

class UpdateProfileViewModel extends ChangeNotifier {
  final Reader reader;

  UpdateProfileViewModel(this.reader);

  // ignore: missing_return
  Future<Auth> putProfile({
    String name,
    String email,
    String password,
    String phone,
    String image,
  }) async {
    final updateProfile = reader(updateProfileServiceProvider);

    final result = await updateProfile.updateProfile(
        name: name, email: email, phone: phone, password: password, image: image);

    if (result.status) {
      defaultToast(
          message: result.message, color: Colors.green);
      return result;
    }
    defaultToast(message: result.message, color: Colors.red);
    print(result.data.name);
  }
}
