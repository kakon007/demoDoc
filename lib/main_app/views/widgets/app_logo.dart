//import 'package:p7app/professional/main_app/resource/const.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;


  AppLogo({this.size});

  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    final double iconSize = size ?? iconTheme.size;
    return Image.network('https://www.google.com/search?q=doctor+logo&client=ubuntu&hs=omX&channel=fs&sxsrf=ALeKk00bQKT4SNGWzANUJq7kfX5eQvGhfA:1611134006710&source=lnms&tbm=isch&sa=X&ved=2ahUKEwis1p7xlaruAhUyjuYKHRxIA4AQ_AUoAXoECBUQAw&biw=1853&bih=974#imgrc=2j_WybBF9Q1IvM',height: iconSize,fit: BoxFit.cover,);
  }
}
