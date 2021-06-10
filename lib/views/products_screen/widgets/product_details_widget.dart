import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/models/products/product_details_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/provider/providers.dart';
import 'package:shopping/views/products_screen/widgets/alert_dialog_widget.dart';
import 'package:shopping/views/products_screen/widgets/cerousel_widget.dart';

// ignore: must_be_immutable
class ProductDetailsWidget extends StatefulWidget {
  final ProductDetailsModel model;

  ProductDetailsWidget({Key key, this.model}) : super(key: key);

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  bool textShowFlag = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          productDetailsHeader(
              height: 100.h, title: 'Product Details', context: context),
          SizedBox(
            height: 10.h,
          ),
          SliderImagesWidget(model: widget.model),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    width: 240.w,
                    child: Text(
                      widget.model.data.name,
                      style: TextStyle(fontSize: 16.w),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '${widget.model.data.price.toString()} L.E',
                  style: TextStyle(fontSize: 18.w, color: defaultColor),
                ),
              ),
            ],
          ),
          Container(
              height: 40.h,
              width: double.infinity,
              color:containerColor,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Product description',
                  style: TextStyle(fontSize: 14.w),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Text(
              widget.model.data.description,
              style: TextStyle(color: Color(0xff8D8D8D), fontSize: 10.w),
              overflow: TextOverflow.ellipsis,
              maxLines: textShowFlag ? 50 : 5,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                textShowFlag = !textShowFlag;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  textShowFlag
                      ? Text('Show Less', style: TextStyle(color: defaultColor))
                      : Text('Show More', style: TextStyle(color: defaultColor))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Required Quantity',
                  style: TextStyle(
                    fontSize: 16.w,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 32.h,
                      width: 35.w,
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
                            watch(counter).increment();
                          },
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 1),
                          iconSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Consumer(
                      builder: (context, watch, child) => Text(
                        '${watch(counter).count}',
                        style: TextStyle(color: defaultColor, fontSize: 21.w),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Container(
                      height: 32.h,
                      width: 35.w,
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
                            watch(counter).decrement();
                          },
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 2),
                          iconSize: 15,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (widget.model.data.inCart) {
                        showDialog(
                            context: context,
                            builder: (context) => ShowDialog(
                                  title:
                                      'the product is already \n exist in cart',
                               icon: Icons.shopping_cart_outlined,
                                ));
                      } else {
                        context
                            .read(postCartViewModel)  
                            .postCart(productId: widget.model.data.id);
                        showDialog(
                            context: context,
                            builder: (context) => ShowDialog(
                                  icon: Icons.done_rounded,
                                  title:
                                      'The product was added \n successfully',
                                ));
                      }
                    },
                    child: Text(
                      'ADD TO CART',
                      style: TextStyle(color: Colors.white, fontSize: 17.w),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: defaultColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
