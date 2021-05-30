import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view_model/auth_view_model.dart';
import 'package:myhealthbd_app/features/my_health/repositories/dbmanager.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/switch_account.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/validator.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:provider/provider.dart';

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
    setState(() {});
  }

  List<SwitchAccounts> accountsList;
  String addAccountValue;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () async {
     
      accountsList = await dbmManager.getAccountList();
    });
    super.initState();
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
          child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          constraints: BoxConstraints(maxWidth: 400, maxHeight: 325),
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
                          //name,
                          //relation,
                          userName,
                          password,
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 22.0, right: 22, top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        borderRadius: BorderRadius.circular(8),
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
                  ]),
            ),
          ),
        ),
      )),
    );
  }

  Future<void> _submitStudent(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      accountsList.forEach((item) {
        if(item.username.contains(_username.text)) {
         addAccountValue = _username.text;
        }
      });
      if (addAccountValue!=null) {
        Fluttertoast.showToast(
            msg: "Already in the accounts list!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        addAccountValue=null;
      } else {
        var vm5 = Provider.of<AuthViewModel>(context, listen: false);
        await vm5.getAuthData(_username.text, _password.text);
        if (vm5.accessToken != null) {
          var vm3 = Provider.of<UserImageViewModel>(context, listen: false);
          var vm4 = Provider.of<UserDetailsViewModel>(context, listen: false);
          await vm4.getSwitchData(vm5.accessToken);
          await vm3.switchImage(vm5.accessToken);
          if (accounts == null) {
            SwitchAccounts switchAccounts = new SwitchAccounts(
              name: vm4.userSwitchDetailsList.fname,
              relation: vm3.switchDetails.photo,
              username: _username.text,
              password: _password.text,
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
                });
          }
        } else {
          Fluttertoast.showToast(
              msg: "Invalid username/password!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    }
  }
}
