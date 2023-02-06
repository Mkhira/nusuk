import 'package:flutter/material.dart';

class AppTextView extends StatelessWidget {
  const AppTextView({
    Key? key,
    required this.text,
    this.color = Colors.black,
   required this.size,
    this.isLarge = false,
  }) : super(key: key);

  final double size;
  final String text;
  final Color color;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,

      style: TextStyle(

        color:   color,
        fontSize: isLarge ? 50 : size,
        fontWeight: isLarge ? FontWeight.bold : FontWeight.normal,
        // height: isLarge ? 20 : 30,
      ),
    );
  }
}
