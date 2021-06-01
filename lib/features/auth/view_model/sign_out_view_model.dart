import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/auth/repositories/auth_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class SignOutViewModel extends ChangeNotifier {
  String _message;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  bool _isLoading = false;
  AppError _appError;

  Future<void> getSignOutData(String accessToken) async {
    _isLoading = true;
    var res = await AuthRepository().fetchSignOutInfo(accessToken);
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

  AppError get appError => _appError;

  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;

  bool get isLoading => _isLoading;

  String get message => _message;
}
