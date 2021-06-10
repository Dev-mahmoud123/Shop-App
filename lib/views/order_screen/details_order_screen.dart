import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/components/functions.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/views/order_screen/map_screen.dart';
import 'package:shopping/views/order_screen/widget/radio_button.dart';

class DetailsOrderScreen extends StatefulWidget {
  final double totalPrice;

  const DetailsOrderScreen({Key key, this.totalPrice}) : super(key: key);

  @override
  _DetailsOrderScreenState createState() => _DetailsOrderScreenState();
}

class _DetailsOrderScreenState extends State<DetailsOrderScreen> {
  int groupValue = 1;

  void handleRadio(int value) {
    defaultToast(message: groupValue.toString());
    setState(() {
      groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          defaultHeader(height: 100.h, title: 'Details Order'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(
                      fontSize: 28.w,
                      fontWeight: FontWeight.w400,
                      color: textColor2),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  '${widget.totalPrice} L.E',
                  style: TextStyle(
                      fontSize: 22.w,
                      fontWeight: FontWeight.w400,
                      color: Colors.red),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 40.h,
                      color: containerColor,
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          'Delivery Location',
                          style: TextStyle(
                            fontSize: 15.w,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 25),
                      child: Text(
                        'Delivery Location',
                        style: TextStyle(
                          fontSize: 15.w,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: containerColor,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 26),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          onTap: () {
                            navigateTo(context, MapScreen());
                          },
                          child: Row(
                            children: [
                              Text(
                                'Please enter delivery location',
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 11.w,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.location_on,
                                color: Colors.red,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 40.h,
                      color: containerColor,
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          'Payment Method',
                          style: TextStyle(
                            fontSize: 15.w,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          RadioButton(
                            value: 1,
                            text: 'Pay Online',
                            onChange: handleRadio,
                            groupValue: groupValue,
                          ),
                          RadioButton(
                            value: 2,
                            text: ' Pay Cash',
                            onChange: handleRadio,
                            groupValue: groupValue,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: defaultColor),
                          child: defaultTextButton(
                              press: () {},
                              text: 'Confirm',
                              color: Colors.white,
                              fontSize: 20.w)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
