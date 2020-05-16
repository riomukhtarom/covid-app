import 'package:flutter/material.dart';

class PageSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'rio',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              child: Image.asset("assets/images/pp.jpg"),
              width: 100,
            ),
          ),
        ),
      ),
    );
  }
}
