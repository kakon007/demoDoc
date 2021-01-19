import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomLoader extends StatelessWidget {
  final double size;

  CustomLoader({this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        radius: size ?? 10,
      ),
    );
  }
}
