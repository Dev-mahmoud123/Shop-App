import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/provider/providers.dart';


class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {



  @override
  void initState() {
    super.initState();
    context.read(settingHelper).FetchSetting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            defaultHeader(height: 100.h, title: 'About Us'  , context: context),

            Consumer(
                builder: (context, watch, child) {
                  if (watch(settingHelper).isLoading) {
                    return LoadingWidget();
                  }
                  else {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(watch(settingHelper).model.data.about,
                        style: TextStyle(fontSize: 17.w), softWrap: true,),);
                  }
                }
            ),
          ],
        ),
      ),

    );
  }
}
