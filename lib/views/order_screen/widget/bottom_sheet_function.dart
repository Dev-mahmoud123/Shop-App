
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shopping/components/reusable_components.dart';
import 'package:shopping/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/provider/providers.dart';
import 'package:shopping/views/order_screen/widget/components_bottom_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void displayBottomSheet(BuildContext ctx) async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  final _keyForm = GlobalKey<FormState>();
  final latController = TextEditingController();
  latController.text = position.latitude.toString();
  final lngController = TextEditingController();
  lngController.text = position.latitude.toString();

  final nameController = TextEditingController();
  final cityController = TextEditingController();
  final regionController = TextEditingController();
  final detailsController = TextEditingController();
  final notesController = TextEditingController();
  String name , city , region , details , notes ;
  double lat , lng;
  showModalBottomSheet(
    isScrollControlled: true,
    context: ctx,
    builder: (ctx) => Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 80),
      child: Form(
        key: _keyForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 350.w,
              height: 60.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ComponentsBottomSheet(
                    labelText: 'Latitude',
                    controller: latController,
                    validate: (String value){
                      if(value.isEmpty){
                        return 'latitude mist not be empty';
                      }
                      return null;
                    },
                    onSaved: (value){
                      lat = value;
                    },
                  ),
                  ComponentsBottomSheet(
                    labelText: 'Longitude',
                    controller: lngController,
                    validate: (String value){
                      if(value.isEmpty){
                        return 'longitude mist not be empty';
                      }
                      return null;
                    },
                    onSaved: (value){
                      lng = value;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: 350.w,
              height: 60.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ComponentsBottomSheet(
                    labelText: 'Place',
                    hintText: 'Work or Home',
                    controller: nameController,
                    validate: (String value){
                      if(value.isEmpty){
                        return 'Place mist not be empty';
                      }
                      return null;
                    },
                    onSaved: (value){
                      name = value;
                    },
                  ),
                  ComponentsBottomSheet(
                    labelText: 'City',
                    hintText: 'EX:Cairo',
                    controller: cityController,
                    validate: (String value){
                      if(value.isEmpty){
                        return 'City mist not be empty';
                      }
                      return null;
                    },
                    onSaved: (value){
                      city = value;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: 350.w,
              height: 60.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ComponentsBottomSheet(
                    labelText: 'Region',
                    hintText: 'Ex:Nasr City',
                    controller: regionController,
                    validate: (String value){
                      if(value.isEmpty){
                        return 'Region mist not be empty';
                      }
                      return null;
                    },
                    onSaved: (value){
                      region = value;
                    },
                  ),
                  ComponentsBottomSheet(
                    labelText: 'Details',
                    hintText: 'Ex:7 Wahran str',
                    controller: detailsController,
                    validate: (String value){
                      if(value.isEmpty){
                        return 'Details mist not be empty';
                      }
                      return null;
                    },
                    onSaved: (value){
                      details = value;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ComponentsBottomSheet(
              labelText: 'Notes',
              controller: notesController,
              onSaved: (value){
                notes = value;
              },
            ),
            SizedBox(
              height: 80.h,
            ),
            Container(
              width: 350.w,
              height: 60.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 165.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: defaultColor),
                    child: defaultTextButton(
                      press: () {
                        if(_keyForm.currentState.validate()){
                          ctx.read(postAddressViewModel).addAddress(
                            name: nameController.text,
                            city: cityController.text,
                            details: detailsController.text,
                            latitude: double.parse(latController.text) ,
                            longitude: double.parse(lngController.text),
                            notes: notesController.text,
                            region: regionController.text
                          );
                          Navigator.of(ctx).pop();
                        }
                      },
                      text: 'Save',
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: 165.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: defaultColor),
                    child: defaultTextButton(
                      press: () {
                        Navigator.of(ctx).pop();
                      },
                      text: 'Cancel',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
