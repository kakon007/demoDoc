import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/patient_details/repositoris/consultation_history_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/doctor/features/patient_details/models/consultation_history_model.dart';




class ConsultationHistoryListDocViewModel extends ChangeNotifier{
  List<Item> _consList =[];
  AppError _appError;
  bool _isFetchingData = false;
  get logger => null;

  Future<bool> getData({var id}) async {
    _isFetchingData = true;
    var res = await ConsultationHistory().fetchConsultationList(id: id);
    notifyListeners();
    _consList.clear();
    res.fold((l) {
      _appError = l;
      _isFetchingData = false;
      notifyListeners();
      return false;
    }, (r) {
      _isFetchingData = false;
      _consList=r.dataList;
      notifyListeners();
      return true;
    });
  }

  AppError get appError => _appError;
  bool get isFetchingData => _isFetchingData;

  bool get shouldShowNoPrescriptionFound => _consList.length == 0 && !isFetchingData;

  bool get shouldShowPageLoader =>
      _isFetchingData && _consList.length == 0;


  List<Item> get consList => _consList;

}