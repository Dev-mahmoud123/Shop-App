import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/models/contacts/contacts_model.dart';
import 'package:shopping/provider/providers.dart';
import 'package:shopping/views/contacts_screen/widget/contact_widget.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            defaultHeader(height: 100.h, title: 'Contact Us', context: context),
            FutureBuilder(
              future: context.read(contactViewModelProvider).fetchContacts(),
              builder: (context, snapshot) {
                ContactsModel model = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingWidget();
                }
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: model.data.data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      ContactWidget(
                        color: Colors.blue,
                        image: model.data.data[index].image,
                        text: model.data.data[index].value,
                      ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
