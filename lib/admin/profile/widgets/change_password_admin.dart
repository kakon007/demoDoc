import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/features/profile/view/widgets/change_password_prompt.dart';
import 'package:myhealthbd_app/doctor/features/profile/view/widgets/upload_digital_signature.dart';
import 'package:myhealthbd_app/doctor/features/profile/view_model/personal_info_view_model.dart';
import 'package:myhealthbd_app/doctor/main_app/views/doctor_form_field.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/change_password_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/const.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/util/validator.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ChangePasswordAdmin extends StatefulWidget {
  const ChangePasswordAdmin({Key key}) : super(key: key);

  @override
  _ChangePasswordAdminState createState() => _ChangePasswordAdminState();
}

class _ChangePasswordAdminState extends State<ChangePasswordAdmin> {
  TextEditingController _currentPassword = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<PersonalInfoViewModel>(context, listen: false);
    var companyInfoVm = Provider.of<UserImageViewModel>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var spaceBetween = SizedBox(
      height: 10,
    );
    var changePassViewModel = Provider.of<PasswordChangeViewModel>(context);
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var currentPasswordHeading = Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
      child: Row(
        children: [
          Text(
            'Current Password',
            style: GoogleFonts.poppins(fontSize: isTablet ? 14 : 12),
          ),
        ],
      ),
    );
    var currentPassword =
    Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4),
      child: DoctorFormField(
      //  validator: Validator().validateEmail,
        controller: _currentPassword,
        hintText: 'Current Password',
        minimizeBottomPadding: true,

        validator: Validator().nullFieldValidate,
      ),
    );
    var newPasswordHeading = Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
      child: Row(
        children: [
          Text(
            'New Password',
            style: GoogleFonts.poppins(fontSize: isTablet ? 14 : 12),
          ),
        ],
      ),
    );
    var newPassword =
    Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4),
      child: DoctorFormField(
       // validator: Validator().validateEmail,
        controller: _newPassword,
        minimizeBottomPadding: true,
        validator: Validator().nullFieldValidate,
        hintText: 'Current Password',

      ),
    );
    var confirmPasswordHeading = Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 5, top: 5),
      child: Row(
        children: [
          Text(
            'Confirm Password',
            style: GoogleFonts.poppins(fontSize: isTablet ? 14 : 12),
          ),
        ],
      ),
    );
    var confirmPassword =
    Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4),
      child: DoctorFormField(
       // validator: Validator().validateEmail,
        controller: _confirmPassword,
        minimizeBottomPadding: true,
        hintText: 'Current Password',
        validator: (v) {
          return Validator().validateConfirmPassword(_newPassword.text, v);
        },
      ),
    );
    var changePassword = Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
              minWidth: MediaQuery.of(context).size.width * .2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: AppTheme.appbarPrimary,
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  FocusManager.instance.primaryFocus.unfocus();
                  await changePassViewModel.getPassword(
                      _newPassword.text,
                      _confirmPassword.text,
                      _currentPassword.text);
                  if (changePassViewModel.message ==
                      "Your current password not matche,Please enter current password !!") {
                    showAlert(
                        context, changePassViewModel.message);
                  }
                  if (changePassViewModel.message ==
                      "Change password saved successfully") {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString(
                        "password", _newPassword.text);
                    prefs.setString("passwordRemember",
                        _newPassword.text);
                    _newPassword.clear();
                _confirmPassword.clear();
                _currentPassword.clear();
                    // Navigator.pop(context);
                    showAlert(
                        context, changePassViewModel.message);
                  }
                }
              },
              child: Text(
                StringResources.changePassword,
                style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w600, fontSize: isTablet? 18 : 15),
              )),
        ],
      ),
    );
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(left: 0, right: 0, top: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: HexColor("#FFFFFF"),
                  boxShadow: [
                    BoxShadow(
                      color: HexColor("#0D1231").withOpacity(0.08),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(3, 1), // changes position of shadow
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spaceBetween,
                  spaceBetween,
                  spaceBetween,
                  currentPasswordHeading,
                  //spaceBetween,
                  currentPassword,
                  spaceBetween,
                  spaceBetween,
                  newPasswordHeading,
                  newPassword,
                  spaceBetween,
                  spaceBetween,
                  confirmPasswordHeading,
                  confirmPassword,
                  spaceBetween,
                  spaceBetween,
                  changePassword


                ],
              ),
            ),
            spaceBetween,
            // editButton
          ],
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
            //type: MaterialType.transparency,
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
                  borderRadius: BorderRadius.all(Radius.circular(0)),
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
