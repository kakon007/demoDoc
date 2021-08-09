import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myhealthbd_app/features/auth/repositories/auth_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class AuthViewModel extends ChangeNotifier {
  String _accessToken;
  AppError _appError;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  bool _isLoading = false;

  Future<void> getAuthData(String user, String pass,
      {bool switchAccount = false}) async {
    _accessToken = null;
    _isLoading = true;
    var res = await AuthRepository().fetchAuthData(user, pass);
    notifyListeners();
    res.fold((l) {
      _accessToken = null;
      if (switchAccount == true) {
        Fluttertoast.showToast(
            msg: "Invalid username/password!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      _appError = l;
      _isFetchingMoreData = false;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _accessToken = r.accessToken;
      _isLoading = false;
      notifyListeners();
    });
  }

  AppError get appError => _appError;

  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;

  bool get isLoading => _isLoading;

  String get accessToken => _accessToken;
}
