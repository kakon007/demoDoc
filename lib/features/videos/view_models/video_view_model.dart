
import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/videos/models/channel_info_model.dart';
import 'package:myhealthbd_app/features/videos/repositories/channel_Info_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/util/common_serviec_rule.dart';

class VideoViewModel extends ChangeNotifier{
  List<Item> _videoList =[];

  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  int _page = 1;

  Future<void> refresh(){
    _videoList.clear();
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
    var res = await VideoInfoRepository().getVideoInfo();
    notifyListeners();
    _videoList.clear();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _videoList.addAll(r.dataList);
      notifyListeners();
    });
    print("VideoTileFromVM:::::::"+_videoList.first.snippet.title);
  }

  AppError get appError => _appError;



  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;

  // bool get hasMoreData => _hasMoreData;
  //
  // bool get shouldFetchMoreData =>
  //     _hasMoreData && !_isFetchingData && !_isFetchingMoreData;

  bool get shouldShowPageLoader =>
      _isFetchingData && _videoList.length == 0;


  List<Item> get videoList => _videoList;
}