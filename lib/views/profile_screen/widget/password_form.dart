import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/provider/providers.dart';

// ignore: must_be_immutable
class PasswordForm extends StatelessWidget {
  final _keyForm = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  String newPassword, currentPassword;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: defaultColor),
          child: defaultTextButton(
              press: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => Consumer(
                    builder: (context, watch, child) => defaultAlertDialog(
                      obscure: watch(passwordVisibility).isPassword,
                      suffixIcon: InkWell(
                        child: Icon(watch(passwordVisibility).suffix),
                        onTap: () {
                          watch(passwordVisibility).changePasswordVisibility();
                        },
                      ),
                      currentController: currentPasswordController,
                      newController: newPasswordController,
                      validateCurrent: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter old password';
                        }
                        return null;
                      },
                      onSaveCurrent: (value) {
                        currentPassword = value;
                      },
                      validateNew: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter new password';
                        }
                        return null;
                      },
                      onSaveNew: (value) {
                        newPassword = value;
                      },
                      pressCancel: () {
                        Navigator.of(context).pop();
                      },
                      pressSave: () {
                        context.read(changePassViewModelProvider).changePass(
                          currentPassword: currentPasswordController.text,
                          newPassword:  newPasswordController.text,
                        );
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                );
              },
              text: 'CHANGE PASSWORD',
              color: titleColor)),
    );
  }
}
