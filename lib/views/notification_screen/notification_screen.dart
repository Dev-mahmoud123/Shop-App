import 'package:flutter/material.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/models/notification/notification_model.dart';
import 'package:shopping/views/notification_screen/widget/notification_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/provider/providers.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            defaultHeader(
              height: 100.h,
              title: 'Notifications',
            ),
            FutureBuilder(
                future: context.read(notificationViewModel).fetchNotification(),
                builder: (context, snapshot) {
                  NotificationModel model = snapshot.data;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingWidget();
                  }
                  return model.data.data.length == 0
                      ? Center(child: Text('There is no Notifications'))
                      : NotificationItem(model: model);
                }),
          ],
        ),
      ),
    );
  }
}
