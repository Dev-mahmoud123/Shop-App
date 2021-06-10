import 'package:flutter/material.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/provider/providers.dart';


class TermsScreen extends StatefulWidget {
  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {

  @override
  void initState() {
    super.initState();
    context.read(settingHelper).FetchSetting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          defaultHeader(height: 100.h, title: 'Terms' , context: context),

          Consumer(builder: (context, watch, child) {
            if (watch(settingHelper).isLoading) {
              return LoadingWidget();
            }
            else {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Text(watch(settingHelper).model.data.terms, softWrap: true,
                  style: TextStyle(fontSize: 17.w),),
              );
            }
          }),
        ],
      ),
    );
  }
}
