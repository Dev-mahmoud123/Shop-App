import 'package:flutter/material.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/models/faqs/faqs_model.dart';
import 'package:shopping/provider/providers.dart';

class FAQsScreen extends StatefulWidget {
  @override
  _FAQsScreenState createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            defaultHeader(height: 100.h, title: 'FAQS', context: context),
            FutureBuilder(
                future: context.read(faqsViewModelProvider).fetchFaqs(),
                builder: (context, snapshot) {
                  FAQsModel model = snapshot.data;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingWidget();
                  }
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: model.data.data.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5 , horizontal: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: defaultColor
                        ),
                        child: ExpansionTile(
                          textColor: Colors.black,
                          title: Text(
                            model.data.data[index].question,
                            style: TextStyle(fontSize: 18.w),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(model.data.data[index].answer,softWrap: true,
                                  style: TextStyle(fontSize: 15.w, height: 1.5.h , color: Colors.white)),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
