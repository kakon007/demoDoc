import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/my_health/repositories/search_doctor_repository.dart';
//import 'package:myhealthbd_app/features/my_health/repositories/shared_file_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/features/my_health/models/search_doctor_model.dart';
import 'package:provider/provider.dart';

class SearchDoctorViewModel extends ChangeNotifier{
  List<Itemm> _searchDocList =[];
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
  String _message;
  bool _isLoading = false;
  String _doctorName;
  String _hospitalName;
  int _doctorNo;


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

  Future<bool> getData({String name,int companyNo}) async {
    print('Enter Shared');
    _isLoading=true;
    // startIndex=0;
    // _pageCount++;
    _isFetchingData = true;
    //_lastFetchTime = DateTime.now();
    var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
    print('Enter Shared before');
    var res = await SearchDoctorRepository().fetchDoctorList(accessToken: accessToken,name: name,companyNo: companyNo);
    print('Enter Shared After');
    notifyListeners();
    _searchDocList.clear();
    res.fold((l) {
      _isLoading=false;
      _appError = l;
      _isFetchingData = false;
      print('Left Sharedd');
      notifyListeners();
      return false;
    }, (r) {
      _isLoading=false;
      // hasMoreData = r.totalCount-1>startIndex;
      _isFetchingData = false;
      _searchDocList.addAll(r.dataListOfsearchDoc);
      _message=r.message;
      print('Right Sharedd ${_searchDocList.first.doctorName}');
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
  //     Either<AppError, PrescriptioM> result =
  //     await PrescriptionRepository().fetchPrescriptionList(accessToken: accessToken,query: searchQuery,startIndex: startIndex);
  //     return result.fold((l) {
  //       isFetchingMoreData= false;
  //       hasMoreData = false;
  //       logger.i(l);
  //       notifyListeners();
  //       return false;
  //     }, (r) {
  //
  //       hasMoreData = r.totalCount-1>startIndex+limit;
  //       isFetchingMoreData = false;
  //       _prescriptionList.addAll(r.dataListofPrescription);
  //       count = r.totalCount;
  //       notifyListeners();
  //       return true;
  //     });
  //   }
  // }
  adDoctorsInfo({
    String doctorName,
    String hospitalName,
    int doctorNo,

  }){
    print("regId $doctorName");
    print("regNo $hospitalName");
    print("relatedRegId $doctorNo");
    _doctorName= doctorName;
    _hospitalName=hospitalName;
    _doctorNo= doctorNo;

  }

  Future<bool> refresh(String accessToke) async {
    _pageCount = 1;
    notifyListeners();
    return getData();
  }
  search(String query,String accessToken) {
    _searchDocList.clear();
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

  bool get shouldShowNoPrescriptionFound => _searchDocList.length == 0 && !isFetchingData;

  bool get shouldShowPageLoader =>
      _isFetchingData && _searchDocList.length == 0;


  List<Itemm> get searchDocList => _searchDocList;
  bool get isLoading =>_isLoading;
  String get message=>_message;
  String get doctorName=>_doctorName;
  String get hospitalName=>_hospitalName;
  int get doctorNo=>_doctorNo;
}