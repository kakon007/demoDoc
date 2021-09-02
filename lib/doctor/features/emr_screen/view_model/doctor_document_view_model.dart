import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/emr_screen/repositories/doctor_document_list_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/doctor/features/emr_screen/models/doctor_documentation_list_model.dart';




class DoctorDocumentationListDocViewModel extends ChangeNotifier{
  List<Datum> _documentationList =[];
  AppError _appError;
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



  Future<bool> getData({var regNo,var doctorNo}) async {
    startIndex=0;
    _pageCount++;
    _isFetchingData = true;
    var res = await DoctorDocumentationListRepository().fetchDocList(regNo: regNo,doctorNo: doctorNo,startIndex: startIndex);
    notifyListeners();
    _documentationList.clear();
    res.fold((l) {
      _appError = l;
      _isFetchingData = false;
      notifyListeners();
      return false;
    }, (r) {
      hasMoreData = r.totalCount-1>startIndex;
      _isFetchingData = false;
      _documentationList=r.dataFromDocumentList;
      count = r.totalCount;
      notifyListeners();
      return true;
    });
  }

  getMoreData({var regNo,var doctorNo}) async {
    if (!isFetchingMoreData && !isFetchingData && hasMoreData) {
      startIndex+=limit;
      _pageCount++;
      isFetchingMoreData = true;
      Either<AppError, DocumentationM> result =
      await  await DoctorDocumentationListRepository().fetchDocList(regNo: regNo,doctorNo: doctorNo);
      return result.fold((l) {
        isFetchingMoreData= false;
        hasMoreData = false;
        logger.i(l);
        notifyListeners();
        return false;
      }, (r) {
        hasMoreData = r.totalCount-1>startIndex+limit;
        isFetchingMoreData = false;
        _documentationList.addAll(r.dataFromDocumentList);
        count = r.totalCount;
        notifyListeners();
        return true;
      });
    }
  }


  Future<bool> refresh(String accessToken) async {
    _pageCount = 1;
    notifyListeners();
    return getData();
  }
  search(String query,String accessToken) {
    _documentationList.clear();
    _pageCount = 1;
    searchQuery = query;
    print("Searching for: $query");
    getData();
  }

  toggleIsInSearchMode(String accessToken) {
    _isInSearchMode = !_isInSearchMode;
    count = 0;
    resetPageCounter();
    if (!_isInSearchMode) {
      searchQuery = "";
      getData();
    }
    notifyListeners();
  }

  AppError get appError => _appError;



  bool get isFetchingData => _isFetchingData;

  bool get isInSearchMode => _isInSearchMode;

  set isInSearchMode(bool value) {
    _isInSearchMode = value;
  }

  bool get hasMoreData => _hasMoreData;

  set hasMoreData(bool value) {
    _hasMoreData = value;
    notifyListeners();
  }

  bool get shouldShowNoPrescriptionFound => _documentationList.length == 0 && !isFetchingData;

  bool get shouldShowPageLoader =>
      _isFetchingData && _documentationList.length == 0;


  List<Datum> get documentationList => _documentationList;

}