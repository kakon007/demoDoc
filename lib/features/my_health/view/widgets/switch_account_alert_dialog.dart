import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/my_health/repositories/dbmanager.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/switch_account.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/validator.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

class SwitchAccountAlert extends StatefulWidget {
  @override
  _SwitchAccountAlertState createState() => _SwitchAccountAlertState();
}

class _SwitchAccountAlertState extends State<SwitchAccountAlert> {
  final DbManager dbmManager = new DbManager();
  final _nameController = TextEditingController();
  final _relationController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  SwitchAccounts accounts;
  final _username = TextEditingController();
  final _password = TextEditingController();
  refresh() {
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.44;
    var name = SignUpFormField(
      validator: Validator().nullFieldValidate,
      labelText: "Name",
      isRequired: true,
      topPadding: 16,
      controller: _nameController,
      //margin: EdgeInsets.all(8),
      contentPadding: EdgeInsets.all(15),
      hintText: StringResources.name,
    );
    var relation = SignUpFormField(
      labelText: "Relation",
      isRequired: true,
      controller: _relationController,
      //margin: EdgeInsets.all(8),
      contentPadding: EdgeInsets.all(15),
      hintText: "Relation",
    );

    var userName = SignUpFormField(
      topPadding: 16,
      validator: Validator().nullFieldValidate,
      labelText: "Username",
      isRequired: true,
      controller: _username,
      //margin: EdgeInsets.all(8),
      contentPadding: EdgeInsets.all(15),
      hintText: StringResources.usernameHint,
    );
    var password = SignUpFormField(
      topPadding: 16,
      validator: Validator().nullFieldValidate,
      labelText: "Password",
      isRequired: true,
      obSecure: true,
      controller: _password,
      margin: EdgeInsets.all(8),
      contentPadding: EdgeInsets.all(15),
      hintText: StringResources.passwordHint,
    );
    return Form(
      key: _formKey,
      child: Center(
          child: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            constraints: BoxConstraints(maxWidth: 400, maxHeight:505),
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
                        padding: const EdgeInsets.only(
                            left: 38.0, right: 25, bottom: 15),
                        child: Row(
                          children: <Widget>[
                            Container(
                              // padding: new EdgeInsets.all(10.0),
                              decoration: new BoxDecoration(),
                              child: new Text(
                                'Switch Account',
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
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            name,
                            relation,
                            userName,
                            password,
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 22.0, right: 22, top: 0),
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
                                  SizedBox(
                                    width: width * .8,
                                    height: width * .25,
                                    child: FlatButton(
                                      textColor: Colors.white,
                                      onPressed: () {
                                        _submitStudent(context);
                                      },
                                      color: AppTheme.appbarPrimary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
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
                    ]),
              ),
            ),
          ),
        ),
      )),
    );
  }

  void _submitStudent(BuildContext context) {
    if (_formKey.currentState.validate()) {
      if (accounts == null) {
        SwitchAccounts switchAccounts = new SwitchAccounts(
          name: _nameController.text,
          relation: _relationController.text,
          username: _username.text,
          password: _password.text,
          //relation: _password.text,
        );
        dbmManager.insertStudent(switchAccounts).then((id) => {
              _nameController.clear(),
              _username.clear(),
              _password.clear(),
              Fluttertoast.showToast(
                  msg: "Data inserted",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0),
          Navigator.pop(context),
              //
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) {
              //     return SwitchAccount();
              //   }),
              // )
            });
      } else {
        Fluttertoast.showToast(
            msg: "Invalid input!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }
}
