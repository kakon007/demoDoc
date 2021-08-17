import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/auth/view_model/sign_out_view_model.dart';
import 'package:myhealthbd_app/main_app/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccessTokenProvider extends ChangeNotifier {
  String accessToken;

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('accessToken');
    print("AccessTokenFromMain:: $accessToken");
    this.accessToken = accessToken;
    notifyListeners();
    return accessToken;
  }

  Future<void> signOut() async {
    var vm = Provider.of<SignOutViewModel>(appNavigator.context, listen: false);
    vm.getSignOutData(accessToken);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("accessToken");
    await preferences.remove("password");
    await preferences.remove("username");
    accessToken = null;
    notifyListeners();
    Navigator.of(appNavigator.context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        ),
        (Route<dynamic> route) => false);
  }

  setToken(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("accessToken", accessToken);
    this.accessToken = accessToken;
    notifyListeners();
  }
}

class AuthViewWrapper extends StatefulWidget {
  final Widget child;

  const AuthViewWrapper({Key key, @required this.child}) : super(key: key);

  @override
  _AuthViewWrapperState createState() => _AuthViewWrapperState();
}

class _AuthViewWrapperState extends State<AuthViewWrapper> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AccessTokenProvider>(
        builder: (context, vm, _child) =>
            SizedBox(key: Key(vm.accessToken), child: widget.child));
  }
}
