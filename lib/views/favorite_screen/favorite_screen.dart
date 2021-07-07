import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/models/favorites_products/favorites_products_model.dart';
import 'package:shopping/provider/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'favorite_product_widget.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read(connectionProvider).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(
      builder: (context, watch, child) {
        return watch(connectionProvider).isOnline
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    defaultHeader(
                        height: 100.h, title: 'Favorites', context: context),
                    FutureBuilder(
                      future: context
                          .read(favouriteViewModelProvider)
                          .fetchFavoriteProduct(),
                      builder: (context, snapshot) {
                        GetFavoritesModel model = snapshot.data;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return LoadingWidget();
                        }
                        return model.data.productData.length == 0
                            ? Center(child: Text('There are no  favorites'))
                            : FavoriteProductWidget(favModel: model);
                      },
                    ),
                  ],
                ),
              )
            : Center(
                child: Text(
                'No Internet Connection',
                style: TextStyle(fontSize: 18.w),
              ));
      },
    ));
  }
}
