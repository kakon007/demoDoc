import 'dart:async';

import 'package:data_connection_checker/data_connection_checker.dart';
//import 'package:dartz/dartz_streaming.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/main_app/home.dart';
import 'package:myhealthbd_app/main_app/resource/const.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'doctor/doctor_home_screen.dart';
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
    Future.delayed(Duration.zero, () async {
      var accessToken =
          await Provider.of<AccessTokenProvider>(context, listen: false)
              .getToken();
      bool connection = await DataConnectionChecker().hasConnection;
      bool isDoctor = false;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _username = prefs.getString("username");
      _passWord = prefs.getString("password");
      if (_username.toString().toLowerCase().contains('ahc')) {
        setState(() {
          isDoctor = true;
          print('shakil2');
        });
      }
      if (connection) {
        var vm5 = Provider.of<AuthViewModel>(context, listen: false);
        await vm5.getAuthData(_username, _passWord);
        if (accessToken != null &&
            vm5.accessToken != accessToken &&
            vm5.accessToken != null) {
          appNavigator
              .getProvider<AccessTokenProvider>()
              .setToken(vm5.accessToken);
          accessToken =
              await Provider.of<AccessTokenProvider>(context, listen: false)
                  .getToken();
          Future.delayed(Duration(microseconds: 500));
          isDoctor
              ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => DoctorHomeScreen()))
              : Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      // DoctorHomeScreen(
                      HomeScreen(
                        accessToken: accessToken,
                        connection: connection,
                      )
                  //PrescriptionTemplatesPopup()
                  ));
        } else if (vm5.accessToken == accessToken) {
          Future.delayed(Duration(microseconds: 500));
          isDoctor
              ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => DoctorHomeScreen()))
              : Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      //DoctorHomeScreen(
                      HomeScreen(
                        accessToken: accessToken,
                        connection: connection,
                      )
                  //PrescriptionTemplatesPopup()
                  ));
        } else {
          Provider.of<AccessTokenProvider>(context, listen: false).signOut();
        }
      } else {
        Future.delayed(const Duration(milliseconds: 2000), () {
          isDoctor
              ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => DoctorHomeScreen()))
              : Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      //DoctorHomeScreen(
                      HomeScreen(
                          accessToken: accessToken, connection: connection)
                  //PrescriptionTemplatesPopup()
                  ));
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
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
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                HexColor('#419FCE'),
                HexColor('#3A0057'),
              ],
                  stops: [
                0.0,
                1.0
              ],
                  begin: FractionalOffset.topRight,
                  end: FractionalOffset.bottomLeft,
                  tileMode: TileMode.repeated)),
          height: height,
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //SizedBox(height: 10,),
              // SizedBox(),
              // SizedBox(),
              // SizedBox(),
              Padding(
                padding: EdgeInsets.only(top: width >= 450 ? 330.0 : 250),
                child: Center(
                  child: Container(
                    //height: isTablet? 650 : 50,
                    width: isTablet ? 650 : 260,
                    child: Image.asset(
                      kMyHealthLogo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                  child: Text(
                "Virtual Hospital of Bangladesh",
                style: TextStyle(
                    color: Colors.white, fontSize: isTablet ? 20 : 18),
              )), //  appLogoText,
              SizedBox(),
              SizedBox(),
              SizedBox(),
              SizedBox(),
              SizedBox(),
              SizedBox(),
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
