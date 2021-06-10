import 'package:flutter/material.dart';
import 'package:shopping/constant/colors.dart';

class RadioButton extends StatelessWidget {
  final int value;
  final int groupValue;
  final Function onChange;
  final String text;

  const RadioButton({Key key, this.onChange, this.value, this.text, this.groupValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            Radio(value: value, groupValue: groupValue, onChanged: onChange , activeColor: defaultColor,),
            Text(text , style: TextStyle(fontSize: 15),),
          ],
        );


  }
}
