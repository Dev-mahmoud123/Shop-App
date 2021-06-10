import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/components/functions.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/views/auth_screen/verify_code_screen.dart';

// ignore: must_be_immutable
class ResetPasswordScreen extends StatelessWidget {
  String email;

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                    style: TextStyle(fontSize: 20.w , fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100.h,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: defaultTextField(
                      label: 'Email',
                      prefixIcon: Icon(Icons.email),
                      onSaved: (String value) {
                        email = value;
                      },
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Email must not be empty';
                        } else
                          return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: defaultColor),
                      child: defaultTextButton(
                          press: () {
                           navigateTo(context , VerifyCodeScreen());
                          },
                          text: 'Confirm',
                          color: Colors.white,
                          fontSize: 20.w)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
