import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Loader extends StatelessWidget {
  final double size;

  Loader({this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        radius: size ?? 10,
      ),
    );
  }
}
