import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/find_doctor/models/doctors_list_model.dart';
import 'package:myhealthbd_app/features/find_doctor/repositories/doctor_list_repository.dart';
import 'package:myhealthbd_app/features/hospitals/models/department_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/specialization_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/repositories/filter_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class DoctorListViewModel extends ChangeNotifier{
  List<Datum> _doctor =[];
  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  bool _isLoading = false;


  Future<void> getDoctor(String orgNo, String companyNo, String deptItem, String specialSelectedItem, String doctorSearch) async {
    _isLoading=true;
    var res = await DoctorListRepository().getDoctorList(orgNo, companyNo,deptItem, specialSelectedItem, doctorSearch);
    _doctor.clear();
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      _isLoading=false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _doctor.addAll(r.doctorList);
      _isLoading=false;
      notifyListeners();
    });
  }
  AppError get appError => _appError;
  bool get isFetchingData => _isFetchingData;
  bool get isFetchingMoreData => _isFetchingMoreData;
  bool get shouldShowPageLoader =>
      _isFetchingData && _doctor.length == 0;
  bool get isLoading =>_isLoading;
  List<Datum> get doctorList => _doctor;

}