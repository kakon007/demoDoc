import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/change_password_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
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

  ChangePasswordAlert(this.accessToken,this.id);
  @override
  _ChangePasswordAlertState createState() => _ChangePasswordAlertState();
}

class _ChangePasswordAlertState extends State<ChangePasswordAlert> {
  final _currentPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _formKey = new GlobalKey<FormState>();

//   bool validate() {
//     return _oldPassword != null &&
//         _password != null && _confirmPassword!=null;
// //        &&
// //        _confirmPasswordTextController != null;
//   }

  _handleChangePassword(context) async{
    var changePassViewModel =
    Provider.of<PasswordChangeViewModel>(context, listen: false);
    var isSuccess = await changePassViewModel.changePassword();
    if(isSuccess){
      Navigator.pop(context);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PasswordChangeViewModel(accessToken: widget.accessToken,userId: widget.id);
  }
  @override
  Widget build(BuildContext context) {
    var changePassViewModel = Provider.of<PasswordChangeViewModel>(context);

    var width = MediaQuery.of(context).size.width * 0.44;
    var currentPassword =
   Consumer<PasswordChangeViewModel>(
       builder: (context, passwordChangeViewModel, _) {
      bool isObscure = passwordChangeViewModel.isObscurePasswordOld;
      return ChangePasswordFormField(
        labelText: "Current Password",
        isRequired: true,
        onChanged: passwordChangeViewModel.onChangeOldPassword,
        errorText: passwordChangeViewModel.errorTextOldPassword,
        controller: _currentPassword,
        margin: EdgeInsets.only(top: 8,bottom: 8,right: 3,left: 3),
        contentPadding: EdgeInsets.all(15),
        obscureText: passwordChangeViewModel.isObscurePasswordOld,
        hintText:'Password',
      );
       },

   );
    var newPassword =
        Consumer<PasswordChangeViewModel>(
            builder: (context, passwordChangeViewModel, _) {
      bool isObscure = passwordChangeViewModel.isObscurePasswordNew;
            return   ChangePasswordFormField(
              labelText: "New Password",
              isRequired: true,
              onChanged: passwordChangeViewModel.onChangeNewPassword,
              errorText: passwordChangeViewModel.errorTextNewPassword,
              controller: _newPassword,
              margin: EdgeInsets.only(top: 8,bottom: 8,right: 3,left: 3),
              contentPadding: EdgeInsets.all(15),
              obscureText: passwordChangeViewModel.isObscurePasswordNew,
              hintText: 'Confirm Password',
            );
            });

    var confirmPassword =
    // Consumer<PasswordChangeViewModel>(
    //  builder: (context, passwordChangeViewModel, _) {
    //    bool isObscure = passwordChangeViewModel.isObscurePasswordConfirm;
      ChangePasswordFormField(
       labelText: "Confirm Password",
       isRequired: true,
       obSecure: true,
       //onChanged: passwordChangeViewModel.onConfirmPassword,
       //errorText: passwordChangeViewModel.errorTextConfirmPassword,
       controller: _confirmPassword,
       margin: EdgeInsets.only(top: 8,bottom: 8,right: 3,left: 3),
       contentPadding: EdgeInsets.all(15),
      // obscureText: passwordChangeViewModel.isObscurePasswordConfirm,
       hintText: 'Confirm Password',
     );


    // var submitButton = changePassViewModel.isBusy? Loader():
    // SizedBox(
    //   width: width * .8,
    //   height: width * .25,
    //   child: FlatButton(
    //     textColor: Colors.white,
    //     onPressed: () {},
    //     color:  AppTheme.appbarPrimary,
    //     shape: RoundedRectangleBorder(
    //       borderRadius:
    //       BorderRadius.circular(8),
    //     ),
    //     child: Text(
    //       "Save",
    //       style: GoogleFonts.poppins(),
    //     ),
    //   ),
    // );

    var submitButton = changePassViewModel.isBusy? Loader(): Container(
      width: width * .8,
      height: width * .25,
      child: CommonButton(
        onTap: changePassViewModel.allowSubmitButton
            ? () {
          _handleChangePassword(context);
        }
            : null,
        key: Key('changePasswordSubmitButton'),
        label: StringResources.submitButtonText,
      ),
    );


    return Form(
      child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                constraints: BoxConstraints(maxWidth: 400, maxHeight: width*2.5),
                child: Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0,right: 25, bottom: 15),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  // padding: new EdgeInsets.all(10.0),
                                  decoration: new BoxDecoration(
                                  ),
                                  child: new Text(
                                    'Change Password',
                                    style: GoogleFonts.poppins(
                                        color: AppTheme.appbarPrimary,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                currentPassword,
                                newPassword,
                                confirmPassword,
                                Padding(
                                  padding: const EdgeInsets.only(left: 22.0, right: 22, top: 22),
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
                                          textColor:  AppTheme.appbarPrimary,
                                          color: HexColor("#FFFFFF"),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(8),
                                              side: BorderSide(
                                                  color: AppTheme
                                                      .appbarPrimary,
                                                  width: 1)),
                                          child: Text(
                                            StringResources.cancelText,
                                            style: GoogleFonts.poppins(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * .8,
                                        height: width * .25,
                                        child: FlatButton(
                                          textColor: Colors.white,
                                          onPressed: () async {
                                            await changePassViewModel.getPassword(widget.accessToken, _newPassword.text, _confirmPassword.text, _currentPassword.text);
                                            if(changePassViewModel.message=="Your current password not matche,Please enter current password !!"){
                                              showAlert(context, changePassViewModel.message);
                                            }
                                            if(changePassViewModel.message=="Change password saved successfully"){
                                              SharedPreferences prefs =
                                              await SharedPreferences.getInstance();
                                              prefs.setString(
                                                  "password", _newPassword.text);
                                              Navigator.pop(context);
                                              showAlert(context, changePassViewModel.message);
                                            }

                                            },
                                          color:  AppTheme.appbarPrimary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(8),
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
                        ] ),
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
                top: MediaQuery.of(context).size.height / 2.5,
                bottom: MediaQuery.of(context).size.height / 2.5,
                right: 20,
                left: 20),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 100,
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
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(changePassViewModel.message),
                      SizedBox(height: 10,),
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
                   ]
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}