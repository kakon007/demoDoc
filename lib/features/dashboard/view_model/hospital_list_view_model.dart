import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myhealthbd_app/features/dashboard/repositories/hospital_list_repository.dart';
import 'package:myhealthbd_app/features/hospitals/models/hospital_list_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
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

class HospitalListViewModel extends ChangeNotifier{
  List<Item> _hospitalList =[];

  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;

  Future<void> refresh(){
  _hospitalList.clear();
    return getData();
  }

  Future<void> getData() async {

    // if (isFromOnPageLoad) {
    //   if (_lastFetchTime != null) if (_lastFetchTime
    //       .difference(DateTime.now()) <
    //       CommonServiceRule.onLoadPageReloadTime) return;
    // }

    var res = await HospitalListRepositry().fetchHospitalList();
    notifyListeners();

    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _hospitalList.addAll(r.dataList);
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
      _isFetchingData && _hospitalList.length == 0;


  List<Item> get hospiitalList => _hospitalList;

}