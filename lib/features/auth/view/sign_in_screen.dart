import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/admin/dashboard/dashboard_admin.dart';
import 'package:myhealthbd_app/doctor/doctor_home_screen.dart';
import 'package:myhealthbd_app/features/auth/model/sign_in_model.dart';
import 'package:myhealthbd_app/features/auth/view/sign_up_screen.dart';
import 'package:myhealthbd_app/features/auth/view/widgets/reset_password.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/auth/view_model/auth_view_model.dart';
import 'package:myhealthbd_app/features/my_health/repositories/dbmanager.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/home.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/const.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/util/validator.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

SignInModel signInData;

class SignIn extends StatefulWidget {
  bool isBook;

  SignIn({this.isBook});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool value = true;
  final DbManager dbmManager = new DbManager();
  SwitchAccounts accounts;
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
    user = prefs.getString("usernameRemember").toUpperCase();
    pass = prefs.getString("passwordRemember");
    var rememberMe = prefs.getBool("value");
    accounts = null;
    if (rememberMe == true) {
      _username.text = user;
      _password.text = pass;
    }
  }

  List<SwitchAccounts> accountsList;
  String addAccountValue;

  @override
  void initState() {
    // TODO: implement initState
    isObSecure = true;
    validUser = true;
    isClicked = false;
    getUSerDetails();
    Future.delayed(Duration.zero, () async {
      accountsList = await dbmManager.getAccountList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print(height);
    var spaceBetween = SizedBox(
      height: height >= 700 ? 10.0 : 5.0,
    );
    var userName = SignUpFormField(
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp("[ ]")),
      ],
      textFieldKey: Key("userNameKey"),
      topPadding: isTablet ? 30 : 25,
      validator: Validator().nullFieldValidate,
      hintSize: isTablet ? 17 : 15,
      controller: _username,
      margin: EdgeInsets.only(top: 3, left: 8, right: 8),
      contentPadding: EdgeInsets.all(15),
      hintText: StringResources.usernameHint,
    );
    var password = SignUpFormField(
      textFieldKey: Key("passwordKey"),
      validator: Validator().nullFieldValidate,
      topPadding: isTablet ? 30 : 25,
      hintSize: isTablet ? 17 : 15,
      suffixIcon: IconButton(
        key: Key("visibleButtonKey"),
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
                    fontSize: isTablet
                        ? 17
                        : width <= 330
                            ? 13
                            : 15),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus.unfocus();
              if (_username.text == '' || _username.text == null) {
                Fluttertoast.showToast(
                    msg: "Please write your username",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else {
                _resetPassword(context, _username.text);
              }
            },
            child: Text(
              StringResources.forgetPassword,
              style: GoogleFonts.roboto(
                  color: HexColor('#141D53'),
                  fontSize: isTablet
                      ? 17
                      : width <= 330
                          ? 13
                          : 15),
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
          height: isTablet ? 50 : height * .07,
          width: MediaQuery.of(context).size.width / .2,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringResources.signInButton,
                key: Key("signInButtonKey"),
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
        key: Key('signUpKey'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringResources.dontHaveAccount,
              style: GoogleFonts.roboto(
                  fontSize: isTablet
                      ? 17
                      : width <= 330
                          ? 13
                          : 15,
                  color: HexColor("#8592E5"),
                  fontWeight: FontWeight.w300),
            ),
            Text(
              StringResources.signUpText,
              style: GoogleFonts.roboto(
                  color: AppTheme.signInSignUpColor,
                  fontWeight: FontWeight.bold,
                  fontSize: isTablet
                      ? 17
                      : width <= 330
                          ? 13
                          : 15),
            )
          ],
        ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor("#3E5B9B"),
      body: Stack(children: <Widget>[
        this._backgroundImage(),
        Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(
                    top: height >= 700 ? height * .52 : height * .41),
                child: new Container(
                  height: height >= 700
                      ? MediaQuery.of(context).size.height * .48
                      : MediaQuery.of(context).size.height * .6,
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
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: isTablet ? 45 : 15, left: isTablet ? 45 : 15),
                      child: Column(
                        children: [
                          spaceBetween,
                          SizedBox(
                            height: height >= 700 ? 15 : 5,
                          ),
                          Center(
                              child: Text(
                            StringResources.welcomeBack,
                            key: Key("welcomeBackTextKey"),
                            style: GoogleFonts.roboto(
                                color: HexColor("#0D1231"),
                                fontSize: height * .03,
                                fontWeight: FontWeight.w600),
                          )),
                          SizedBox(
                            height: width > 360 ? 15 : 10,
                          ),
                          userName,
                          password,
                          validUser == false
                              ? Container(
                                  color: Colors.red[100],
                                  child: Text(
                                    "Invalid username or password",
                                    key: Key("invalidCredentialKey"),
                                    style:
                                        GoogleFonts.poppins(color: Colors.red),
                                  ))
                              : SizedBox(),
                          rememberMe,
                          isClicked == false
                              ? GestureDetector(
                                  onTap: () async {
                                    bool isDoctor = false;
                                    if (_formKey.currentState.validate()) {
                                      setState(() {
                                        isClicked = true;
                                      });
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      var vm5 = Provider.of<AuthViewModel>(
                                          context,
                                          listen: false);
                                      var companyVm= Provider.of<UserImageViewModel>(context, listen: false);
                                      await vm5.getAuthData(
                                          _username.text, _password.text);
                                      await companyVm.userDetails(accessToken: vm5.accessToken);
                                      print('usertype ${companyVm.userType}');
                                      // if (_username
                                      //     .toString()
                                      //     .toLowerCase()
                                      //     .contains('ahc')) {
                                      //   setState(() {
                                      //     isDoctor = true;
                                      //   });
                                      // }
                                      if (vm5.accessToken != null &&
                                          companyVm.userType==3) {
                                        accountsList.forEach((item) {
                                          if (item.username.contains(
                                              _username.text.toUpperCase())) {
                                            addAccountValue = _username.text;
                                          }
                                        });
                                        if (addAccountValue == null) {
                                          var vm3 =
                                              Provider.of<UserImageViewModel>(
                                                  context,
                                                  listen: false);
                                          var vm4 =
                                              Provider.of<UserDetailsViewModel>(
                                                  context,
                                                  listen: false);
                                          await vm4
                                              .getSwitchData(vm5.accessToken);
                                          await vm3
                                              .switchImage(vm5.accessToken);
                                          print("abcd");
                                          SwitchAccounts switchAccounts =
                                              new SwitchAccounts(
                                            name:
                                                vm4.userSwitchDetailsList?.fname==null ? "" :vm4.userSwitchDetailsList.fname ,
                                            relation:
                                                vm3.switchDetails?.photo == null
                                                    ? ""
                                                    : vm3.switchDetails.photo,
                                            username:
                                                _username.text.toUpperCase(),
                                            password: _password.text,
                                          );
                                          dbmManager
                                              .insertStudent(switchAccounts)
                                              .then((id) => {
                                                    print("name" +
                                                        vm4.userSwitchDetailsList
                                                            .fname),
                                                    print("photo" +
                                                        vm3.switchDetails
                                                            .photo),
                                                  });
                                        } else {}
                                      }
                                      if (vm5.accessToken != null) {
                                        prefs.setString(
                                            "username", _username.text);
                                        prefs.setString(
                                            "usernameRemember", _username.text);
                                        prefs.setString(
                                            "password", _password.text);
                                        prefs.setString(
                                            "passwordRemember", _password.text);
                                        appNavigator
                                            .getProvider<AccessTokenProvider>()
                                            .setToken(vm5.accessToken);
                                        if (companyVm.userType==2) {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        DoctorHomeScreen(),
                                                  ),
                                                  (Route<dynamic> route) =>
                                                      false);
                                        } else if(companyVm.userType==3) {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        HomeScreen(
                                                      accessToken:
                                                          vm5.accessToken,
                                                    ),
                                                  ),
                                                  (Route<dynamic> route) =>
                                                      false);
                                        }
                                        else if(companyVm.userType==0){
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                              MaterialPageRoute(
                                                builder: (BuildContext
                                                context) =>
                                                AdminDashboard()
                                              ),
                                                  (Route<dynamic> route) =>
                                              false);
                                        }
                                        if (this.value == true) {
                                          prefs.setBool("value", true);
                                        } else {
                                          prefs.setBool("value", false);
                                        }
                                      } else {
                                        if (this.value == true) {
                                          print(_username.text);
                                          prefs.setBool("value", true);
                                        } else {
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
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      AppTheme.appbarPrimary),
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
        ),
      ]),
    );
  }

  Widget _backgroundImage() {
    bool isTablet = Responsive.isTablet(context);
    return Padding(
      padding: EdgeInsets.only(
          left: isTablet ? MediaQuery.of(context).size.width * .15 : 0,
          top: MediaQuery.of(context).size.width >= 450 ? 70 : 50),
      child: Container(
        height: isTablet
            ? MediaQuery.of(context).size.height * .52
            : MediaQuery.of(context).size.height * .85,
        width: isTablet
            ? MediaQuery.of(context).size.width * .7
            : MediaQuery.of(context).size.width,
        child: Image.asset(
          kMyHealthLogos,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  void _resetPassword(BuildContext context, String userName) {
    showDialog(
        context: context,
        builder: (context) {
          return ResetPasswordAlert(
            userName: userName,
          );
        });
  }
}
