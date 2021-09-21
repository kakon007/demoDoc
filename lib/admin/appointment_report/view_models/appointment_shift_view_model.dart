import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/admin/appointment_report/models/appointment_shift_model.dart';
import 'package:myhealthbd_app/admin/appointment_report/repositories/appointment_shift_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';


class AppointmentShiftViewModel extends ChangeNotifier{
  AppointmentShiftListModel _companyList;
  List<Item> _shiftList=[];
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



  Future<bool> getData({int ogNo,int companyno}) async {
    startIndex=0;
    _pageCount++;
    _isFetchingData = true;
    var res = await ShiftListRepository().fetchShiftListData(ogNo: ogNo,companyno: companyno);
    _companyList=res;
    _shiftList = res.items;
    _shiftList.insert(0,Item(shiftNo: 0,shiftInsec: "0",shiftOutsec: "0",shiftName: 'All',shiftTime: 'All'));
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


  AppointmentShiftListModel get companyList => _companyList;
  List<Item> get shiftList=>_shiftList;
  int get  companyNo=>_companyNo;

}