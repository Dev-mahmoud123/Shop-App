
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpansionTileWidget extends StatelessWidget {
  final String  image1, image2  , title , text1 , text2;
  final Widget leadingWidget;
  final Function fun1 , fun2;

  const ExpansionTileWidget({Key key, this.image1, this.title, this.text1, this.text2, this.image2, this.leadingWidget, this.fun1, this.fun2, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ExpansionTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18.w),
      ),
      leading: leadingWidget,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 5),
          child: Column(
            children: [
              GestureDetector(
                onTap: fun1,
                child: Row(
                  children: [
                    Image.asset(
                      image1,
                      width: 30.w,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      text1,
                      style: TextStyle(fontSize: 15.w),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: fun2,
                child: Row(
                  children: [
                    Image.asset(
                      image2,
                      width: 30.w,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      text2,
                      style: TextStyle(fontSize: 15.w),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
