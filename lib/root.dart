import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/main_app/home.dart';
import 'package:myhealthbd_app/main_app/resource/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'doctor/features/dashboard/view/doctor_home_screen.dart';
import 'features/auth/view_model/app_navigator.dart';
import 'features/auth/view_model/auth_view_model.dart';
import 'main_app/util/app_version.dart';

class Root extends StatefulWidget {

  Root();
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  var _username;
  var _passWord;
  @override
  void initState() {

    Future.delayed(Duration.zero,()async{
      SharedPreferences prefs =
      await SharedPreferences.getInstance();
      _username= prefs.getString("username");
      _passWord= prefs.getString("password");
       var vm5= Provider.of<AuthViewModel>(context, listen: false);
      await vm5.getAuthData(_username, _passWord);
      var accessToken=await Provider.of<AccessTokenProvider>(context, listen: false).getToken();
      if(accessToken!= null && vm5.accessToken!= accessToken){
         appNavigator.getProvider<AccessTokenProvider>().setToken(vm5.accessToken);
         accessToken=await Provider.of<AccessTokenProvider>(context, listen: false).getToken();
      }
      await Future.delayed(Duration(microseconds: 500));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) =>
          // DoctorHomeScreen(
          HomeScreen(accessToken: accessToken

          )));

      // SharedPreferences prefs =
      // await SharedPreferences.getInstance();
      // prefs.setString("accessToken", vm5.accessToken);
      // if(accessToken!= null && vm5.accessToken!= accessToken)
      //   accessToken= vm5.accessToken;
    });

    super.initState();
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
