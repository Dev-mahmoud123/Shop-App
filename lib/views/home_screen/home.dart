import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/provider/bottem_nav_provider.dart';




class Home extends ConsumerWidget {
  final navScreens = ChangeNotifierProvider<BottomNavController>(
      (ref) => BottomNavController());

  @override
  Widget build(BuildContext context, watch) {
    final screens = watch(navScreens);
    return Scaffold(
      body: screens.bottomNavScreens[screens.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourite'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
        onTap: (index) {
          screens.changeScreens(index);
        },
        currentIndex: screens.currentIndex,
      ),
    );
  }
}
