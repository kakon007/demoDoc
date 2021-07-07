

import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/notification/repositories/notification_repository.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:provider/provider.dart';
import 'package:myhealthbd_app/features/notification/models/notification_model.dart';

class NotificationViewModel extends ChangeNotifier{
  List<Item> _notificationList =[];

  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  int _page = 1;
  bool _isLoading;

  Future<void> refresh(){
    _page = 0;
    _notificationList.clear();
    return getData();
  }

  Future<void> getData({String deviceToken}) async {

    print('notificationCall');

    _isFetchingData = true;

    _isLoading = true;
    var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
    var vm = Provider.of<UserDetailsViewModel>(appNavigator.context,listen: false);
    var res = await NotificationRepository().fetchNotificationList(accessToken: accessToken,userName:vm.userDetailsList.hospitalNumber ,deviceToken: deviceToken);
    print('NotificationToken $deviceToken');
    notifyListeners();
    _notificationList.clear();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      print('worng');
      notifyListeners();
    }, (r) {
      _isLoading= false;
      _isFetchingMoreData = false;
      _notificationList.addAll(r.dataListofNotification);
      print('right');
      //_hospitalList.removeAt(0);
      notifyListeners();
    });
  }

  AppError get appError => _appError;



  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;

  // bool get hasMoreData => _hasMoreData;
  //
  // bool get shouldFetchMoreData =>
  //     _hasMoreData && !_isFetchingData && !_isFetchingMoreData;

  bool get shouldShowPageLoader =>
      _isFetchingData && _notificationList.length == 0;
  bool get isLoading=> _isLoading;

  List<Item> get notificationList => _notificationList;

}