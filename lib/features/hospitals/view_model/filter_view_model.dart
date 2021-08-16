import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/hospitals/models/department_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/specialization_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/repositories/filter_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class FilterViewModel extends ChangeNotifier{
  List<DeptItem> _departments =[];
  List<SpecializationItem> _specialist =[];
  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  bool _isLoading= false;
  Future<void> getDepartment(String companyNo) async {
    var res = await FilterRepository().fetchDepartment(companyNo);
    notifyListeners();
    _departments.clear();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _departments.addAll(r.deptList);
      notifyListeners();
    });
  }
  Future<void> getSpecialist(String id, String orgNo) async {
    var res = await FilterRepository().fetchSpeciality(id, orgNo);
    _isLoading= true;
    notifyListeners();
    _specialist.clear();
    res.fold((l) {
      _isLoading= false;
      _appError = l;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isLoading= false;
      _isFetchingMoreData = false;
      _specialist.addAll(r.specialList);
      notifyListeners();
    });
  }

  AppError get appError => _appError;

  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;


  bool get shouldShowPageLoader =>
      _isFetchingData && _departments.length == 0;
  bool get isLoading => _isLoading;

  List<SpecializationItem> get specialList => _specialist;

  List<DeptItem> get departmentList => _departments;

}