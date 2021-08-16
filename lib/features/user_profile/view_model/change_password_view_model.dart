import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/user_profile/repositories/change_password_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class PasswordChangeViewModel with ChangeNotifier {
  String userId;
  AppError _appError;
  String _message;

  PasswordChangeViewModel({this.userId});

  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  bool _isLoading = false;

  Future<void> getPassword(String newPassword, String confirmPassword,
      String currentPassword) async {
    var res = await ChangePasswordRepository()
        .fetchPassword(newPassword, confirmPassword, currentPassword);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _message = r.message;
      _isLoading = false;
      notifyListeners();
    });
  }

  String get message => _message;
}
