import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shopping/components/functions.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/views/auth_screen/new_password_screen.dart';

class VerifyCodeScreen extends StatelessWidget {
  final String email;
  const VerifyCodeScreen({Key key, this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 80.h,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Verify Code' , style: TextStyle(fontSize: 16.w),),
            ),
            OTPTextField(
              width: double.infinity,
              length: 4,
              keyboardType: TextInputType.number,
              fieldWidth: 50,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
            ),
            SizedBox(height: 30.h,),
            Center(
              child: defaultTextButton(
                  press: () {},
                  text: 'Resend Code',
                  color: Colors.redAccent,
                  fontSize: 15.w),
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
                        navigateTo(context , NewPasswordScreen());
                      },
                      text: 'Send',
                      color: Colors.white,
                      fontSize: 20.w)),
            ),
          ],
        ),
      ),
    );
  }
}

