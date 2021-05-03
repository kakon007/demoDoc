import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/home.dart';
import 'package:myhealthbd_app/main_app/resource/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'doctor/features/dashboard/view/doctor_home_screen.dart';
import 'features/auth/view_model/auth_view_model.dart';
import 'main_app/util/app_version.dart';

class Root extends StatefulWidget {
  String accessToken;
  Root({this.accessToken});
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  var _username;
  var _passWord;
  getValue() async {
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    _username= prefs.getString("username");
    _passWord= prefs.getString("password");
  }
  @override
  void initState() {
    getValue();
    Future.delayed(Duration.zero,()async{
      var vm5= Provider.of<AuthViewModel>(context, listen: false);
      await vm5.getAuthData(_username, _passWord);
      SharedPreferences prefs =
      await SharedPreferences.getInstance();
      prefs.setString("accessToken", vm5.accessToken);
      if(widget.accessToken!= null && vm5.accessToken!= widget.accessToken)
        widget.accessToken= vm5.accessToken;
    });

    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
               // DoctorHomeScreen(
                HomeScreen(accessToken: widget.accessToken

            ))));
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
