import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPath;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/constant/colors.dart';
import 'package:shopping/provider/providers.dart';

class SelectImage extends StatefulWidget {
  final Function onSelected;

  const SelectImage({Key key, this.onSelected}) : super(key: key);

  @override
  _SelectImageState createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  File _storedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _takeImage() async {
    final pickedImage =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 20);
    if (pickedImage == null) {
      return;
    }
    setState(() {
      if (pickedImage != null) {
        _storedImage = File(pickedImage.path);
      }
    });

    final imageName = path.basename(pickedImage.path);
    final appDirectory = await sysPath.getApplicationDocumentsDirectory();
    final savedImage =
        await _storedImage.copy('${appDirectory.path}/$imageName');
    widget.onSelected(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(120),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(120),
            child: _storedImage != null
                ? Image.file(
                    _storedImage,
                    fit: BoxFit.fill,
                    width: 120.w,
                    height: 120.h,
                  )
                : CachedNetworkImage(
                    imageUrl: context.read(profileHelper).profile.data.image,
                    height: 120.h,
                    width: 120.w,
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
          ),
        ),
        Positioned(
            bottom: -11.h,
            left: -11.w,
            child: IconButton(
                icon: Icon(
                  Icons.camera_alt_rounded,
                  color: defaultColor,
                  size: 36,
                ),
                onPressed: _takeImage))
      ],
    );
  }
}
