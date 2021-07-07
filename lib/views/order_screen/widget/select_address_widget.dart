import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/components/functions.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/models/address/get_address_model.dart';
import 'package:shopping/provider/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../map_screen.dart';

class SelectAddressWidget extends StatefulWidget {
  @override
  _SelectAddressWidgetState createState() => _SelectAddressWidgetState();
}

class _SelectAddressWidgetState extends State<SelectAddressWidget> {
  String selectItem = 'Select Your Location';
  int addressId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 270.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: containerColor,
          ),
          margin: EdgeInsets.only(left: 20, right: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: context.read(addressViewModelProvider).fetchAddress(),
                  builder: (context, snapshot) {
                    GetAddressModel model = snapshot.data;
                    if (snapshot.hasData) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return Container(
                        width: 250.w,
                        child: DropdownButton(
                          hint: Text(selectItem),
                          underline: Container(),
                          isExpanded: true,
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                          items: model.data.data.map(
                            (address) {
                              return DropdownMenuItem<int>(
                                child: Text(
                                  '${address.details},${address.region},${address.city}',
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15.w),
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                ),
                                value: address.id,
                              );
                            },
                          ).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              addressId = newValue;
                            });
                          },
                          value: addressId,
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: containerColor,
          ),
          margin: EdgeInsets.only(left: 5, right: 5),
          child: InkWell(
            onTap: () => navigateTo(context, MapScreen()),
            child: Center(
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 30.w,
                  color: defaultColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
