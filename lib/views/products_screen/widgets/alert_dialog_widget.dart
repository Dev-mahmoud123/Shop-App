import 'package:flutter/material.dart';
import 'package:shopping/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowDialog extends StatelessWidget {
  final String title;
  final IconData icon;

  const ShowDialog({Key key, this.title, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Icon(
        icon,
        color: Colors.green,
        size: 60,
      ),
      content: Text(
        title ,
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child:  Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  primary: defaultColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          ),
      ],
    );
  }
}
