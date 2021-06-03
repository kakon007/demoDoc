
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/change_password_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
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
  bool isExpanded= false;
  bool isCurrentObSecure;
  bool isNewObSecure;
  bool isConfirmObSecure;
  @override
  void initState() {
    // TODO: implement initState
     isCurrentObSecure= true;
     isNewObSecure=true;
     isConfirmObSecure=true;
    super.initState();
    PasswordChangeViewModel(userId: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var changePassViewModel = Provider.of<PasswordChangeViewModel>(context);

    var width = MediaQuery.of(context).size.width * 0.44;
    var currentPassword = SignUpFormField(
      topPadding: 18,
      controller: _currentPassword,
      validator: Validator().nullFieldValidate,
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Current Password",
      hintText: "Current password",
      suffixIcon: IconButton(
        icon: isCurrentObSecure == true
            ? Icon(
            Icons.visibility_off,
            color: AppTheme.appbarPrimary
        )
            : Icon(
          Icons.visibility,
          color: AppTheme.appbarPrimary,
        ),
        onPressed: () {
          setState(() {
            isCurrentObSecure == true ? isCurrentObSecure = false : isCurrentObSecure = true;
          });
        },
      ),
      obSecure: isCurrentObSecure,
    );
    var newPassword = SignUpFormField(
      topPadding: 18,
      controller: _newPassword,
      validator: Validator().nullFieldValidate,
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "New Password",
      hintText: "New password",
      suffixIcon: IconButton(
        icon: isNewObSecure == true
            ? Icon(
            Icons.visibility_off,
            color: AppTheme.appbarPrimary
        )
            : Icon(
          Icons.visibility,
          color: AppTheme.appbarPrimary,
        ),
        onPressed: () {
          setState(() {
            isNewObSecure == true ? isNewObSecure = false : isNewObSecure = true;
          });
        },
      ),
      obSecure: isNewObSecure,
    );
    var confirmPassword = SignUpFormField(
      topPadding: 18,
      controller: _confirmPassword,
      validator: (v) {
        return Validator().validateConfirmPassword(
            _newPassword.text, v);
      },
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Confirm Password",
      hintText: "Confirm password",
      suffixIcon: IconButton(
        icon: isConfirmObSecure == true
            ? Icon(
            Icons.visibility_off,
            color: AppTheme.appbarPrimary
        )
            : Icon(
          Icons.visibility,
          color: AppTheme.appbarPrimary,
        ),
        onPressed: () {
          setState(() {
            isConfirmObSecure == true ? isConfirmObSecure = false : isConfirmObSecure = true;
          });
        },
      ),
      obSecure: isConfirmObSecure,
    );

    return Form(
      key: _formKey,
      child: Center(
          child: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            constraints: BoxConstraints(maxWidth: 400, maxHeight: !isExpanded ? 380 : 420),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25, bottom: 15),
                        child: Row(
                          children: <Widget>[
                            Container(
                              // padding: new EdgeInsets.all(10.0),
                              decoration: new BoxDecoration(),
                              child: new Text(
                                'Change Password',
                                style: GoogleFonts.poppins(
                                    color: AppTheme.appbarPrimary,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:12.0, right: 10),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                currentPassword,
                                newPassword,
                                confirmPassword,
                              ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15, top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * .8,
                                    height: width * .25,
                                    child: FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
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
                                  SizedBox(width: 5,),
                                  SizedBox(
                                    width: width * .8,
                                    height: width * .25,
                                    child: FlatButton(
                                      textColor: Colors.white,
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      )),
    );
  }

  void showAlert(BuildContext context, String message) {
    var changePassViewModel =
        Provider.of<PasswordChangeViewModel>(context, listen: false);
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Material(
          type: MaterialType.transparency,
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 2.8,
                bottom: MediaQuery.of(context).size.height / 2.8,
                right: 20,
                left: 20),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 120,
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
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 260,
                                  child: Text(changePassViewModel.message,textAlign: TextAlign.center,)),
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
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ))
                          ],
                        )
                      ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
