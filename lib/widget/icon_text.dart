import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_app/widget/small_text.dart';

class iconWidget extends StatelessWidget {
  final IconData icon ;
  final String text ;
  
  final Color iconcolor;
  const iconWidget({super.key, required this.icon, required this.text,  required this.iconcolor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon , color: iconcolor,),
        smallText(text: text,)
      ],
    );
  }
}