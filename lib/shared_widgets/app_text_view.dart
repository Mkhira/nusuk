import 'package:flutter/material.dart';

class AppTextView extends StatelessWidget {
  const AppTextView({
    Key? key,
    required this.text,
    this.textAlign,
    this.color = Colors.black,
   required this.size,
    this.isLarge = false,
     this.fontWeight
  }) : super(key: key);

  final double size;
  final String text;
  final Color color;
  final bool isLarge;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign??TextAlign.center,

      style: TextStyle(

        color:   color,
        fontSize: isLarge ? 50 : size,
        fontWeight: fontWeight ?? (isLarge ? FontWeight.bold : FontWeight.normal),
        // height: isLarge ? 20 : 30,
      ),
    );
  }
}
