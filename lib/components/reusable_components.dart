import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping/components/functions.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/views/cart_screen/cart_screen.dart';
import 'package:shopping/views/notification_screen/notification_screen.dart';


Widget defaultTextButton({
  @required Function press,
  @required String text,
  Color color,
  double fontSize,
}) {
  return TextButton(
    child: Text(
      text,
      style: TextStyle(color: color, fontSize: fontSize),
    ),
    onPressed: press,
  );
}

Widget defaultTextField({
  TextEditingController controller,
  TextInputType type,
  Function onChange,
  onSaved,
  validator,
  onFieldSubmitted,
  suffixPress,
  bool isObscure = false,
  String label,
  hint,
  Widget prefixIcon,
  suffixIcon,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    onChanged: onChange,
    obscureText: isObscure,
    onSaved: onSaved,
    validator: validator,
    onFieldSubmitted: onFieldSubmitted,
    decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
  );
}

defaultToast({Color color, @required String message}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}

Widget defaultHeader({
  double height,
  String title,
  BuildContext context
}) {
  return Container(
    height: height,
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      color: defaultColor,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 25.w, color: titleColor),
        ),
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            navigateTo(context, NotificationScreen());
          },
          color: titleColor,
          iconSize: 30,
        ),
      ],
    ),
  );
}

Widget productDetailsHeader({
  double height,
  String title,
  BuildContext context
}) {
  return Container(
    height: height,
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      color: defaultColor,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 25.w, color: titleColor),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                navigateTo(context, NotificationScreen());
              },
              color: titleColor,
              iconSize: 30,
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                navigateTo(context, CartScreen());
              },
              color: titleColor,
              iconSize: 30,
            )
          ],
        ),
      ],
    ),
  );
}

Widget defaultAlertDialog(
    {bool obscure = false,
    TextEditingController currentController,
    newController,
    Function validateCurrent , validateNew, onSaveCurrent , onSaveNew, pressSave , pressCancel,
      Widget suffixIcon,
    }) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

    title: Column(
      children: [
        defaultTextField(
            label: 'current password',
            type: TextInputType.visiblePassword,
            isObscure: obscure,
            controller: currentController,
            validator: validateCurrent,
            onSaved: onSaveCurrent ,
            suffixIcon: suffixIcon
        ),
        SizedBox(
          height: 10.h,
        ),
        defaultTextField(
            label: 'New password',
            type: TextInputType.visiblePassword,
            isObscure: obscure,
            controller: newController,
            validator: validateNew,
            onSaved: onSaveNew ,
            suffixIcon: suffixIcon
        ),
        SizedBox(
          height: 10.h,
        ),
        defaultTextField(
            label: 'Confirm New password',
            type: TextInputType.visiblePassword,
            isObscure: obscure,
            controller: newController,
            validator: validateNew,
            onSaved: onSaveNew,
            suffixIcon: suffixIcon
        ),
      ],
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: pressCancel,
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          SizedBox(
            width: 20.w,
          ),
          ElevatedButton(
            onPressed: pressSave,
            child: Text('Save', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
                primary: defaultColor,
                padding: EdgeInsets.symmetric(horizontal: 22),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ],
      )
    ],
  );
}

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: Center(
        child: Container(
            alignment: Alignment.center,
            height: 80.h,
            width: 80.w,
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20)),
            child: CircularProgressIndicator()),
      ),
    );
  }
}

