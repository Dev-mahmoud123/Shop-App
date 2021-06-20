import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/models/products/product_details_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/provider/providers.dart';

class SliderImagesWidget extends StatefulWidget {
  final ProductDetailsModel model;

  const SliderImagesWidget({Key key, this.model}) : super(key: key);

  @override
  _SliderImagesWidgetState createState() => _SliderImagesWidgetState();
}

class _SliderImagesWidgetState extends State<SliderImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: double.infinity,
      child: Stack(
        children: [
          Carousel(
            images: widget.model.data.images.map((e) {
              return CachedNetworkImage(
                imageUrl: '${e.toString()}',
                width: double.infinity,
                fit: BoxFit.fill,
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
          Positioned(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer(
              builder: (context , watch , child)=> Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color:widget.model.data.inFavorites ? defaultColor: Colors.black12),
                child: IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {
                   setState(() {
                     widget.model.data.inFavorites = !widget.model.data.inFavorites;
                   });
                    watch(postFavViewModelProvider).addAndDeleteFavorite(productId: widget.model.data.id);

                  },
                  color: Colors.white,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
