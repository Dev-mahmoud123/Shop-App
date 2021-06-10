import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/components/functions.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/provider/providers.dart';
import 'package:shopping/views/auth_screen/register_screen.dart';
import 'package:shopping/views/auth_screen/reset_password_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  String email, password;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 10),
                  child: Text(
                    'Welcome,',
                    style:
                        TextStyle(fontSize: 35.w, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Login now to browse our hot offers',
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
                Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/auth.png'),
                          fit: BoxFit.fill)),
                ),
                defaultTextField(
                    controller: _emailController,
                    label: 'Email Address',
                    prefixIcon: Icon(Icons.email),
                    type: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onChange: (value) {
                      print(value);
                    },
                    onSaved: (value) {
                      email = value;
                    }),
                SizedBox(
                  height: 15.h,
                ),
                Consumer(
                  builder: (context, watch, child) => defaultTextField(
                      controller: _passwordController,
                      label: 'Password',
                      isObscure: watch(passwordVisibility).isPassword,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                        child: Icon(watch(passwordVisibility).suffix),
                        onTap: () {
                          watch(passwordVisibility).changePasswordVisibility();
                        },
                      ),
                      type: TextInputType.visiblePassword,
                      onFieldSubmitted: (value) {
                        if (_formKey.currentState.validate()) {
                          watch(userAuth).userLogin(
                              email: _emailController.text,
                              password: _passwordController.text);
                        }
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'password must be more than 6 letters';
                        }
                        return null;
                      },
                      onChange: (value) {
                        print(value);
                      },
                      onSaved: (value) {
                        email = value;
                      }),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Consumer(
                  builder: (context, watch, child) {
                    if (watch(userAuth).isLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: defaultColor),
                        child: defaultTextButton(
                            press: () {
                              if (_formKey.currentState.validate()) {
                                watch(userAuth).userLogin(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    context: context);
                              }
                            },
                            text: 'LOGIN',
                            color: Colors.white,
                            fontSize: 20.w));
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                Center(
                    child: defaultTextButton(
                        press: () {
                           navigateTo(context, ResetPasswordScreen());
                        },
                        text: 'Do you forget password ?',
                        color: Colors.black54,
                        fontSize: 15.w)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 16.w, color: Colors.black54),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ));
                        },
                        child: Text(
                          'Register Now',
                          style: TextStyle(color: defaultColor),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
