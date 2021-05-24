import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/my_health/repositories/document_repository.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:provider/provider.dart';
import 'package:myhealthbd_app/features/my_health/models/documents_list_model.dart';

class DocumentViewModel extends ChangeNotifier{
  List<Item> _documentList =[];
  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  int _pageCount = 0;
  bool _hasMoreData = false;
  String searchQuery = '';
  bool _isInSearchMode = false;
  var count = 0;
  get logger => null;
  int limit=10;
  int startIndex=0;


  void resetPageCounter() {
    _pageCount = 1;
  }

  int get totalCount => count;

  set totalCount(int value) {
    count = value;
    notifyListeners();
  }

  bool get isFetchingMoreData => _isFetchingMoreData;

  set isFetchingMoreData(bool value) {
    _isFetchingMoreData = value;
    notifyListeners();
  }

  Future<bool> getDataforDoc() async {
    startIndex=0;
    _pageCount++;
    _isFetchingData = true;
    _lastFetchTime = DateTime.now();
    var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
    var vm = Provider.of<UserDetailsViewModel>(appNavigator.context,listen: false);
    var res = await DocumentRepository().fetchDocumentsList(accessToken: accessToken,page: _pageCount,query: searchQuery,username: vm.userDetailsList.hospitalNumber);
    notifyListeners();
    _documentList.clear();
    res.fold((l) {
      _appError = l;
      _isFetchingData = false;
      print('DataaaaaaafromDocumenterror:: ' );
      notifyListeners();
      return false;
    }, (r) {
      //hasMoreData = r.totalCount-1>startIndex;
      _isFetchingData = false;
      _documentList.addAll(r.dataListOfDocuments);
      //count = r.totalCount;
      print('DataaaaaaafromDocument:: ' + _documentList.length.toString());
      notifyListeners();
      return true;
    });
  }

  getMoreData() async {
    print("Calling from getMoreData:::::");
    print("HasMoreData ${hasMoreData}");
    print("fetch ${isFetchingMoreData}");
    print("fetched ${isFetchingData}");
    if (!isFetchingMoreData && !isFetchingData && hasMoreData) {
      startIndex+=limit;
      _pageCount++;
      isFetchingMoreData = true;
      var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
      Either<AppError, DocumentM> result =
      await DocumentRepository().fetchDocumentsList(accessToken: accessToken,query: searchQuery,startIndex: startIndex);
      return result.fold((l) {
        isFetchingMoreData= false;
        hasMoreData = false;
        logger.i(l);
        notifyListeners();
        return false;
      }, (r) {

        //hasMoreData = r.totalCount-1>startIndex+limit;
        isFetchingMoreData = false;
        _documentList.addAll(r.dataListOfDocuments);
        //count = r.totalCount;
        notifyListeners();
        return true;
      });
    }
  }


  Future<bool> refresh() async {
    _pageCount = 1;
    notifyListeners();
    return getDataforDoc();
  }
  search(String query,String accessToken) {
    _documentList.clear();
    _pageCount = 1;
    searchQuery = query;
    print("Searching for: $query");
    getDataforDoc();
  }

  toggleIsInSearchMode(String accessToken) {
    _isInSearchMode = !_isInSearchMode;
    count = 0;
    resetPageCounter();
    if (!_isInSearchMode) {
      searchQuery = "";
      getDataforDoc();
    }
    notifyListeners();
  }

  AppError get appError => _appError;



  bool get isFetchingData => _isFetchingData;

  // bool get isFetchingMoreData => _isFetchingMoreData;
  // set isFetchingMoreData(bool value) {
  //   _isFetchingMoreData = value;
  //   notifyListeners();
  // }

  bool get isInSearchMode => _isInSearchMode;

  set isInSearchMode(bool value) {
    _isInSearchMode = value;
  }

  bool get hasMoreData => _hasMoreData;

  set hasMoreData(bool value) {
    _hasMoreData = value;
    notifyListeners();
  }

  bool get shouldShowNoPrescriptionFound => _documentList.length == 0 && !isFetchingData;

  bool get shouldShowPageLoader =>
      _isFetchingData && _documentList.length == 0;


  List<Item> get documentList => _documentList;
}