import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:myhealthbd_app/features/dashboard/repositories/hospital_list_repository.dart';
//import 'package:myhealthbd_app/features/find_doctor/models/doctors_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/hospital_list_model.dart';
import 'package:myhealthbd_app/features/my_health/models/prescription_list_model.dart';
import 'package:myhealthbd_app/features/my_health/repositories/prescription_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/util/common_serviec_rule.dart';
import 'package:provider/provider.dart';


// class HospitalListViewModel extends GetxController{
//   var appError = AppError.none.obs;
//   var jobListApplied = <HospitalListModel>[].obs;
//   var isFetchingData = false.obs;
//   var isFetchingMoreData = false.obs;
//   void onClose() {
//     appError.close();
//     jobListApplied.close();
//     isFetchingData.close();
//     isFetchingData.close();
//     isFetchingMoreData.close();
//     super.onClose();
//   }
//
//   Future<bool> getJobList() async {
//    // _page = 1;
//     isFetchingData.value = true;
//
//     Either<AppError, HospiitalListM> result =
//     await HospitalListRepositry().fetchHospitalList();
//     return result.fold((l) {
//       isFetchingData.value = false;
//       //logger.i(l);
//       return false;
//     }, (r) {
//       //hasMoreData = r.hasMoreData;
//       isFetchingData.value = false;
//       jobListApplied.value = r.dataList;
//       return true;
//     });
//   }
//
// }

class PrescriptionListViewModel extends ChangeNotifier{
  List<Datum> _prescriptionList =[];
  //List<Datum> _prescriptionList=List<Datum>();
  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  int _pageCount = 1;
  String searchQuery = '';
  bool _isInSearchMode = false;

  // Future<void> refresh(){
  //   _page = 0;
  //   _prescriptionList.clear();
  //   return getData();
  // }

  Future<bool> getData(String accessToken) async {

    //
    // if (isFromOnPageLoad) {
    //   if (_lastFetchTime != null) if (_lastFetchTime
    //       .difference(DateTime.now()) <
    //       CommonServiceRule.onLoadPageReloadTime) return;
    // }
    _isFetchingData = true;
    _lastFetchTime = DateTime.now();
    var res = await PrescriptionRepository().fetchPrescriptionList(accessToken: accessToken,query: searchQuery);
    notifyListeners();
    _prescriptionList.clear();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      notifyListeners();
      return false;
    }, (r) {
      _isFetchingMoreData = false;
      _prescriptionList.addAll(r.dataListofPrescription);
      print('Dataaaaaaa2222222:: ' + _prescriptionList.toString());
      notifyListeners();
      return true;
    });
  }


  Future<bool> refresh(String accessToke) async {
    _pageCount = 1;
    notifyListeners();
    return getData(accessToke);
  }
  search(String query,String accessToken) {
    _prescriptionList.clear();
    _pageCount = 1;
    searchQuery = query;
    print("Searching for: $query");
    getData(accessToken);
  }

  toggleIsInSearchMode(String accessToken) {
    _isInSearchMode = !_isInSearchMode;
    //count = 0;
    //resetPageCounter();
    if (!_isInSearchMode) {
      searchQuery = "";
      getData(accessToken);
    }
    notifyListeners();
  }

  AppError get appError => _appError;



  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;

  bool get isInSearchMode => _isInSearchMode;

  set isInSearchMode(bool value) {
    _isInSearchMode = value;
  }


  // bool get hasMoreData => _hasMoreData;
  //
  // bool get shouldFetchMoreData =>
  //     _hasMoreData && !_isFetchingData && !_isFetchingMoreData;

  bool get shouldShowPageLoader =>
      _isFetchingData && _prescriptionList.length == 0;


  List<Datum> get prescriptionList => _prescriptionList;

}