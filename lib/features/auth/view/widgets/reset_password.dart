import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view_model/reset_password_view_model.dart';
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

class ResetPasswordAlert extends StatefulWidget {
  String userName;
  ResetPasswordAlert({this.userName});
  @override
  _ResetPasswordAlertState createState() => _ResetPasswordAlertState();
}

class _ResetPasswordAlertState extends State<ResetPasswordAlert> {
  final _currentPassword = TextEditingController();
  final _userName = TextEditingController();
  final _email = TextEditingController();
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
    var vm = Provider.of<ResetPasswordViewModel>(context, listen: true);
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var width = MediaQuery.of(context).size.width * 0.44;
    var username = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            child: Text(
              "Username",
              style: TextStyle(
                fontSize: isTablet ? 15 : 12,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(color: HexColor("#EAEBED")),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(widget.userName,style: GoogleFonts.poppins(),),
          ),
          // topPadding: isTablet? 25 : 18,
          // controller: _userName,
          // labelFontSize: isTablet? 15 : 12,
          // hintSize: isTablet? 17 : 15,
          // validator: Validator().nullFieldValidate,
          // margin: EdgeInsets.only(bottom: 2),
          // isRequired: true,
          // labelText: "Username",
          // hintText: "Username",
        )
      ],
    );
    var email = SignUpFormField(
      topPadding: isTablet ? 25 : 18,
      controller: _email,
      labelFontSize: isTablet ? 15 : 12,
      hintSize: isTablet ? 18 : 15,
      margin: EdgeInsets.only(bottom: 2),
      validator: Validator().validateEmail,
      isRequired: true,
      labelText: "Email",
      hintText: "Email",
    );

    return Form(
      key: _formKey,
      child: Center(
          child: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            constraints: BoxConstraints(
                maxWidth: isTablet ? 500 : 400,
                maxHeight: !isExpanded
                    ? isTablet
                        ? 400
                        : 300
                    : isTablet
                        ? 380
                        : 350),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                                'Reset Password',
                                style: GoogleFonts.poppins(
                                    color: AppTheme.appbarPrimary,
                                    fontSize: isTablet ? 18 : 15.0,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, right: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  username,
                                  email,
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12, top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: isTablet ? 200 : width * .8,
                                    height: isTablet ? 50 : width * .25,
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
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: isTablet ? 200 : width * .8,
                                    height: isTablet ? 50 : width * .25,
                                    child: FlatButton(
                                      textColor: Colors.white,
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          //BotToast.showLoading();
                                          await vm.getResetInfo(
                                              widget.userName, _email.text);
                                          isExpanded = false;
                                         // BotToast.closeAllLoading();
                                          if (vm.resetInfo.emailSubject ==
                                              "Forgot password recovery!!") {
                                            Navigator.pop(context);
                                            _successAlert(context,
                                                vm.resetInfo.emailBody);
                                            print("abc");
                                          }
                                        } else {
                                          setState(() {
                                            isExpanded = true;
                                          });
                                        }
                                      },
                                      color: AppTheme.appbarPrimary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        "Reset",
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

  void _successAlert(BuildContext context, String message) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                constraints: BoxConstraints(
                    maxWidth: isTablet ? 500 : 400,
                    maxHeight: !isExpanded
                        ? isTablet
                            ? 400
                            : 360
                        : isTablet
                            ? 460
                            : 430),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
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
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 15, right: 15),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: Html(
                              data: message,
                              style: {
                                "body": Style(
                                  fontSize: FontSize(isTablet ? 16.0 : 14),
                                ),
                              },
                            ),
                          ),
                          FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  height: isTablet ? 45 : 35,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: AppTheme.appbarPrimary,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    "OK",
                                    style: GoogleFonts.poppins(
                                        fontSize: isTablet ? 18 : 16,
                                        color: Colors.white),
                                  ))))
                        ]),
                  ),
                ),
              ),
            ),
          ));
        });
  }
}
