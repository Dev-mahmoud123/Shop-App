
import 'dart:io';

import 'package:flutter/material.dart';

void printFullText(String text){
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match)=>  print(match.group(0)));
}

void navigateAndFinish(context , widget ){
  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => widget ));
}

void navigateTo(context , widget ){
  Navigator.push(context,MaterialPageRoute(builder: (context) => widget ));
}