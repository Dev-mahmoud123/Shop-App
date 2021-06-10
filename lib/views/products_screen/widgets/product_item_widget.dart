import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/components/functions.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/models/products/category_products.dart';
import 'package:shopping/provider/providers.dart';
import 'package:shopping/views/products_screen/product_details_screen.dart';

class ProductsWidget extends StatefulWidget {
  final CategoryProductsModel model;

  const ProductsWidget({Key key, this.model}) : super(key: key);

  @override
  _ProductsWidgetState createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 1.5,
      mainAxisSpacing: 2,
      childAspectRatio: 1 / 1.4,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(
        widget.model.data.products.length,
        (index) => InkWell(
          onTap: () {
            navigateTo(
              context,
              ProductDetailsScreen(id: widget.model.data.products[index].id),
            );
          },
          child: Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.model.data.products[index].image,
                      width: double.infinity,
                      height: 150.h,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Consumer(
                            builder: (context, watch, child) => Container(
                              height: 25.h,
                              width: 25.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: widget
                                        .model.data.products[index].inFavorites
                                    ? Colors.red
                                    : Colors.black26,
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.model.data.products[index]
                                            .inFavorites =
                                        !widget.model.data.products[index]
                                            .inFavorites;
                                  });
                                  watch(postFavViewModelProvider).addAndDeleteFavorite(
                                     productId:widget.model.data.products[index].id);
                                },
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 1),
                                iconSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Consumer(
                            builder: (context, watch, child) => Container(
                              height: 25.h,
                              width: 25.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: widget.model.data.products[index].inCart
                                    ? Colors.red
                                    : Colors.black26,
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.model.data.products[index].inCart =
                                        !widget
                                            .model.data.products[index].inCart;
                                  });

                                  watch(postCartViewModel).postCart(
                                      productId:
                                          widget.model.data.products[index].id);
                                },
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 1),
                                iconSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget.model.data.products[index].discount != 0)
                      Positioned(
                        bottom: 0,
                        child: Container(
                          color: Colors.red,
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 2.0),
                          child: Text(
                            'DISCOUNT',
                            style:
                                TextStyle(color: Colors.white, fontSize: 9.0.w),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    widget.model.data.products[index].name,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 14.w),
                  ),
                ),
                Spacer(),
                if (widget.model.data.products[index].discount != 0)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.model.data.products[index].oldPrice.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.model.data.products[index].price.toString(),
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.w500),
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
                                      id: widget.model.data.products[index].id);
                                },
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 1),
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
                                      id: widget.model.data.products[index].id);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
