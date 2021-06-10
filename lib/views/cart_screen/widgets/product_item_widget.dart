import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/models/carts/get_cart_model.dart';
import 'package:shopping/provider/providers.dart';

class ProductItemWidget extends StatelessWidget {
  final CartsModel model;

  const ProductItemWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: model.data.cartItems.length,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = model.data.cartItems[index];
          return Dismissible(
            background: Container(
              color: Colors.red,
              child: Center(
                  child: Text(
                'Delete',
                style: TextStyle(color: Colors.white, fontSize: 18.w),
              )),
            ),
            onDismissed: (_) {
              if (item.product.inCart) {
                context.read(postCartViewModel).postCart(
                    productId: model.data.cartItems[index].product.id);
              }
            },
            key: Key(item.toString()),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Row(
                children: [
                  Image(
                    height: 100.h,
                    width: 100.w,
                    image:
                        NetworkImage(item.product.image),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        height: 60.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                             item.product.name,
                              softWrap: true,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${item.product.price} L.E',
                                  style: TextStyle(color: defaultColor),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 22.h,
                                      width: 22.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: defaultColor,
                                      ),
                                      child: Consumer(
                                        builder: (context, watch, child) => IconButton(
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            watch(counter).increment(
                                                id:item.product.id);
                                          },
                                          alignment: Alignment.center,
                                          padding:
                                              EdgeInsets.symmetric(vertical: 1),
                                          iconSize: 15,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Consumer(
                                      builder: (context, watch, child) => Text(
                                        '${watch(counter).count}',
                                        style: TextStyle(color: textColor),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Container(
                                      height: 22.h,
                                      width: 22.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.black12,
                                      ),
                                      child: Consumer(
                                        builder: (context, watch, child) => IconButton(
                                          icon: Icon(
                                            Icons.remove,
                                            color: Color(0xff989898),
                                          ),
                                          onPressed: () {
                                            watch(counter).decrement(
                                                id: item.product.id);
                                          },
                                          alignment: Alignment.center,
                                          padding:
                                              EdgeInsets.symmetric(vertical: 2),
                                          iconSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
