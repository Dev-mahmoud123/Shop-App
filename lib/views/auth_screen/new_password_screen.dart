import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/components/functions.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/constant/colors.dart';

class NewPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back)),
                  SizedBox(
                    width: 50.w,
                  ),
                  Text(
                    'Reset Password',
                    style: TextStyle(fontSize: 20.w, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80.h,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: defaultTextField(
                label: 'New Password',
                type: TextInputType.visiblePassword,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter Password';
                  }
                  return null;
                },
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: defaultTextField(
                label: ' Confirm New Password',
                type: TextInputType.visiblePassword,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter Password';
                  }
                  return null;
                },
                prefixIcon: Icon(Icons.lock),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 40),
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: defaultColor),
                  child: defaultTextButton(
                      press: () {
                        navigateTo(context , NewPasswordScreen());
                      },
                      text: 'Confirm',
                      color: Colors.white,
                      fontSize: 20.w)),
            ),
          ],
        ),
      ),
    );
  }
}
