import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/models/auth/auth_model.dart';
import 'package:shopping/models/search/search_model.dart';
import 'package:shopping/provider/providers.dart';

// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  final _key = GlobalKey<FormState>();
  SearchModel model;
  Future<SearchModel> result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            defaultHeader(title: 'Search', height: 100.h, context: context),
            Form(
              key: _key,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                      hintText: 'Search here...',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          searchController.clear();
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  keyboardType: TextInputType.text,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'please enter any thing';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    if (_key.currentState.validate()) {
                      setState(() {
                        result = context
                            .read(searchViewModelProvider)
                            .searchProduct(searchController.text);
                      });
                    }
                  },
                  onChanged: (_) {
                    if (_key.currentState.validate()) {
                      setState(() {
                        result = context
                            .read(searchViewModelProvider)
                            .searchProduct(searchController.text);
                      });
                    }
                  },
                ),
              ),
            ),
            result == null
                ? Text('on result to display')
                : FutureBuilder(
                    future: result,
                    builder: (context, snapshot) {
                      SearchModel model = snapshot.data;
                      if (snapshot.hasData) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return LoadingWidget();
                        }
                        return ListView.builder(
                          itemCount: model.data.data.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 2,
                              child: Row(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: model.data.data[index].image,
                                    height: 100.h,
                                    width: 100.w,
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                  Container(
                                    width: 200.w,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      model.data.data[index].name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 15.w),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
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
