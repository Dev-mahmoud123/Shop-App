import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/components/functions.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/models/home/category_model.dart';
import 'package:shopping/models/home/home_model.dart';
import 'package:shopping/provider/providers.dart';
import 'package:shopping/views/products_screen/products_screen.dart';
import 'package:shopping/views/search_screen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read(categoryHelper).fetchCategory();
    context.read(bannerHelper).getHomeData();
    context.read(connectionProvider).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, child) {
           if(watch(connectionProvider).isOnline != null){
             return watch(connectionProvider).isOnline
                 ? SingleChildScrollView(
               child: Column(
                 children: [
                   Container(
                     height: 170.h,
                     width: double.infinity,
                     // color: Colors.red,
                     child: Stack(
                       children: [
                         defaultHeader(
                             height: 145.h,
                             title: 'Home',
                             context: context),
                         Positioned(
                             bottom: 5,
                             right: 0,
                             left: 0,
                             child: InkWell(
                                 onTap: () {
                                   navigateTo(context, SearchScreen());
                                 },
                                 child: searchWidget())),
                       ],
                     ),
                   ),
                   SizedBox(
                     height: 20.h,
                   ),
                   Consumer(builder: (context, watch, child) {
                     if (context.read(bannerHelper).homeModel != null &&
                         context.read(categoryHelper).category != null) {
                       if (watch(bannerHelper).isLoading ||
                           watch(categoryHelper)
                               .categoryService
                               .isLoading) {
                         return LoadingWidget();
                       } else {
                         return homeBody(watch(bannerHelper).homeModel,
                             watch(categoryHelper).category, context);
                       }
                     } else
                       return Container();
                   })
                 ],
               ),
             )
                 : Center(
                 child: Text(
                   'No Internet Connection',
                   style: TextStyle(fontSize: 18.w),
                 ));
           }
           return Container(
             child: Center(child: CircularProgressIndicator()),
           );
        },
      ),
    );
  }
}

Widget homeBody(HomeModel model, CategoryModel categoryModel, context) {
  return Column(
    children: [
      SizedBox(
        height: 200.h,
        width: double.infinity,
        child: Carousel(
          images: model.data.banners.map((e) {
            return CachedNetworkImage(
              imageUrl: '${e.image}',
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            );
          }).toList(),
          radius: Radius.circular(10),
          autoplayDuration: Duration(seconds: 5),
          animationDuration: Duration(seconds: 1),
          autoplay: true,
          borderRadius: true,
          animationCurve: Curves.fastOutSlowIn,
          dotSize: 5.0,
          dotSpacing: 15.0,
          dotColor: titleColor,
          dotBgColor: Colors.transparent,
          dotIncreasedColor: defaultColor,
          showIndicator: true,
        ),
      ),
      SizedBox(
        height: 20.h,
      ),
      Text(
        'Categories',
        style: TextStyle(fontSize: 20.w, fontWeight: FontWeight.w800),
      ),
      Text(
        'Choose any section',
        style: TextStyle(fontSize: 14.w, color: textColor),
      ),
      categoryGrid(categoryModel.data, context)
    ],
  );
}

Widget searchWidget() {
  return SizedBox(
    height: 45.h,
    width: double.infinity,
    child: Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 25),
      color: titleColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Search here...',
              style: TextStyle(color: textColor),
            ),
            Icon(
              Icons.search,
              color: textColor,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget categoryGrid(CategoryData data, context) {
  return GridView.count(
    crossAxisCount: 2,
    crossAxisSpacing: 5,
    mainAxisSpacing: 5,
    childAspectRatio: 1 / 1.1,
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    children: List.generate(
        data.categoryItem.length,
        (index) => InkWell(
              onTap: () {
                navigateTo(
                    context,
                    ProductScreen(
                      categoryId: data.categoryItem[index].id,
                      categoryName: data.categoryItem[index].name,
                    ));
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: data.categoryItem[index].image,
                      width: double.infinity,
                      height: 150.h,
                      fit: BoxFit.fill,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(data.categoryItem[index].name),
                  ],
                ),
              ),
            )),
  );
}
