import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComponentsBottomSheet extends StatelessWidget {
  final TextEditingController controller;
  final String labelText, hintText;
  final Function onSaved  , validate;

  const ComponentsBottomSheet(
      {Key key, this.controller, this.labelText, this.hintText, this.onSaved, this.validate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165.w,
      height: 50.h,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        controller: controller,
        onSaved: onSaved,
        validator: validate,
      ),
    );
  }
}
