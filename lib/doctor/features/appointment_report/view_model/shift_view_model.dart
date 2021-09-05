import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/appointment_report/repositories/shift_repository.dart';
import 'package:myhealthbd_app/doctor/features/appointment_report/models/shift_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';





class ShiftListDocViewModel extends ChangeNotifier{
  List<Item> _shitList =[];
  AppError _appError;
  bool _isFetchingData = false;
  get logger => null;

  Future<bool> getData({int ogNo}) async {
    _isFetchingData = true;
    var res = await ShiftReportHistory().fetchShiftList(ogNo: ogNo);
    notifyListeners();
    _shitList.clear();
    res.fold((l) {
      _appError = l;
      _isFetchingData = false;
      notifyListeners();
      return false;
    }, (r) {
      _isFetchingData = false;
      _shitList=r.dataList;
      notifyListeners();
      return true;
    });
  }

  AppError get appError => _appError;
  bool get isFetchingData => _isFetchingData;

  bool get shouldShowNoPrescriptionFound => _shitList.length == 0 && !isFetchingData;

  bool get shouldShowPageLoader =>
      _isFetchingData && _shitList.length == 0;


  List<Item> get shitList => _shitList;

}