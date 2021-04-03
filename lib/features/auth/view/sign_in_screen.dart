import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/after_sign_in.dart';
import 'package:myhealthbd_app/features/auth/model/sign_in_model.dart';
import 'package:myhealthbd_app/features/auth/view/sign_up_screen.dart';
import 'package:myhealthbd_app/features/dashboard/view/dash_board_screen.dart';
import 'package:myhealthbd_app/features/hospitals/models/hospital_list_model.dart';
import 'package:myhealthbd_app/main_app/home.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/const.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:http/http.dart' as http;
SignInModel signInData;
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool value = false;
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print(height);
    var spaceBetween = SizedBox(
      height: height >= 600 ? 15.0 : 5.0,
    );
    var userName = SignUpFormField(
      controller: _username,
      margin: EdgeInsets.all(8),
      contentPadding: EdgeInsets.all(15),
      hintText: StringResources.usernameHint,
    );
    var password = SignUpFormField(
      obSecure: true,
      controller: _password,
      margin: EdgeInsets.all(8),
      contentPadding: EdgeInsets.all(15),
      hintText: StringResources.passwordHint,
    );
    var rememberMe = Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                  activeColor: HexColor('#141D53'),
                  key: Key('checkBoxKey'),
                  value: this.value,
                  onChanged: (bool value) {
                    setState(() {
                      this.value = value;
                    });
                  }),
              Text(
                StringResources.rememberMe,
                style: GoogleFonts.roboto(
                  color: HexColor('#141D53'),
                ),
              )
            ],
          ),
          Text(
            StringResources.forgetPassword,
            style: GoogleFonts.roboto(
              color: HexColor('#141D53'),
            ),
          )
        ],
      ),
    );
    var signInButton = Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Material(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: AppTheme.signInSignUpColor,
        child: SizedBox(
          height: height >= 600 ? 50 : 35,
          width: MediaQuery.of(context).size.width / .2,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringResources.signInButton,
                style: GoogleFonts.roboto(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
    var socialSignIn = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringResources.signInWith,
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w300, color: HexColor("#8592E5")),
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          height: height >= 600 ? 35 : 30,
          width: height >= 600 ? 35 : 30,
          child: Image.asset(facebookIcon),
        ),
        SizedBox(
          width: 5,
        ),
        Text(StringResources.or,
            style: GoogleFonts.roboto(
                color: HexColor("#8592E5"), fontWeight: FontWeight.w300)),
        SizedBox(
          width: 5,
        ),
        Container(
          height: 37,
          width: 37,
          child: Image.asset(
            googleIcon,
          ),
        ),
      ],
    );
    var signUp = GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUp()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(StringResources.dontHaveAccount,
                style: GoogleFonts.roboto(
                    color: HexColor("#8592E5"), fontWeight: FontWeight.w300)),
            Text(
              StringResources.signUpText,
              style: GoogleFonts.roboto(
                  color: AppTheme.signInSignUpColor,
                  fontWeight: FontWeight.bold),
            )
          ],
        ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor("#F1F9FF"),
      body: Stack(children: <Widget>[
        this._backgroundImage(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Form(
            key: _formKey,
            child: Padding(
              padding: height >= 600
                  ? EdgeInsets.only(top: 360.0)
                  : EdgeInsets.only(top: 210),
              child: new Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: HexColor("#FFFFFF"),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor("#0D1231").withOpacity(0.08),
                        spreadRadius: 10,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(right: 25, left: 15),
                  child: Column(
                    children: [
                      spaceBetween,
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                          child: Text(
                        StringResources.welcomeBack,
                        style: GoogleFonts.roboto(
                            color: HexColor("#0D1231"),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      )),
                      // spaceBetween,
                      userName,
                      password,
                      rememberMe,
                      spaceBetween,
                      GestureDetector(
                          onTap: () async {
                            String username = 'telemedCareIdPassword';
                            String password = 'secret';
                            String basicAuth =
                                'Basic ' + base64Encode(utf8.encode('$username:$password'));
                            String url =
                                "${Urls.buildUrl}auth-api/oauth/token?username=${_username.text}&password=${_password.text}&grant_type=password";
                            var response = await http.post(url,  headers: <String, String>{'authorization': basicAuth});
                            if (response.statusCode == 200) {
                              signInData = signInModelFromJson(response.body) ;
                              if (signInData != null) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomeScreen(accessToken: signInData.accessToken,),
                                    ),
                                    (Route<dynamic> route) => false);
                              }
                              setState(() {

                              });
                            } else {
                              // Toast
                            }
                          },
                          child: signInButton),
                      spaceBetween,
                      socialSignIn,
                      spaceBetween,
                      signUp
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _backgroundImage() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height >= 600 ? 350.0 : 205,
          width: MediaQuery.of(context).size.width,
          child: FadeInImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/background_signin_1.png"),
            placeholder: AssetImage(''),
          ),
        ),
        Positioned(
          child: Container(
            alignment: Alignment(0, -.85),
            child: FadeInImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/myhealth.png"),
              placeholder: AssetImage(''),
            ),
          ),
        )
      ],
    );
  }

}
