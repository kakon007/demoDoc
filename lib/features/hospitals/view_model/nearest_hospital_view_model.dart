import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myhealthbd_app/features/hospitals/repositories/nearest_hospital_repository.dart';
import 'package:myhealthbd_app/features/hospitals/models/nearest_hospital_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/util/common_serviec_rule.dart';
import 'package:provider/provider.dart';


class NearestHospitalViewModel extends ChangeNotifier{
  List<Item> _hospitalList =[];

  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  int _page = 1;
  bool _isLoading;

  Future<void> refresh(){
    _page = 0;
    _hospitalList.clear();
    return getData();
  }

  Future<void> getData({var userLatitude,var userLongitude}) async {
    // CacheRepositories.loadCachedHospital().then((value) {
    //   if(value!=null){
    //     _hospitalList=value.items;
    //     _hospitalList.removeAt(0);
    //     notifyListeners();
    //   }
    // });
    print('Nesrestcall');
    // print('Hospital :: ' + userLatitude);
    // print('Hospital :: ' + userLongitude);
    _isFetchingData = true;
    //_lastFetchTime = DateTime.now();
    _isLoading = true;
    var res = await NearestHospitalRepositry().fetchNearestHospitalList(userLatitude: userLatitude,userLongitude: userLongitude);
    print('Nesrestcallllk');
    notifyListeners();
    _hospitalList.clear();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      print('worng');
      notifyListeners();
    }, (r) {
      _isLoading= false;
      _isFetchingMoreData = false;
      _hospitalList.addAll(r.dataList);
      print('right');
      //_hospitalList.removeAt(0);
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
  bool get isLoading=> _isLoading;

  List<Item> get hospitalList2 => _hospitalList;

}