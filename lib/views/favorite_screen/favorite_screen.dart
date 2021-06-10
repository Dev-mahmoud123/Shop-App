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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            defaultHeader(height: 100.h, title: 'Favorites', context: context),
            FutureBuilder(
              future: context
                  .read(favouriteViewModelProvider)
                  .fetchFavoriteProduct(),
              builder: (context, snapshot) {
                GetFavoritesModel model = snapshot.data;
                if (snapshot.hasData) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingWidget();
                  }
                  return FavoriteProductWidget(favModel: model);
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
