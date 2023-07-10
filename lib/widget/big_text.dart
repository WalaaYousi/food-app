import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class bigText extends StatelessWidget {
  Color? color ;
  final String text;
  double size;
  TextOverflow textOverflow;
  bigText({super.key, this.color= const Color(0xFF332d2b),
  required this.text,this.textOverflow=TextOverflow.ellipsis,
  this.size=20
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow:textOverflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        color: color,
        fontSize: size,
      ),
    );
  }
}