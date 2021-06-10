import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/components/functions.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/constant/urls.dart';
import 'package:shopping/services/local/catch_data.dart';
import 'package:shopping/views/auth_screen/login_screen.dart';
import 'package:shopping/views/contacts_screen/contact_screen.dart';
import 'package:shopping/views/settings/terms_screen.dart';
import 'package:shopping/views/settings/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/provider/providers.dart';


import 'about_screen.dart';


class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          defaultHeader(height: 100.h, title: 'Settings', context: context),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    navigateTo(context, AboutScreen());
                  },
                  title: Text(
                    'About',
                    style: TextStyle(fontSize: 18.w),
                  ),
                  leading: Icon(Icons.info_outline),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    height: 1.h,
                    thickness: 1,
                  ),
                ),
                ListTile(
                  onTap: () {
                    navigateTo(context, TermsScreen());
                  },
                  title: Text(
                    'Terms',
                    style: TextStyle(fontSize: 18.w),
                  ),
                  leading: Icon(Icons.assignment_outlined),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    height: 0.5.h,
                    thickness: 1,
                  ),
                ),
                ListTile(
                  onTap: () {
                    navigateTo(context, ContactScreen());
                  },
                  title: Text(
                    'Contact Us',
                    style: TextStyle(fontSize: 18.w),
                  ),
                  leading: Icon(Icons.phone),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    height: 0.5.h,
                    thickness: 1,
                  ),
                ),
                ExpansionTileWidget(
                  title: 'Language',
                  image1: 'assets/images/ksa.png',
                  leadingWidget: Icon(Icons.language),
                  image2: 'assets/images/uk.png',
                  text1: 'Arabic',
                  text2: 'English',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    height: 1.h,
                    thickness: 1,
                  ),
                ),

                ExpansionTileWidget(
                  title: 'Theme',
                  leadingWidget: Icon(Icons.brightness_4_outlined),
                  image1: 'assets/images/sun.png',
                  image2: 'assets/images/night.png',
                  text1: 'Light',
                  text2: 'Dark',
                  fun1: () {
                    context.read(theme).lightTheme();
                  },
                  fun2: () {
                    context.read(theme).darkTheme();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    height: 0.5.h,
                    thickness: 1,
                  ),
                ),
                ListTile(
                  onTap: () {
                    CatchHelper.sharedPreferences.remove('token').then((value) {
                      navigateAndFinish(context, LoginScreen());
                    });
                  },
                  title: Text(
                    'Log out',
                    style: TextStyle(fontSize: 18.w, color: Colors.blue),
                  ),
                  leading: Icon(Icons.logout),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
