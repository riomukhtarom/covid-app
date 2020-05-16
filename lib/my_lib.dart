import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({this.text, this.color, this.size});

  final String text;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
