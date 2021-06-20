import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/videos/models/channel_info_model.dart';
import 'package:myhealthbd_app/features/videos/repositories/channel_Info_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/util/common_serviec_rule.dart';

class VideoViewModel extends ChangeNotifier {
  List<Item> _videoList = [];
  List<Item> _videoListViewAll = [];
  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  bool _hasMoreData = false;
  String nextPageToken = '';
  int totalData = 0;

  int page = 0;

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
    var res = await VideoInfoRepository.getVideoInfo();
    notifyListeners();
    _videoList.clear();
    res.fold((l) {
      _appError = l;
      _isFetchingData = false;
      notifyListeners();
      return false;
    }, (r) {
      totalData = r.maxData;
      _isFetchingData = false;
      //     return result.fold((l) {
      //       isFetchingMoreData= false;
      //       hasMoreData = false;
      //       logger.i(l);
      //       notifyListeners();
      _videoList.addAll(r.dataList);
      notifyListeners();
      return true;
    });
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
  getMoreData() async {
    Either<AppError, VideoListM> result = await VideoInfoRepository.getVideoInfo(
        pageToken: nextPageToken);

    //_nextPageToken = res.nextPageToken;
    //_videoList.clear();
    return result.fold((l) {
      isFetchingMoreData = false;
      hasMoreData = false;
      print(l);
      notifyListeners();
      return false;
    }, (r) {
      page++;
      totalData = r.maxData;
      nextPageToken = r.moreData;
      _videoListViewAll.addAll(r.dataList);
      print("video length ${_videoListViewAll.length}");
      print("MoreVideoList From Youtube:::" + _videoListViewAll.toString());
      print("MoreVideoList From Youtube Length:::" + _videoListViewAll.length.toString());
      //print("MoreVideoList From Youtube Token:::" + r.moreData);
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
  List<Item> get videoListViewAll => _videoListViewAll;
}
