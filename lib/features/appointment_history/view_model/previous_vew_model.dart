

import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/appointment_history/models/previous_model.dart';
import 'package:myhealthbd_app/features/appointment_history/repositories/previous_repository.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:provider/provider.dart';

class AppointmentPreviousViewModel extends ChangeNotifier{
  List<Item> _previousList =[];
  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  int _pageCount = 0;
  bool _hasMoreData = false;
  String searchQuery = '';
  bool _isInSearchMode = false;
  var count = 0;
  get logger => null;
  int limit=10;
  int startIndex=0;


  void resetPageCounter() {
    _pageCount = 1;
  }

  int get totalCount => count;

  set totalCount(int value) {
    count = value;
    notifyListeners();
  }

  bool get isFetchingMoreData => _isFetchingMoreData;

  set isFetchingMoreData(bool value) {
    _isFetchingMoreData = value;
    notifyListeners();
  }

  Future<bool> getData() async {
    print("CalledfromPreviousList");
    startIndex=0;
    _pageCount++;
    _isFetchingData = true;
    _lastFetchTime = DateTime.now();
    var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
    //var vm = Provider.of<UserDetailsViewModel>(appNavigator.context);
    var res = await AppointmentPreviousRepository().fetchAppointmentPreviousHistory(pageCount: _pageCount,accessToken:accessToken);
    notifyListeners();
    _previousList.clear();
    res.fold((l) {
      _appError = l;
      _isFetchingData = false;
      notifyListeners();
      return false;
    }, (r) {
      //hasMoreData = r.totalCount-1>startIndex;
      _isFetchingData = false;
      _previousList.addAll(r.dataList);
      print('Dataaaaaaa2222222:: ' + _previousList.toString());
      notifyListeners();
      return true;
    });
  }

  // getMoreData(String accessToken) async {
  //   print("Calling from getMoreData:::::");
  //   print("HasMoreData ${hasMoreData}");
  //   print("fetch ${isFetchingMoreData}");
  //   print("fetched ${isFetchingData}");
  //   if (!isFetchingMoreData && !isFetchingData && hasMoreData) {
  //     startIndex+=limit;
  //     _pageCount++;
  //     isFetchingMoreData = true;
  //     Either<AppError, Upcoming> result =
  //     await AppointmentUpcomingRepository().fetchAppointmentUpcomingHistory();
  //     return result.fold((l) {
  //       isFetchingMoreData= false;
  //       hasMoreData = false;
  //       logger.i(l);
  //       notifyListeners();
  //       return false;
  //     }, (r) {
  //
  //       //hasMoreData = r.totalCount-1>startIndex+limit;
  //       isFetchingMoreData = false;
  //       _upComingList.addAll(r.dataList);
  //       //count = r.totalCount;
  //       notifyListeners();
  //       return true;
  //     });
  //   }
  // }


  Future<bool> refresh(String accessToke) async {
    _pageCount = 1;
    notifyListeners();
    return getData();
  }
  search(String query,String accessToken) {
    _previousList.clear();
    _pageCount = 1;
    searchQuery = query;
    print("Searching for: $query");
    getData();
  }

  toggleIsInSearchMode(String accessToken) {
    _isInSearchMode = !_isInSearchMode;
    count = 0;
    resetPageCounter();
    if (!_isInSearchMode) {
      searchQuery = "";
      getData();
    }
    notifyListeners();
  }

  AppError get appError => _appError;



  bool get isFetchingData => _isFetchingData;

  // bool get isFetchingMoreData => _isFetchingMoreData;
  // set isFetchingMoreData(bool value) {
  //   _isFetchingMoreData = value;
  //   notifyListeners();
  // }

  bool get isInSearchMode => _isInSearchMode;

  set isInSearchMode(bool value) {
    _isInSearchMode = value;
  }

  bool get hasMoreData => _hasMoreData;

  set hasMoreData(bool value) {
    _hasMoreData = value;
    notifyListeners();
  }

  bool get shouldShowNoPrescriptionFound => _previousList.length == 0 && !isFetchingData;

  bool get shouldShowPageLoader =>
      _isFetchingData && _previousList.length == 0;


  List<Item> get previousAppointmentList => _previousList;
}