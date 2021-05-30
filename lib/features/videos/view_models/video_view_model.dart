import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/videos/models/channel_info_model.dart';
import 'package:myhealthbd_app/features/videos/repositories/channel_Info_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/util/common_serviec_rule.dart';

class VideoViewModel extends ChangeNotifier {
  List<Item> _videoList = [];

  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  bool _hasMoreData = false;
  String nextPageToken = '';
  int totalData = 0;

  int _page = 1;

  Future<void> refresh() {
    _videoList.clear();
    return getData();
  }

  Future<void> getData() async {
    // if (isFromOnPageLoad) {
    //   if (_lastFetchTime != null) if (_lastFetchTime
    //       .difference(DateTime.now()) <
    //       CommonServiceRule.onLoadPageReloadTime) return;
    // }
    _isFetchingData = true;
   // _lastFetchTime = DateTime.now();
    var res = await VideoInfoRepository.getVideoInfo();
    notifyListeners();
    _videoList.clear();
    res.fold((l) {
      _appError = l;
      _isFetchingData = false;
      notifyListeners();
      print("VideoTileVMError:::::::  $l");
      return false;
    }, (r) {
      _isFetchingData = false;
      _videoList.addAll(r.dataList);
      notifyListeners();
      return true;
    });
    print("VideoTileFromVM:::::::" + _videoList?.first?.snippet?.title);
  }

  // getMoreData() async {
  //   print("Calling from Video getMoreData:::::");
  //   print("HasMoreData ${hasMoreData}");
  //   print("isFetchingMoreData ${isFetchingMoreData}");
  //   print("isFetchingData ${isFetchingData}");
  //   if (!isFetchingMoreData && !isFetchingData && hasMoreData) {
  //
  //    //_pageCount++;
  //     isFetchingMoreData = true;
  //     Either<AppError, VideoListM> result =
  //     await VideoInfoRepository.getVideoInfo(pageToken:"CAUQAA");
  //     return result.fold((l) {
  //       isFetchingMoreData= false;
  //       hasMoreData = false;
  //       logger.i(l);
  //       notifyListeners();
  //       return false;
  //     }, (r) {
  //       hasMoreData = r.moreData??false;
  //       isFetchingMoreData = false;
  //       _videoList.addAll(r.dataList);
  //       notifyListeners();
  //       return true;
  //     });
  //   }
  // }

  // String _nextPageToken;
  getMoreData(String pagrToken) async {
    Either<AppError, VideoListM> result = await VideoInfoRepository.getVideoInfo(
        pageToken: pagrToken == '' ? nextPageToken : pagrToken);

    //_nextPageToken = res.nextPageToken;
    //_videoList.clear();
    return result.fold((l) {
      isFetchingMoreData = false;
      hasMoreData = false;
      print(l);
      notifyListeners();
      return false;
    }, (r) {
      totalData = r.maxData;
      nextPageToken = r.moreData;
      _videoList.addAll(r.dataList);
      print("MoreVideoList From Youtube:::" + _videoList.toString());
      print("MoreVideoList From Youtube Lenth:::" + _videoList.length.toString());
      print("MoreVideoList From Youtube Token:::" + r.moreData);
      notifyListeners();
      return true;
    });
  }

  AppError get appError => _appError;

  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;

  set isFetchingMoreData(bool value) {
    _isFetchingMoreData = value;
    notifyListeners();
  }

  bool get hasMoreData => _hasMoreData;

  set hasMoreData(bool value) {
    _hasMoreData = value;
    notifyListeners();
  }

  bool get shouldShowPageLoader => _isFetchingData && _videoList.length == 0;

  List<Item> get videoList => _videoList;
}
