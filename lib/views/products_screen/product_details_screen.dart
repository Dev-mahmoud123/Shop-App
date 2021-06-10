import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/provider/providers.dart';
import 'package:shopping/views/products_screen/widgets/product_details_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductDetailsScreen extends StatefulWidget {
  final int id;

  const ProductDetailsScreen({Key key, this.id}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  @override
  void initState() {
    super.initState();
    context.read(productDetails).fetchProductDetails(widget.id);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, watch, child) {
        if (watch(productDetails).isLoading) {
          return LoadingWidget();
        } else {
          return ProductDetailsWidget(model: watch(productDetails).detailsModel,);
        }
      }),
    );
  }
}
