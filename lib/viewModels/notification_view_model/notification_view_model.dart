import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/provider/providers.dart';

class NotificationViewModel extends ChangeNotifier {
  final Reader reader;

  NotificationViewModel(this.reader);

  Future fetchNotification() async {

    final notificationService = reader(notificationServiceProvider);
    final loadingState = reader(loadingStateProvider);

    final result = await notificationService.getNotification();

    if (result.status) {
      loadingState.state = false;
      return result;
    }
    notifyListeners();
  }
}
