import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';

class Loader extends StatelessWidget {
  final double size;

  Loader({this.size});

  @override
  Widget build(BuildContext context) {
    return Center(child: Center(
      child: CircularProgressIndicator(  valueColor:
      AlwaysStoppedAnimation<Color>(
          AppTheme.appbarPrimary),),
    ));
  }
}
