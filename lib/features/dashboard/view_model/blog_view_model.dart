
import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/dashboard/model/blog_model.dart';
import 'package:myhealthbd_app/features/dashboard/repositories/blog_repository.dart';
import 'package:myhealthbd_app/features/news/repositories/news_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/util/common_serviec_rule.dart';

class BLogViewModel extends ChangeNotifier{
  List<Item> _newsList =[];

  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  int _page = 1;

  Future<void> refresh(){
    _newsList.clear();
    return getData();
  }

  Future<void> getData({bool isFromOnPageLoad = false}) async {

if(_newsList.isEmpty){
  if (isFromOnPageLoad) {
    if (_lastFetchTime != null) if (_lastFetchTime
        .difference(DateTime.now()) <
        CommonServiceRule.onLoadPageReloadTime) return;
  }
  _isFetchingData = true;
  _lastFetchTime = DateTime.now();
  var res = await BlogRepository().fetchBlog();
  notifyListeners();
  _newsList.clear();
  res.fold((l) {
    _appError = l;
    _isFetchingMoreData = false;
    notifyListeners();
  }, (r) {
    _isFetchingMoreData = false;
    _newsList.addAll(r.dataList);
    notifyListeners();
  });
  // print("hhhhhh:::::::"+_newsList.first.title);
}
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