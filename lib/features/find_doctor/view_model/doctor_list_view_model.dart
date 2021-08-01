import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/find_doctor/models/doctors_list_model.dart';
import 'package:myhealthbd_app/features/find_doctor/repositories/doctor_list_repository.dart';
import 'package:myhealthbd_app/features/hospitals/models/department_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/specialization_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/repositories/filter_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class DoctorListViewModel extends ChangeNotifier{
  List<Datum> _doctor =[];
  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  bool _isLoading = false;
  bool _hasMoreData = false;

  var count = 0;
  int _pageCount = 0;
  get logger => null;
  int limit=10;
  int startIndex=0;

  Future<void> getDoctor(String orgNo, String companyNo, String deptItem, String specialSelectedItem, String doctorSearch) async {
    _doctor.clear();
   print(deptItem);
   print(specialSelectedItem);
    startIndex=0;
    _pageCount++;
    _isFetchingData = true;
    _lastFetchTime = DateTime.now();
    var res = await DoctorListRepository().getDoctorList(orgNo:orgNo, companyNo:companyNo,deptItem:deptItem, specialSelectedItem:specialSelectedItem, doctorSearch:doctorSearch,startIndex: startIndex);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingData = false;
      notifyListeners();
      return false;
    }, (r) {
      hasMoreData = r.totalCount-1>startIndex;
      _isFetchingData = false;
      _doctor=r.doctorList;
      print('Dataaaaaaa2222222:: ' + _doctor.toString());
      notifyListeners();
      return true;
    });
  }

  getMoreData(String orgNo, String companyNo, String deptItem, String specialSelectedItem, String doctorSearch) async {
    print("Calling from getMoreData:::::");
    print("HasMoreData ${hasMoreData}");
    print("isFetchingMoreData ${isFetchingMoreData}");
    print("isFetchingData ${isFetchingData}");
    if (!isFetchingMoreData && !isFetchingData && hasMoreData) {
      startIndex+=limit;
      _pageCount++;
      isFetchingMoreData = true;
      Either<AppError, DoctorListModel> result =
      await DoctorListRepository().getDoctorList(pageCount:_pageCount ,orgNo:orgNo, companyNo:companyNo,deptItem:deptItem, specialSelectedItem:specialSelectedItem, doctorSearch:doctorSearch,startIndex: startIndex);
      return result.fold((l) {
        isFetchingMoreData= false;
        hasMoreData = false;
        logger.i(l);
        notifyListeners();
        return false;
      }, (r) {

        hasMoreData = r.totalCount-1>startIndex+limit;
        isFetchingMoreData = false;
        _doctor.addAll(r.doctorList);
        print("DOctorListLength:: "+_doctor.length.toString());
        print("TotalCount:::::: "+r.totalCount.toString());
        count = r.totalCount;
        notifyListeners();
        return true;
      });
    }
  }
  AppError get appError => _appError;
  bool get isFetchingData => _isFetchingData;
  bool get isFetchingMoreData => _isFetchingMoreData;

  set isFetchingMoreData(bool value) {
    _isFetchingMoreData = value;
    notifyListeners();
  }
  bool get shouldShowPageLoader =>
      _isFetchingData && _doctor.length == 0;

  bool get hasMoreData => _hasMoreData;

  set hasMoreData(bool value) {
    _hasMoreData = value;
    notifyListeners();
  }
  bool get isLoading =>_isLoading;
  List<Datum> get doctorList => _doctor;

}