import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/auth/repositories/auth_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class ResetPasswordViewModel extends ChangeNotifier {
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  bool _isLoading = false;
  AppError _appError;
  String _resetInfo;


  Future<void> getResetInfo(String userName, String email) async {
    _isLoading = true;
    var res = await AuthRepository().fetchResetInfo(userName, email);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _resetInfo= r.message;
      _isLoading = false;
      notifyListeners();
    });
  }

  AppError get appError => _appError;

  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;

  bool get isLoading => _isLoading;

  String get resetInfo =>  _resetInfo;
}
