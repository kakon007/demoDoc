import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/demo_doctor/view/zoom_model.dart';
import 'package:myhealthbd_app/demo_doctor/view/zoom_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';


class ZoomVideoViewModel extends ChangeNotifier {
  List<ZoomAPI> _videoList = [];
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
      var res = await ZoomDemoDoctorRepository().fetchZoomLinkHistory();
      notifyListeners();
      _videoList.clear();
      res.fold((l) {
        _appError = l;
        _isFetchingData = false;
        notifyListeners();
        return false;
      }, (r) {
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

  List<ZoomAPI> get videoList => _videoList;
}
