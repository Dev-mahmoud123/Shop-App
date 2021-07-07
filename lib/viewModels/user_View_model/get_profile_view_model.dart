import 'package:flutter/material.dart';
import 'package:shopping/components/functions.dart';
import 'package:shopping/models/auth/auth_model.dart';
import 'package:shopping/services/remote/user/get_profile_service.dart';

class ProfileViewModel extends ChangeNotifier {
  GetProfileService profileService = GetProfileService();
  Auth profile = Auth();
  bool isLoading = false;

  Future<void> fetchProfile() async {
    isLoading = true;
    notifyListeners();

   profile = await profileService.getProfile();
    isLoading = false;
    notifyListeners();
  }
}
