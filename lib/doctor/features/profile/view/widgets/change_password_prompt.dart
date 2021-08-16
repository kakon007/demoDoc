import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/change_password_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/util/validator.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:myhealthbd_app/main_app/views/widgets/change_password_text_fileld.dart';
import 'package:myhealthbd_app/main_app/views/widgets/common_button.dart';
import 'package:myhealthbd_app/main_app/views/widgets/loader.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChangeDoctorPasswordAlert extends StatefulWidget {
  @override
  _ChangeDoctorPasswordAlertState createState() => _ChangeDoctorPasswordAlertState();
}

class _ChangeDoctorPasswordAlertState extends State<ChangeDoctorPasswordAlert> {
  final _currentPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  bool isExpanded = false;
  bool isCurrentObSecure;
  bool isNewObSecure;
  bool isConfirmObSecure;

  @override
  void initState() {
    // TODO: implement initState
    isCurrentObSecure = true;
    isNewObSecure = true;
    isConfirmObSecure = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var changePassViewModel = Provider.of<PasswordChangeViewModel>(context);
    var width = MediaQuery.of(context).size.width * 0.44;
    var deviceWidth = MediaQuery.of(context).size.width ;
    var currentPassword = SignUpFormField(
      topPadding: isTablet ? 25 : 18,
      textFieldKey: Key('currentPasswordKey'),
      controller: _currentPassword,
      validator: Validator().nullFieldValidate,
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelLeftPadding: 0,
      labelText: "Current Password",
      labelFontSize: isTablet ? 15 : 12,
      hintSize: isTablet ? 15 : 14,
      hintText: "Current password",
      minimizeBottomPadding: true,
      // suffixIcon: IconButton(
      //   icon: isCurrentObSecure == true
      //       ? Icon(Icons.visibility_off, color: AppTheme.appbarPrimary)
      //       : Icon(
      //     Icons.visibility,
      //     color: AppTheme.appbarPrimary,
      //   ),
      //   onPressed: () {
      //     setState(() {
      //       isCurrentObSecure == true
      //           ? isCurrentObSecure = false
      //           : isCurrentObSecure = true;
      //     });
      //   },
      // ),
      //obSecure: isCurrentObSecure,
    );
    var newPassword = SignUpFormField(
      textFieldKey: Key('newPasswordKey'),
      topPadding: isTablet ? 25 : 18,
      controller: _newPassword,
      labelLeftPadding: 0,
      labelFontSize: isTablet ? 15 : 12,
      hintSize: isTablet ? 15 : 14,
      validator: Validator().nullFieldValidate,
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      minimizeBottomPadding: true,
      labelText: "New Password",
      hintText: "New password",
      // suffixIcon: IconButton(
      //   icon: isNewObSecure == true
      //       ? Icon(Icons.visibility_off, color: AppTheme.appbarPrimary)
      //       : Icon(
      //     Icons.visibility,
      //     color: AppTheme.appbarPrimary,
      //   ),
      //   onPressed: () {
      //     setState(() {
      //       isNewObSecure == true
      //           ? isNewObSecure = false
      //           : isNewObSecure = true;
      //     });
      //   },
      // ),
     // obSecure: isNewObSecure,
    );
    var spaceBetween = SizedBox(height: 10);
    var confirmPassword = SignUpFormField(
      textFieldKey: Key('confirmPasswordKey'),
      topPadding: isTablet ? 25 : 18,
      minimizeBottomPadding: true,
      controller: _confirmPassword,
      labelLeftPadding: 0,
      validator: (v) {
        return Validator().validateConfirmPassword(_newPassword.text, v);
      },
      labelFontSize: isTablet ? 15 : 12,
      hintSize: isTablet ? 15 : 14,
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Confirm Password",
      hintText: "Confirm password",
      // suffixIcon: IconButton(
      //   icon: isConfirmObSecure == true
      //       ? Icon(Icons.visibility_off, color: AppTheme.appbarPrimary)
      //       : Icon(
      //     Icons.visibility,
      //     color: AppTheme.appbarPrimary,
      //   ),
      //   onPressed: () {
      //     setState(() {
      //       isConfirmObSecure == true
      //           ? isConfirmObSecure = false
      //           : isConfirmObSecure = true;
      //     });
      //   },
      // ),
     // obSecure: isConfirmObSecure,
    );
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(
              horizontal:
              isTablet ? deviceWidth * .1 : deviceWidth* .1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            constraints: BoxConstraints(
              minHeight: !isExpanded
                ? isTablet
                ? 360
                : deviceWidth<=330? 330 :340
                : isTablet
                ? 400

                : deviceWidth<=330? 370 : 380, ),

            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      'Change Password',
                      style: GoogleFonts.poppins(
                          //color: AppTheme.appbarPrimary,
                          fontSize: isTablet ? 18 : 15.0,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding( padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 0),
                    child: Column(children: [
                      spaceBetween,
                      currentPassword,
                      spaceBetween,
                      newPassword,
                      spaceBetween,
                      confirmPassword,
                      spaceBetween,
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: isTablet? 200 :width<=360? width*.7:  width * .8,
                            height: isTablet ? 50 : width * .25,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              textColor: AppTheme.appbarPrimary,
                              color: HexColor('#FF6161'),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(8),
                                 ),
                              child: Text(
                                StringResources.cancelText,
                                style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          SizedBox(
                            width: isTablet? 200 : width<=360? width*.7 : width * .8,
                            height: isTablet ? 50 : width * .25,
                            child: FlatButton(
                              textColor: Colors.white,
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  await changePassViewModel.getPassword(
                                      _newPassword.text,
                                      _confirmPassword.text,
                                      _currentPassword.text);
                                  if (changePassViewModel.message ==
                                      "Your current password not matche,Please enter current password !!") {
                                    showAlert(context,
                                        changePassViewModel.message);
                                  }
                                  if (changePassViewModel.message ==
                                      "Change password saved successfully") {
                                    SharedPreferences prefs =
                                    await SharedPreferences
                                        .getInstance();
                                    prefs.setString(
                                        "password", _newPassword.text);
                                    prefs.setString(
                                        "passwordRemember", _newPassword.text);
                                    Navigator.pop(context);
                                    showAlert(context,
                                        changePassViewModel.message);
                                  }
                                }
                              },
                              color: AppTheme.buttonActiveColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "Save",
                                style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ), // submitButton
                        ],
                      )
                    ],),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showAlert(BuildContext context, String message) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var changePassViewModel =
    Provider.of<PasswordChangeViewModel>(context, listen: false);
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.center,
          child: Material(
            type: MaterialType.transparency,
            child: Container(
                height: 150,
                width: isTablet
                    ? MediaQuery.of(context).size.width * .7
                    : MediaQuery.of(context).size.width <= 330
                    ? 250
                    : 290,
                // child: SizedBox.expand(child: FlutterLogo()),
                //margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(begin: Alignment.topRight,
                      // end: Alignment.topCenter,
                      stops: [
                        0.2,
                        0.5,
                      ], colors: [
                        HexColor("#D6DCFF"),
                        HexColor("#FFFFFF"),
                      ]),
                  //borderRadius: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: 260,
                              child: Text(
                                changePassViewModel.message,
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ],
                    ),
                    //Text(changePassViewModel.message),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            minWidth: 120,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            color: AppTheme.appbarPrimary,
                            child: Text(
                              "OK",
                              key: Key('changePasswordPromptOkButton'),
                              style: GoogleFonts.poppins(color: Colors.white),
                            ))
                      ],
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
}
