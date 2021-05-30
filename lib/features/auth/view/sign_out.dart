import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/auth/view_model/sign_out_view_model.dart';
import 'package:myhealthbd_app/main_app/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignOut extends StatefulWidget {
  String accessToken;
  SignOut({this.accessToken});
  @override
  _SignOutState createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {

  Future<void> signOut() async {
    var vm = Provider.of<SignOutViewModel>(context, listen: false);
    await vm.getSignOutData(widget.accessToken);
    if( vm.message=="User Revoke Successfull"){
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.remove("accessToken");
      await preferences.remove("password");
    }
  }
  @override
  void initState() {
    signOut();
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 1),
            () =>  Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => HomeScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
