
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/dashboard/repositories/nearest_appointment_card_repository.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:provider/provider.dart';
import 'package:myhealthbd_app/features/dashboard/model/nearest_appointment_card_model.dart';

class NearestAppointmentViewModel extends ChangeNotifier{
  Obj _nearestAppointmentDetails;
  Obj _patDetails;
  Obj _userSwitchDetailsList;
  String _message;
  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  int _page = 1;

  // Future<void> getData() async {
  //   print('Enter:::::::::::');
  //   _isFetchingData = true;
  //   _lastFetchTime = DateTime.now();
  //   var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
  //   var vm = Provider.of<UserDetailsViewModel>(appNavigator.context,listen: false);
  //   var res = await NearestAppointmentRepository().fetchNearestAppointmentDetails(accessToken:accessToken,regID: vm.userDetailsList.hospitalNumber);
  //   print('Enterrrr:::::::::::');
  //   notifyListeners();
  //   res.fold((l) {
  //     _appError = l;
  //     _isFetchingData = false;
  //     print('NotNearest::::');
  //     notifyListeners();
  //     return false;
  //   }, (r) {
  //     _isFetchingData = false;
  //     _nearestAppointmentDetails=r.dataList;
  //     print('Nearest::::');
  //     notifyListeners();
  //     return true;
  //   });
  // }

  Future<bool> getData(String regID) async {
    print("CalledfromNearestList");
    // print("HasMoreFromGetData ${hasMoreData}");
    // startIndex=0;
    // _pageCount++;
    _isFetchingData = true;
    _lastFetchTime = DateTime.now();
    var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
    //var vm = Provider.of<UserDetailsViewModel>(appNavigator.context,listen: false);
    print("CalledfromNearestListdddd");
    var res = await NearestAppointmentRepository().fetchNearestAppointmentDetails(accessToken:accessToken,regID:regID);
    print("CalledfromNearestListddddwwwww");
    notifyListeners();
    //_nearestAppointmentDetails.clear();
    res.fold((l) {
      _appError = l;
      _isFetchingData = false;
      print('Da:: ' + _nearestAppointmentDetails.toString());
      notifyListeners();
      return false;
    }, (r) {
      // hasMoreData = r.totalCount-1>startIndex;
      // print("HasMoreFromGetData ${hasMoreData}");
      _isFetchingData = false;
      _nearestAppointmentDetails=r.dataList;
      print('Dataaaaaaavvvvv:: ' + _nearestAppointmentDetails.doctorName);
      notifyListeners();
      return true;
    });
  }

  AppError get appError => _appError;


  bool get shouldShowAppError => _appError != null && _nearestAppointmentDetails== null;
  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;
  bool get shouldShowNoNewsFound => _nearestAppointmentDetails== null && !isFetchingData;

  bool get shouldShowPageLoader =>
      _isFetchingData && _nearestAppointmentDetails == null;
  String get message => _message;

  Obj get nearestAppointmentDetails => _nearestAppointmentDetails;
}