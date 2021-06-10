
import 'package:flutter/material.dart';
import 'package:shopping/models/settings/setting_model.dart';
import 'package:shopping/services/remote/settings/settings_service.dart';


class SettingViewModel extends ChangeNotifier{

  SettingsService service = SettingsService();
  SettingsModel _model = SettingsModel();
  SettingsModel get model => _model;
  bool isLoading = false;

  // ignore: non_constant_identifier_names
  Future<void> FetchSetting()async {
    isLoading = true;
    notifyListeners();

    _model = await service.getSetting();
    isLoading = false;
    notifyListeners();
  }



}
