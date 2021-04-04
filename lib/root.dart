import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/home.dart';
import 'package:myhealthbd_app/main_app/resource/const.dart';

import 'main_app/util/app_version.dart';

class Root extends StatefulWidget {
  String accessToken;
  String userName;
  Root({this.accessToken, this.userName});
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  void initState() {
    widget.accessToken="";
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen(accessToken: widget.accessToken, userName: widget.userName))));
  }

  @override
  Widget build(BuildContext context) {
    var myHealthLogo = Image.asset(
      kMyHealthLogo,
      fit: BoxFit.cover,
    );
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: HexColor('#F1F9FF'),
      body: Center(
        child: Container(
          height: height,
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(),
              SizedBox(),
              SizedBox(),
              SizedBox(),
              Container(
                  child: Center(
                  child: Container(
                    height: 420,
                    child: Image.asset(kMyHealthLogo,
                      fit: BoxFit.cover,
                    ),
                  ),
                    )),
              //  appLogoText,
              SizedBox(),

              AppVersionWidgetLowerCase(),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
