

import 'package:flutter/material.dart';
import 'package:shopping/views/favorite_screen/favorite_screen.dart';
import 'package:shopping/views/cart_screen/cart_screen.dart';
import 'package:shopping/views/home_screen/home_screen.dart';
import 'package:shopping/views/profile_screen/profile_screen.dart';
import 'package:shopping/views/settings/setting_screen.dart';

class BottomNavController extends ChangeNotifier {

  int currentIndex = 0;

  List<Widget> bottomNavScreens = [
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ];

  void changeScreens(int index){
    currentIndex = index;
    notifyListeners();
  }

}