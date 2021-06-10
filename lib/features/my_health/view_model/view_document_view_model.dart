

import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/my_health/repositories/view_document_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:provider/provider.dart';

class ViewDocumentViewModel extends ChangeNotifier{

  String _obj;
  String _message;
  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  int _page = 1;


  Future<void> getData({String filePath}) async {
    _isFetchingData = true;
    _lastFetchTime = DateTime.now();
    var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
    var res = await ViewDocumentRepository().fetchViewDocumentsList(accessToken: accessToken,filePath: filePath);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _obj=r.dataListOfDocuments;
      notifyListeners();
    });
  }

  AppError get appError => _appError;


  bool get shouldShowAppError => _appError != null && _obj== null;
  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;
  bool get shouldShowNoNewsFound => _obj== null && !isFetchingData;

  bool get shouldShowPageLoader =>
      _isFetchingData && _obj == null;
  String get message => _message;

  String get objj => _obj;
}