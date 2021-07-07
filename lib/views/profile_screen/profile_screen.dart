import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/provider/providers.dart';
import 'package:shopping/views/profile_screen/widget/password_form.dart';
import 'package:shopping/views/profile_screen/widget/select_image.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  String selectedImage;
  String name, email, phone;

  @override
  void initState() {
    super.initState();
    context.read(profileHelper).getProfile();
    context.read(connectionProvider).startMonitoring();
  }

  void _onSelectedImage(File pickedImage) {
    selectedImage = base64Encode(pickedImage.readAsBytesSync());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, child) {
          return watch(connectionProvider).isOnline
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      defaultHeader(
                          height: 100.h, title: 'My Account', context: context),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Consumer(
                          builder: (context, watch, child) {
                            if (watch(profileHelper).isLoading) {
                              return LoadingWidget();
                            } else {
                              var model = watch(profileHelper).profile;
                              nameController.text = model.data.name;
                              emailController.text = model.data.email;
                              phoneController.text = model.data.phone;

                              return Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    SelectImage(
                                      onSelected: _onSelectedImage,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    defaultTextField(
                                        label: 'Name',
                                        prefixIcon: Icon(Icons.person),
                                        type: TextInputType.name,
                                        validator: (String value) {
                                          if (value.isEmpty) {
                                            return 'Name must not be empty';
                                          }
                                          return null;
                                        },
                                        controller: nameController,
                                        onSaved: (value) {
                                          name = value;
                                        }),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    defaultTextField(
                                        label: 'Email',
                                        prefixIcon: Icon(Icons.email),
                                        type: TextInputType.emailAddress,
                                        validator: (String value) {
                                          if (value.isEmpty) {
                                            return 'Email must not be empty';
                                          }
                                          return null;
                                        },
                                        controller: emailController,
                                        onSaved: (value) {
                                          email = value;
                                        }),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    defaultTextField(
                                        label: 'Phone',
                                        prefixIcon: Icon(Icons.phone),
                                        type: TextInputType.phone,
                                        validator: (String value) {
                                          if (value.isEmpty) {
                                            return 'Phone must not be empty';
                                          }
                                          return null;
                                        },
                                        controller: phoneController,
                                        onSaved: (value) {
                                          phone = value;
                                        }),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    PasswordForm(),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: defaultColor),
                                        child: defaultTextButton(
                                            press: () {
                                              if (_formKey.currentState
                                                  .validate()) {
                                                context
                                                    .read(
                                                        updateProfileViewModel)
                                                    .putProfile(
                                                        name:
                                                            nameController.text,
                                                        email: emailController
                                                            .text,
                                                        phone: phoneController
                                                            .text,
                                                        image: selectedImage);
                                              }
                                            },
                                            text: 'UPDATE',
                                            color: titleColor)),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Text(
                    'No Internet Connection',
                    style: TextStyle(fontSize: 18.w),
                  ),
                );
        },
      ),
    );
  }
}
