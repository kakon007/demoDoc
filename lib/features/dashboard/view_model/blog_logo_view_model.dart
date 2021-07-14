
import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/dashboard/model/blog_logo_model.dart';

import 'package:myhealthbd_app/features/dashboard/repositories/blog_repository.dart';
import 'package:myhealthbd_app/features/news/repositories/news_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/util/common_serviec_rule.dart';

class BLogLogoViewModel extends ChangeNotifier{
  List<Item> _blogLogoList =[];

  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  int _page = 1;

  Future<void> refresh(){
    _blogLogoList.clear();
    return getData();
  }

  Future<void> getData() async {

   if(_blogLogoList.isEmpty){
     // if (isFromOnPageLoad) {
     //   if (_lastFetchTime != null) if (_lastFetchTime
     //       .difference(DateTime.now()) <
     //       CommonServiceRule.onLoadPageReloadTime) return;
     // }
     _isFetchingData = true;
     _lastFetchTime = DateTime.now();
     var res = await BlogRepository().fetchBlogLogo();
     notifyListeners();
     _blogLogoList.clear();
     res.fold((l) {
       _appError = l;
       _isFetchingMoreData = false;
       notifyListeners();
     }, (r) {
       _isFetchingMoreData = false;
       _blogLogoList.addAll(r.dataList2);
       notifyListeners();
     });
   }
  }

  AppError get appError => _appError;



  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;

  bool get shouldShowPageLoader =>
      _isFetchingData && _blogLogoList.length == 0;


  List<Item> get blogLogoList => _blogLogoList;
}