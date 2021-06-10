import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/models/carts/get_cart_model.dart';
import 'package:shopping/provider/providers.dart';
import 'package:shopping/views/cart_screen/widgets/product_item_widget.dart';
import 'package:shopping/views/cart_screen/widgets/summery_of_order_widget.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            defaultHeader(height: 100.h, title: 'Cart' , context: context),
            FutureBuilder(
              future: context.read(cartViewModelProvider).fetchCart(),
              builder: (context, snapshot) {
                CartsModel model = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingWidget();
                }
                return model.data.cartItems.length == 0
                    ? Text('There is no cart product')
                    : Column(
                        children: [
                          ProductItemWidget(
                            model: model,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SummeryWidget(
                            model: model,
                          ),
                        ],
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
