
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/cache/cache_repositories.dart';
import 'package:myhealthbd_app/features/hospitals/models/company_image_model.dart';
import 'package:myhealthbd_app/features/hospitals/repositories/hospital_image_repository.dart';
import 'package:myhealthbd_app/features/hospitals/repositories/hospital_logo_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/util/common_serviec_rule.dart';
import 'package:provider/provider.dart';

class HospitalImageViewModel extends ChangeNotifier{

  List<Item> _hospitalImageList=[];

  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  int _page = 1;
  bool _isLoading;

  Future<void> refresh(){
    _page = 0;
    _hospitalImageList.clear();
    return getImageData();
  }


  Future<void> getImageData() async {
    // if (isFromOnPageLoad) {
    //   if (_lastFetchTime != null) if (_lastFetchTime
    //       .difference(DateTime.now()) <
    //       CommonServiceRule.onLoadPageReloadTime) return;
    // }


    CacheRepositories.loadCachedHospitalImage().then((value) {
      if(value!=null){
        _hospitalImageList=value.items;
        _hospitalImageList.removeAt(0);
        notifyListeners();
      }
    });
    print("DATA fromImage List:::::");
    _isFetchingData = true;
    _lastFetchTime = DateTime.now();
    _isLoading = true;
    var res = await HospitalImagerepository().fetchHospitalImage();
    notifyListeners();
    _hospitalImageList.clear();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isLoading= false;
      _isFetchingMoreData = false;
      _hospitalImageList.addAll(r.dataList2);
      _hospitalImageList.removeAt(0);
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

  bool get shouldShowPageLoaderForImage =>
      _isFetchingData && _hospitalImageList.length == 0;
  bool get isLoading=> _isLoading;
  List<Item> get hospitalImageList => _hospitalImageList;

}