
import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/get_template_data_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/get_template_data_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/prescription_template_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/prescription_template_model.dart';

class GetTamplateDataViewModel extends ChangeNotifier{
  Obj _prescriptionTamplateList =Obj();
  AppError _appError;
  bool _isFetchingData = false;
  bool _hasMoreData = false;
  get logger => null;

  Future<bool> getData({var templateId}) async {
    print('Enterer');
    _isFetchingData = true;
    var res = await GetTemplateDataRepository().fetchTemplateData(templateId: templateId);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingData = false;
      print('falsew:: ');
      notifyListeners();
      return false;
    }, (r) {
      _isFetchingData = false;
      _prescriptionTamplateList=r.dataList;
      notifyListeners();
      return true;
    });
  }

  AppError get appError => _appError;
  bool get isFetchingData => _isFetchingData;
  Obj get prescriptionTamplateList => _prescriptionTamplateList;
}