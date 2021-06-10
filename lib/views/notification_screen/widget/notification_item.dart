import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/models/notification/notification_model.dart';

class NotificationItem extends StatelessWidget {

 final NotificationModel model;

  const NotificationItem({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: model.data.data.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => Card(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     model.data.data[index].title,
                      style: TextStyle(
                        fontSize: 17.w,
                        fontWeight: FontWeight.w600,
                        color: defaultColor
                      ),
                    ),
                    Text(
                      model.data.data[index].message,
                      style: TextStyle(
                        fontSize: 15.w,
                      ),

                    ),
                  ],
                ),
              ),
            ));
  }
}
