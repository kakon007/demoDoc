import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/model/sign_in_model.dart';
import 'package:myhealthbd_app/features/auth/view/sign_up_screen.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/main_app/home.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/const.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/util/validator.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_text_field_rounded.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

SignInModel signInData;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool value = true;
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  bool isObSecure;
  bool validUser;
  bool isClicked;
  var user;
  var pass;
  Future<void> getUSerDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user = prefs.getString("username");
    pass = prefs.getString("password");
    var abc = prefs.getBool("value");
    _username.text = user;
    _password.text = pass;
  }

  @override
  void initState() {
    // TODO: implement initState
    isObSecure = true;
    validUser = true;
    isClicked = false;
    getUSerDetails();

    print(pass);

    super.initState();
  }

  final FocusNode _emailFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print(height);
    var spaceBetween = SizedBox(
      height: height >= 700 ? 10.0 : 5.0,
    );
    var userName = SignUpFormField(
      validator: Validator().nullFieldValidate,
      controller: _username,
      margin: EdgeInsets.only(top: 3, left: 8, right: 8),
      contentPadding: EdgeInsets.all(15),
      hintText: StringResources.usernameHint,
    );
    var password = SignUpFormField(
      validator: Validator().nullFieldValidate,
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Please enter password';
      //   }
      //   return null;
      // },
      suffixIcon: IconButton(
        icon: isObSecure == true
            ? Icon(Icons.visibility_off, color: AppTheme.appbarPrimary)
            : Icon(
                Icons.visibility,
                color: AppTheme.appbarPrimary,
              ),
        onPressed: () {
          setState(() {
            isObSecure == true ? isObSecure = false : isObSecure = true;
          });
        },
      ),
      obSecure: isObSecure,
      controller: _password,
      margin: EdgeInsets.only(left: 8, right: 8),
      contentPadding: EdgeInsets.only(left: 15, right: 15, top: 15),
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
          height: height * .07,
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
          style: GoogleFonts.roboto(fontWeight: FontWeight.w300, color: HexColor("#8592E5")),
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
            style: GoogleFonts.roboto(color: HexColor("#8592E5"), fontWeight: FontWeight.w300)),
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(StringResources.dontHaveAccount,
                style: GoogleFonts.roboto(color: HexColor("#8592E5"), fontWeight: FontWeight.w300)),
            Text(
              StringResources.signUpText,
              style: GoogleFonts.roboto(
                  color: AppTheme.signInSignUpColor, fontWeight: FontWeight.bold),
            )
          ],
        ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor("#F1F9FF"),
      body: Stack(children: <Widget>[
        this._backgroundImage(),
        Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(top: height >= 700 ? height * .52 : height * .41),
                child: new Container(
                  height: height >= 700
                      ? MediaQuery.of(context).size.height * .48
                      : MediaQuery.of(context).size.height * .6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25), topRight: Radius.circular(25)),
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
                          height: height >= 700 ? 15 : 5,
                        ),
                        Center(
                            child: Text(
                          StringResources.welcomeBack,
                          style: GoogleFonts.roboto(
                              color: HexColor("#0D1231"),
                              fontSize: height * .03,
                              fontWeight: FontWeight.w600),
                        )),
                        userName,
                        password,
                        validUser == false
                            ? Container(
                                color: Colors.red[100],
                                child: Text(
                                  "Invalid Credential",
                                  style: GoogleFonts.poppins(color: Colors.red),
                                ))
                            : SizedBox(),
                        rememberMe,
                        isClicked == false
                            ? GestureDetector(
                                onTap: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      isClicked = true;
                                    });
                                    String username = 'telemedCareIdPassword';
                                    String password = 'secret';
                                    String basicAuth =
                                        'Basic ' + base64Encode(utf8.encode('$username:$password'));
                                    String url =
                                        "${Urls.buildUrl}auth-api/oauth/token?username=${_username.text}&password=${_password.text}&grant_type=password";
                                    var response = await http.post(Uri.parse(url),
                                        headers: <String, String>{'authorization': basicAuth});
                                    if (response.statusCode == 200) {
                                      //print(response.body);
                                      signInData = signInModelFromJson(response.body);
                                      if (signInData != null) {
                                        print(signInData.accessToken);
                                        print(signInData.expiresIn);
                                        Navigator.of(context).pushAndRemoveUntil(
                                            MaterialPageRoute(
                                              builder: (BuildContext context) => HomeScreen(
                                                accessToken: signInData.accessToken,
                                              ),
                                            ),
                                            (Route<dynamic> route) => false);
                                        //Provider.of<AccessTokenProvider>(context, listen: false).setToken(signInData.accessToken);
                                        appNavigator
                                            .getProvider<AccessTokenProvider>()
                                            .setToken(signInData.accessToken);
                                        SharedPreferences prefs =
                                            await SharedPreferences.getInstance();
                                        if (this.value == true) {
                                          print(_username.text);
                                          prefs.setString("username", _username.text);
                                          prefs.setString("password", _password.text);
                                          prefs.setBool("value", true);
                                        } else {
                                          prefs.remove("username");
                                          prefs.remove("password");
                                          prefs.setBool("value", false);
                                        }
                                      }
                                    } else {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      if (this.value == true) {
                                        print(_username.text);
                                        prefs.setString("username", _username.text);
                                        prefs.setString("password", _password.text);
                                        prefs.setBool("value", true);
                                      } else {
                                        print(_password.text);
                                        prefs.remove("username");
                                        prefs.remove("password");
                                        prefs.setBool("value", false);
                                      }
                                      setState(() {
                                        if (validUser == true) {
                                          validUser = false;
                                        }
                                        if (isClicked == true) {
                                          isClicked = false;
                                        }
                                      });
                                    }
                                  }
                                },
                                child: signInButton)
                            : CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(AppTheme.appbarPrimary),
                              ),
                        spaceBetween,
                        // socialSignIn,
                        spaceBetween,
                        signUp
                      ],
                    ),
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
    return Container(
      height: MediaQuery.of(context).size.height * .47,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        kMyHealthLogo,
        fit: BoxFit.fill,
      ),
    );
  }
}
