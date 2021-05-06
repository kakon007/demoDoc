

import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/news/model/news_logo_model.dart';
import 'package:myhealthbd_app/features/news/repositories/news_logo_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/util/common_serviec_rule.dart';

class NewsLogoViewModel extends ChangeNotifier{
  List<Item> _newsLogoList =[];

  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  int _page = 1;

  Future<void> refresh(){
    _newsLogoList.clear();
    return getData();
  }

  Future<void> getData({bool isFromOnPageLoad = false}) async {

    if (isFromOnPageLoad) {
      if (_lastFetchTime != null) if (_lastFetchTime
          .difference(DateTime.now()) <
          CommonServiceRule.onLoadPageReloadTime) return;
    }
    _isFetchingData = true;
    _lastFetchTime = DateTime.now();
    var res = await NewsLogoRepository().fetchNewsLogo();
    notifyListeners();
    _newsLogoList.clear();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _newsLogoList.addAll(r.dataList);
      notifyListeners();
    });
    //print("hhhhhh:::::::"+_newsLogoList.first.title);
  }

  AppError get appError => _appError;


  bool get shouldShowAppError => _appError != null && _newsLogoList.length == 0;
  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;

  // bool get hasMoreData => _hasMoreData;
  //
  // bool get shouldFetchMoreData =>
  //     _hasMoreData && !_isFetchingData && !_isFetchingMoreData;

  bool get shouldShowNoNewsFound => _newsLogoList.length == 0 && !isFetchingData;

  bool get shouldShowPageLoader =>
      _isFetchingData && _newsLogoList.length == 0;


  List<Item> get newsLogoList => _newsLogoList;
}