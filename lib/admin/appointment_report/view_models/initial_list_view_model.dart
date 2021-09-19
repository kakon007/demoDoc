import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/admin/appointment_report/models/initial_list_model.dart';
import 'package:myhealthbd_app/admin/appointment_report/repositories/initial_list_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';


class InitialCompanyListViewModel extends ChangeNotifier{
  InitialListModel _companyList;
  AppError _appError;
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
  int _companyNo=2;


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
    startIndex=0;
    _pageCount++;
    _isFetchingData = true;
    var res = await InitialListRepository().fetchIinitialCompanyListData();
    _companyList=res;
    notifyListeners();
  }

  // companyInfo({int companyNo}){
  //   _companyNo=companyNo;
  //   return _companyNo;
  //   //print("modelllc $_ogNO");
  // }

  Future<bool> refresh(String accessToken) async {
    _pageCount = 1;
    notifyListeners();
    return getData();
  }

  AppError get appError => _appError;

  bool get hasMoreData => _hasMoreData;

  set hasMoreData(bool value) {
    _hasMoreData = value;
    notifyListeners();
  }


  InitialListModel get companyList => _companyList;
  int get  companyNo=>_companyNo;

}