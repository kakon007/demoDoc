import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
class SwitchAccountAlert extends StatefulWidget {
  @override
  _SwitchAccountAlertState createState() => _SwitchAccountAlertState();
}

class _SwitchAccountAlertState extends State<SwitchAccountAlert> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.44;
    var userName = SignUpFormField(
      labelText: "Username",
      isRequired: true,
      controller: _username,
      //margin: EdgeInsets.all(8),
      contentPadding: EdgeInsets.all(15),
      hintText: StringResources.usernameHint,
    );
    var password = SignUpFormField(
    labelText: "Password",
      isRequired: true,
      obSecure: true,
      controller: _password,
      margin: EdgeInsets.all(8),
      contentPadding: EdgeInsets.all(15),
      hintText: StringResources.passwordHint,
    );
    return Center(
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            constraints: BoxConstraints(maxWidth: 400, maxHeight: width*2.1),
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
                     padding: const EdgeInsets.only(left: 38.0,right: 25, bottom: 15),
                     child: Row(
                      children: <Widget>[
                         Container(
                          // padding: new EdgeInsets.all(10.0),
                          decoration: new BoxDecoration(
                          ),
                          child: new Text(
                            'Switch Account',
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
                          userName,
                          password,
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
                                    onPressed: () {},
                                    color:  AppTheme.appbarPrimary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      "Confirm",
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )

                  // // dialog centre
                  // new Expanded(
                  //   child: new Container(
                  //       child: new TextField(
                  //         decoration: new InputDecoration(
                  //           border: InputBorder.none,
                  //           filled: false,
                  //           contentPadding: new EdgeInsets.only(
                  //               left: 10.0,
                  //               top: 10.0,
                  //               bottom: 10.0,
                  //               right: 10.0),
                  //           hintText: ' add review',
                  //           hintStyle: new TextStyle(
                  //             color: Colors.grey.shade500,
                  //             fontSize: 12.0,
                  //             fontFamily: 'helvetica_neue_light',
                  //           ),
                  //         ),
                  //       )),
                  //   flex: 2,
                  // ),
                  //
                  // // dialog bottom
                  // new Expanded(
                  //   child: new Container(
                  //     padding: new EdgeInsets.all(16.0),
                  //     decoration: new BoxDecoration(
                  //       color: const Color(0xFF33b17c),
                  //     ),
                  //     child: new Text(
                  //       'Rate product',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 18.0,
                  //         fontFamily: 'helvetica_neue_light',
                  //       ),
                  //       textAlign: TextAlign.center,
                  //     ),
                  //   ),
                  // ),

             ] ),
              ),
            ),
          ),
        ),
      ));
  }
}
