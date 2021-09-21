import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/admin/appointment_report/models/appointment_doctor_search_model.dart';
import 'package:myhealthbd_app/admin/appointment_report/repositories/apointment_doctor_search_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';


class AppointmentDoctorListViewModel extends ChangeNotifier{
  AppointmentDoctorSearchtModel _companyList;
  List<DocItem> _docList=[];
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



  Future<bool> getData({String q,int companyNo,int ogNo,}) async {
    startIndex=0;
    _pageCount++;
    _isFetchingData = true;
    var res = await AppointmentDoctorSearchRepository().fetchDoctorSearchData(ogNo: ogNo,companyNo: companyNo);
    _companyList=res;
    _docList=res.items;
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


  AppointmentDoctorSearchtModel get doctorList => _companyList;
  List<DocItem> get docList=> _docList;
  int get  companyNo=>_companyNo;

}