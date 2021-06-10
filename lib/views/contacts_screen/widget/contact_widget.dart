import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactWidget extends StatelessWidget {
  final String image, text;
  final Color color;

  const ContactWidget({Key key, this.image, this.text, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 10),
      child: Row(
        children: [
          Container(
              width: 70.w,
              height: 70.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: color,
              ),
              child: Image(
                image: NetworkImage(image),
                height: 50.h,
                width: 50.w,
                fit: BoxFit.fill,
              )),
          SizedBox(
            width: 20.w,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 15.w),
          ),
        ],
      ),
    );
  }
}
