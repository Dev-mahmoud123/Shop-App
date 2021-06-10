import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/models/onBording/onBoarding_model.dart';
import 'package:shopping/services/local/catch_data.dart';
import 'package:shopping/views/auth_screen/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onBoarding_list.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  final boardingController = PageController();

  bool isLast = false;

  void submit(){
    CatchHelper.saveData(key: 'onBoarding', value: true).then((value){
      if(value){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: defaultTextButton(
                    press: () {
                     submit();
                    },
                    text: 'SKIP',
                    color: Colors.blue,
                    fontSize: 20.w,
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: boardingController,
                  onPageChanged: (int index) {
                    if (index == onBoardingList.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  itemBuilder: (context, index) =>
                      onBoardingItems(onBoardingList[index]),
                  itemCount: onBoardingList.length,
                  physics: BouncingScrollPhysics(),
                ),
              ),
              Column(
                children: [
                  SmoothPageIndicator(
                    controller: boardingController,
                    effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        dotHeight: 10.h,
                        dotWidth: 10.w,
                        expansionFactor: 4.w,
                        spacing: 5.w,
                        activeDotColor: Colors.blue),
                    count: onBoardingList.length,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    if (isLast) {
                       submit();
                    } else {
                      boardingController.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Row(
                      children: [
                        Text(
                          'CONTINUE',
                          style: TextStyle(fontSize: 18.w),
                        ),
                        Spacer(),
                        Container(
                          height: 35.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary:defaultColor,
                      padding: EdgeInsets.all(5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget onBoardingItems(OnBoardingModel boardingModel) {
  return Container(
    child: Column(
      children: [
        Container(
          height: 250.h,
          width: double.infinity,
          margin: EdgeInsets.only(top: 10, bottom: 50),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(boardingModel.image),
          )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            boardingModel.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.w,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Text(
            boardingModel.body,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.w, color: Colors.black54),
          ),
        )
      ],
    ),
  );
}
