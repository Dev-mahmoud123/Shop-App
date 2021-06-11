import 'package:flutter/material.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/provider/providers.dart';

// ignore: must_be_immutable
class ComplaintsScreen extends StatelessWidget {
  String name, phone, email, message;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  clearTextInput() {
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            defaultHeader(height: 100.h, title: 'Complaints', context: context),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 30, bottom: 5),
                    child: defaultTextField(
                        label: 'Name',
                        prefixIcon: Icon(Icons.person),
                        type: TextInputType.name,
                        controller: _nameController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          name = value;
                        }),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: defaultTextField(
                        label: 'Phone',
                        prefixIcon: Icon(Icons.phone),
                        type: TextInputType.phone,
                        controller: _phoneController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter phone number';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          phone = value;
                        }),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: defaultTextField(
                        label: 'Email',
                        prefixIcon: Icon(Icons.email),
                        type: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          email = value;
                        }),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Message',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      controller: _messageController,
                      keyboardType: TextInputType.text,
                      maxLines: 8,
                      onSaved: (value) {
                        message = value;
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your message';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: defaultColor),
                        child: defaultTextButton(
                            press: () {
                              // Dismiss Keyboard
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                              if (_formKey.currentState.validate()) {
                                context
                                    .read(complaintsViewModelProvider)
                                    .sendComplaint(
                                      name: _nameController.text,
                                      phone: _phoneController.text,
                                      email: _emailController.text,
                                      message: _messageController.text,
                                    );
                              }
                              clearTextInput();
                            },
                            text: 'SEND',
                            color: Colors.white,
                            fontSize: 20.w)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
