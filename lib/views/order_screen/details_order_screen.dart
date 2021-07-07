import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/provider/providers.dart';
import 'package:shopping/views/order_screen/widget/radio_button.dart';
import 'package:shopping/views/order_screen/widget/select_address_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsOrderScreen extends StatefulWidget {
  final double totalPrice;

  const DetailsOrderScreen({Key key, this.totalPrice}) : super(key: key);

  @override
  _DetailsOrderScreenState createState() => _DetailsOrderScreenState();
}

class _DetailsOrderScreenState extends State<DetailsOrderScreen> {
  @override
  Widget build(BuildContext context) {
    final switchValue = context.read(switchValueProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            defaultHeader(
                height: 100.h, title: 'Details Order', context: context),
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
                      SizedBox(height: 20.h,),
                      SelectAddressWidget(),
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
                            Consumer(
                              builder: (context, watch, child) => RadioButton(
                                value: 1,
                                text: 'Pay Online',
                                onChange:
                                    watch(radioButtonProvider).handleRadio,
                                groupValue:
                                    watch(radioButtonProvider).groupValue,
                              ),
                            ),
                            Consumer(
                              builder: (context, watch, child) => RadioButton(
                                value: 2,
                                text: ' Pay Cash',
                                onChange:
                                    watch(radioButtonProvider).handleRadio,
                                groupValue:
                                    watch(radioButtonProvider).groupValue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 5),
                        child: Row(
                          children: [
                            Text(
                              'Use Points',
                              style: TextStyle(fontSize: 17.w),
                            ),
                            Spacer(),
                            Consumer(
                              builder: (context, watch, child) => Switch(
                                  value: watch(switchValueProvider).switchValue,
                                  onChanged:
                                      watch(switchValueProvider).handleSwitch,

                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
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
                              fontSize: 20.w),
                        ),
                      ),
                    ],
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
