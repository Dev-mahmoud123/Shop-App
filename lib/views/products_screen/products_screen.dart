import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/provider/providers.dart';
import 'package:shopping/views/products_screen/widgets/product_item_widget.dart';

class ProductScreen extends StatefulWidget {
  final int categoryId;

  final String categoryName;

  ProductScreen({this.categoryId, this.categoryName});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    context.read(categoryProduct).fetchProductsByCategory(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            defaultHeader(
                height: 120.h, title: widget.categoryName, context: context),
            Consumer(builder: (context, watch, child) {
              if (watch(categoryProduct).isLoading) {
                return LoadingWidget();
              } else {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: ProductsWidget(
                      model: watch(categoryProduct).categoryProduct),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
