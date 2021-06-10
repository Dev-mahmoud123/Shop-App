import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/provider/providers.dart';
import 'package:shopping/services/local/catch_data.dart';
import 'package:shopping/views/auth_screen/login_screen.dart';
import 'package:shopping/views/home_screen/home.dart';
import 'package:shopping/views/onboardung_screen/onboarding_screen.dart';
import 'constant/urls.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CatchHelper.init();

  Widget widget;
  bool onBoarding = CatchHelper.getData(key: 'onBoarding');
  token = CatchHelper.getData(key: 'token');
  print(token);
  bool isDark = CatchHelper.sharedPreferences.getBool('isDark');

  if (onBoarding != null) {
    if (token != null)
      widget = Home();
    else
      widget = LoginScreen();
  } else
    widget = OnBoardingScreen();

  runApp(ProviderScope(
    child: MyApp(
      startWidget: widget,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({this.startWidget});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => Consumer(
        builder: (context, watch, child) => MaterialApp(
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: defaultColor,
                    statusBarIconBrightness: Brightness.dark),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: defaultColor,
                unselectedItemColor: Colors.grey,
              )),
          darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: defaultColor,
                    statusBarIconBrightness: Brightness.dark),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor('333739'),
                type: BottomNavigationBarType.fixed,
                selectedItemColor: defaultColor,
                unselectedItemColor: Colors.grey,
              )),
          themeMode: watch(theme).isDark ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: startWidget,
        ),
      ),
    );
  }
}
