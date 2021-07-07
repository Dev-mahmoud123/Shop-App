import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/models/products/product_details_model.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:  context.read(productDetailsViewModelProvider).fetchProductDetails(widget.id),
        builder: (context , snapshot){
          if(snapshot.hasData){
            ProductDetailsModel model = snapshot.data;
            if(snapshot.connectionState == ConnectionState.waiting){
              return LoadingWidget();
            }
            return ProductDetailsWidget(model:model ,);
          }
          return Container(
            child: Center(child: LoadingWidget()),
          );
        },
      ),
    );
  }
}
