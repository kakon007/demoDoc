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

class ChangePasswordAlert extends StatefulWidget {
  String accessToken;
  String id;

  ChangePasswordAlert(this.accessToken, this.id);

  @override
  _ChangePasswordAlertState createState() => _ChangePasswordAlertState();
}

class _ChangePasswordAlertState extends State<ChangePasswordAlert> {
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
    PasswordChangeViewModel(userId: widget.id);
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
      labelText: "Current Password",
      labelFontSize: isTablet ? 15 : 12,
      hintSize: isTablet ? 17 : 15,
      hintText: "Current password",
      minimizeBottomPadding: true,
      suffixIcon: IconButton(
        icon: isCurrentObSecure == true
            ? Icon(Icons.visibility_off, color: AppTheme.appbarPrimary)
            : Icon(
                Icons.visibility,
                color: AppTheme.appbarPrimary,
              ),
        onPressed: () {
          setState(() {
            isCurrentObSecure == true
                ? isCurrentObSecure = false
                : isCurrentObSecure = true;
          });
        },
      ),
      obSecure: isCurrentObSecure,
    );
    var newPassword = SignUpFormField(
      textFieldKey: Key('newPasswordKey'),
      topPadding: isTablet ? 25 : 18,
      controller: _newPassword,
      labelFontSize: isTablet ? 15 : 12,
      hintSize: isTablet ? 17 : 15,
      validator: Validator().nullFieldValidate,
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      minimizeBottomPadding: true,
      labelText: "New Password",
      hintText: "New password",
      suffixIcon: IconButton(
        icon: isNewObSecure == true
            ? Icon(Icons.visibility_off, color: AppTheme.appbarPrimary)
            : Icon(
                Icons.visibility,
                color: AppTheme.appbarPrimary,
              ),
        onPressed: () {
          setState(() {
            isNewObSecure == true
                ? isNewObSecure = false
                : isNewObSecure = true;
          });
        },
      ),
      obSecure: isNewObSecure,
    );
    var spaceBetween = SizedBox(height: 10);
    var confirmPassword = SignUpFormField(
      textFieldKey: Key('confirmPasswordKey'),
      topPadding: isTablet ? 25 : 18,
      minimizeBottomPadding: true,
      controller: _confirmPassword,
      validator: (v) {
        return Validator().validateConfirmPassword(_newPassword.text, v);
      },
      labelFontSize: isTablet ? 15 : 12,
      hintSize: isTablet ? 18 : 15,
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Confirm Password",
      hintText: "Confirm password",
      suffixIcon: IconButton(
        icon: isConfirmObSecure == true
            ? Icon(Icons.visibility_off, color: AppTheme.appbarPrimary)
            : Icon(
                Icons.visibility,
                color: AppTheme.appbarPrimary,
              ),
        onPressed: () {
          setState(() {
            isConfirmObSecure == true
                ? isConfirmObSecure = false
                : isConfirmObSecure = true;
          });
        },
      ),
      obSecure: isConfirmObSecure,
    );
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(
              horizontal:
                  isTablet ? deviceWidth * .1 : deviceWidth* .001),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            height: !isExpanded
                ? isTablet
                    ? 360
                    //:355
                    : deviceWidth<=330? 330 :340
                : isTablet
                    ? 400
            //:395,
            : deviceWidth<=330? 370 : 380,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Container(
                  //       alignment: Alignment.centerLeft,
                  //       height: 40,
                  //       width: deviceWidth*.8,
                  //       // padding: new EdgeInsets.all(10.0),
                  //       decoration: new BoxDecoration(color:AppTheme.appbarPrimary, borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                  //           topRight: Radius.circular(20))),
                  //       child:  Padding(
                  //         padding: const EdgeInsets.only(left: 25),
                  //         child: Text(
                  //           'Change Password',
                  //           key: Key('changePasswordPromptKey'),
                  //           style: GoogleFonts.poppins(
                  //               color: Colors.white,
                  //               fontSize: isTablet ? 18 : 15.0,
                  //               fontWeight: FontWeight.w500),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      'Change Password',
                      key: Key('changePasswordPromptKey'),
                      style: GoogleFonts.poppins(
                          color: AppTheme.appbarPrimary,
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
                            key: Key('changePasswordCancelButtonKey'),
                            textColor: AppTheme.appbarPrimary,
                            color: HexColor("#FFFFFF"),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(8),
                                side: BorderSide(
                                    color: AppTheme.appbarPrimary,
                                    width: 1)),
                            child: Text(
                              StringResources.cancelText,
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        SizedBox(
                          width: isTablet? 200 : width<=360? width*.7 : width * .8,
                          height: isTablet ? 50 : width * .25,
                          child: FlatButton(
                            textColor: Colors.white,
                            key: Key('changePasswordSaveButtonKey'),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                await changePassViewModel.getPassword(
                                    widget.accessToken,
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
                              else{
                                setState(() {
                                  isExpanded= true;
                                });
                              }
                            },
                            color: AppTheme.appbarPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "Save",
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                        )

                        // submitButton
                      ],
                    )
                  ],),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
    // return Form(
    //   key: _formKey,
    //   child: Center(
    //       child: SingleChildScrollView(
    //     child: Center(
    //       child: Container(
    //         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    //         constraints: BoxConstraints(maxWidth: isTablet ? 500 : 400, maxHeight: !isExpanded ? isTablet? 420 : 390 : isTablet ? 460 : 440),
    //         child: Material(
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(20),
    //           ),
    //           child: Padding(
    //             padding: const EdgeInsets.only(top: 20.0),
    //             child: Column(
    //                  crossAxisAlignment: CrossAxisAlignment.start,
    //                 // mainAxisSize: MainAxisSize.min,
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.only(
    //                         left: 25.0, right: 25, bottom: 15),
    //                     child: Row(
    //                       children: <Widget>[
    //                         Container(
    //                           // padding: new EdgeInsets.all(10.0),
    //                           decoration: new BoxDecoration(),
    //                           child: new Text(
    //                             'Change Password',
    //                             key: Key('changePasswordPromptKey'),
    //                             style: GoogleFonts.poppins(
    //                                 color: AppTheme.appbarPrimary,
    //                                 fontSize: isTablet? 18 : 15.0,
    //                                 fontWeight: FontWeight.w500),
    //                             textAlign: TextAlign.center,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.only(left: 10.0, right: 10),
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       children: [
    //                         Padding(
    //                           padding: const EdgeInsets.only(left:12.0, right: 12),
    //                           child: Column(crossAxisAlignment: CrossAxisAlignment.center,
    //                           children: [
    //                             currentPassword,
    //                             newPassword,
    //                             confirmPassword,
    //                           ],
    //                           ),
    //                         ),
    //                         Padding(
    //                           padding: const EdgeInsets.only(
    //                               left: 12.0, right: 12, top: 5),
    //                           child: Row(
    //                             mainAxisAlignment:
    //                                 MainAxisAlignment.spaceBetween,
    //                             children: [
    //                               SizedBox(
    //                                 width: isTablet? 200 : width * .8,
    //                                 height: isTablet ? 50 : width * .25,
    //                                 child: FlatButton(
    //                                   onPressed: () {
    //                                     Navigator.pop(context);
    //                                   },
    //                                   key: Key('changePasswordCancelButtonKey'),
    //                                   textColor: AppTheme.appbarPrimary,
    //                                   color: HexColor("#FFFFFF"),
    //                                   shape: RoundedRectangleBorder(
    //                                       borderRadius:
    //                                           BorderRadius.circular(8),
    //                                       side: BorderSide(
    //                                           color: AppTheme.appbarPrimary,
    //                                           width: 1)),
    //                                   child: Text(
    //                                     StringResources.cancelText,
    //                                     style: GoogleFonts.poppins(),
    //                                   ),
    //                                 ),
    //                               ),
    //                               SizedBox(width: 5,),
    //                               SizedBox(
    //                                 width: isTablet? 200 : width * .8,
    //                                 height: isTablet ? 50 : width * .25,
    //                                 child: FlatButton(
    //                                   textColor: Colors.white,
    //                                   key: Key('changePasswordSaveButtonKey'),
    //                                   onPressed: () async {
    //                                     if (_formKey.currentState.validate()) {
    //                                       await changePassViewModel.getPassword(
    //                                           widget.accessToken,
    //                                           _newPassword.text,
    //                                           _confirmPassword.text,
    //                                           _currentPassword.text);
    //                                       if (changePassViewModel.message ==
    //                                           "Your current password not matche,Please enter current password !!") {
    //                                         showAlert(context,
    //                                             changePassViewModel.message);
    //                                       }
    //                                       if (changePassViewModel.message ==
    //                                           "Change password saved successfully") {
    //                                         SharedPreferences prefs =
    //                                         await SharedPreferences
    //                                             .getInstance();
    //                                         prefs.setString(
    //                                             "password", _newPassword.text);
    //                                         prefs.setString(
    //                                             "passwordRemember", _newPassword.text);
    //                                         Navigator.pop(context);
    //                                         showAlert(context,
    //                                             changePassViewModel.message);
    //                                       }
    //                                     }
    //                                     else{
    //                                       setState(() {
    //                                         isExpanded= true;
    //                                       });
    //                                     }
    //                                   },
    //                                   color: AppTheme.appbarPrimary,
    //                                   shape: RoundedRectangleBorder(
    //                                     borderRadius: BorderRadius.circular(8),
    //                                   ),
    //                                   child: Text(
    //                                     "Save",
    //                                     style: GoogleFonts.poppins(),
    //                                   ),
    //                                 ),
    //                               )
    //
    //                               // submitButton
    //                             ],
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ]),
    //           ),
    //         ),
    //       ),
    //     ),
    //   )),
    // );
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
