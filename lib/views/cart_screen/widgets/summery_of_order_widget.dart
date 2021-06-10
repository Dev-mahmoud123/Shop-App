import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/components/functions.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/models/carts/get_cart_model.dart';
import 'package:shopping/views/order_screen/details_order_screen.dart';

// ignore: must_be_immutable
class SummeryWidget extends StatelessWidget {
  final CartsModel model;
  dynamic chargePrice = 0.0;

  SummeryWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.h,
          color: containerColor,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('Summery of order'),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 16.h),
                  ),
                  Spacer(),
                  Text(
                    '${model.data.total} L.E',
                    style: TextStyle(fontSize: 18.w, color: Colors.black38),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    'Charge Price',
                    style: TextStyle(fontSize: 16.h),
                  ),
                  Spacer(),
                  Text(
                    '$chargePrice L.E',
                    style: TextStyle(fontSize: 18.w, color: Colors.black38),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    'Total price',
                    style: TextStyle(
                      fontSize: 16.h,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '${model.data.total + chargePrice} L.E',
                    style: TextStyle(fontSize: 18.w, color: defaultColor),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: defaultColor),
                  child: defaultTextButton(
                      press: () {
                        navigateTo(
                            context,
                            DetailsOrderScreen(
                              totalPrice: model.data.total + chargePrice,
                            ));
                      },
                      text: 'Buy',
                      color: Colors.white,
                      fontSize: 20.w)),
            ],
          ),
        )
      ],
    );
  }
}
