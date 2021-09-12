import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/book_test/repository/company_list_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/features/book_test/model/company_list_model.dart';


class CompanyListViewModel extends ChangeNotifier{
  CompanyListModel _companyList;
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
    var res = await CompanyListRepository().fetchCompanyListData();
   _companyList=res;
    notifyListeners();
  }

  companyInfo({int companyNo}){
    _companyNo=companyNo;
    return _companyNo;
    //print("modelllc $_ogNO");
  }

  Future<bool> refresh(String accessToken) async {
    _pageCount = 1;
    notifyListeners();
    return getData();
  }
  // search(String query,String accessToken) {
  //   _companyList.clear();
  //   _pageCount = 1;
  //   searchQuery = query;
  //   print("Searching for: $query");
  //   getData();
  // }

  // toggleIsInSearchMode(String accessToken) {
  //   _isInSearchMode = !_isInSearchMode;
  //   count = 0;
  //   resetPageCounter();
  //   if (!_isInSearchMode) {
  //     searchQuery = "";
  //     getData();
  //   }
  //   notifyListeners();
  // }

  AppError get appError => _appError;



  bool get isFetchingData => _isFetchingData;

  bool get isInSearchMode => _isInSearchMode;

  set isInSearchMode(bool value) {
    _isInSearchMode = value;
  }

  bool get hasMoreData => _hasMoreData;

  set hasMoreData(bool value) {
    _hasMoreData = value;
    notifyListeners();
  }

  // bool get shouldShowNoPrescriptionFound => _companyList.length == 0 && !isFetchingData;
  //
  // bool get shouldShowPageLoader =>
  //     _isFetchingData && _companyList.length == 0;


  CompanyListModel get companyList => _companyList;
  int get  companyNo=>_companyNo;

}