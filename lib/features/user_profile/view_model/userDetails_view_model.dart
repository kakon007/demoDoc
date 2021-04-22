
import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/user_profile/models/userDetails_model.dart';
import 'package:myhealthbd_app/features/user_profile/repositories/userdetails_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/util/common_serviec_rule.dart';

class UserDetailsViewModel extends ChangeNotifier{
  Obj _userDetailsList;

  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  int _page = 1;

  // Future<void> refresh(){
  //  // _newsList.clear();
  //   return getData();
  // }

  Future<void> getData(String accessToken) async {

    // if (isFromOnPageLoad) {
    //   if (_lastFetchTime != null) if (_lastFetchTime
    //       .difference(DateTime.now()) <
    //       CommonServiceRule.onLoadPageReloadTime) return;
    // }
    _isFetchingData = true;
    _lastFetchTime = DateTime.now();
    var res = await UserDetailsRepository().fetchUserDetails(accessToken);
    notifyListeners();
    //_newsList.clear();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _userDetailsList=r.dataList;
      notifyListeners();
    });
    //print("hhhhhh:::::::"+_newsList.first.title);
  }

  AppError get appError => _appError;


  bool get shouldShowAppError => _appError != null && _userDetailsList== null;
  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;

  // bool get hasMoreData => _hasMoreData;
  //
  // bool get shouldFetchMoreData =>
  //     _hasMoreData && !_isFetchingData && !_isFetchingMoreData;

  bool get shouldShowNoNewsFound => _userDetailsList== null && !isFetchingData;

  bool get shouldShowPageLoader =>
      _isFetchingData && _userDetailsList == null;


  Obj get userDetailsList => _userDetailsList;
}