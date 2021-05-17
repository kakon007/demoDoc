
import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/appointment_history/models/zoom_model.dart';
import 'package:myhealthbd_app/features/appointment_history/repositories/zoom_repository.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:provider/provider.dart';

class ZoomViewModel extends ChangeNotifier{
  Obj _zoomLinkList;
  bool _message;

  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  int _page = 1;

  // Future<void> refresh(){
  //  // _newsList.clear();
  //   return getData();
  // }

  Future<void> getData({String accessToken,String consultationId}) async {

    // if (isFromOnPageLoad) {
    //   if (_lastFetchTime != null) if (_lastFetchTime
    //       .difference(DateTime.now()) <
    //       CommonServiceRule.onLoadPageReloadTime) return;
    // }
    _isFetchingData = true;
    _lastFetchTime = DateTime.now();
    print("Consultation Id from Zoom View Model::: $consultationId");
    //var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
    var res = await ZoomRepository().fetchZoomLink(accessToken:accessToken,consultationId: consultationId);
    notifyListeners();
    //_newsList.clear();
    res.fold((l) {
      _appError = l;
      _isFetchingData = false;
      notifyListeners();
    }, (r) {
      _isFetchingData = false;
      _zoomLinkList=r.dataList;
      _message=r.message;
      notifyListeners();
    });
    //print("hhhhhh:::::::"+_newsList.first.title);
  }

  AppError get appError => _appError;


  bool get shouldShowAppError => _appError != null && _zoomLinkList== null;
  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;

  // bool get hasMoreData => _hasMoreData;
  //
  // bool get shouldFetchMoreData =>
  //     _hasMoreData && !_isFetchingData && !_isFetchingMoreData;

  bool get shouldShowNoNewsFound => _zoomLinkList== null && !isFetchingData;

  bool get shouldShowPageLoader =>
      _isFetchingData && _zoomLinkList == null;


  Obj get zoomDetailsList => _zoomLinkList;
  bool get successMessage=>_message;
}