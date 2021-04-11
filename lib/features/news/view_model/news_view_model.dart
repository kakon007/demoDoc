
import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/news/model/news_model.dart';
import 'package:myhealthbd_app/features/news/repositories/news_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class NewsViewModel extends ChangeNotifier{
  List<Item> _newsList =[];

  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;

  Future<void> refresh(){
    _newsList.clear();
    return getData();
  }

  Future<void> getData() async {

    // if (isFromOnPageLoad) {
    //   if (_lastFetchTime != null) if (_lastFetchTime
    //       .difference(DateTime.now()) <
    //       CommonServiceRule.onLoadPageReloadTime) return;
    // }

    var res = await NewsRepository().fetchNewspdate();
    notifyListeners();

    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _newsList.addAll(r.dataList);
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
      _isFetchingData && _newsList.length == 0;


  List<Item> get newsList => _newsList;
}