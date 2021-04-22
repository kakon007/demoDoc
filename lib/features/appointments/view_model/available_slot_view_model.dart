// import 'package:flutter/cupertino.dart';
// import 'package:myhealthbd_app/features/appointments/models/available_slots_model.dart';
// import 'package:myhealthbd_app/features/appointments/repositories/available_slots_repository.dart';
// import 'package:myhealthbd_app/features/find_doctor/models/doctors_list_model.dart';
// import 'package:myhealthbd_app/features/find_doctor/repositories/doctor_list_repository.dart';
// import 'package:myhealthbd_app/main_app/failure/app_error.dart';
//
// class AvailableSlotsViewModel extends ChangeNotifier{
//   List<Items> _slots =[];
//   AppError _appError;
//   DateTime _lastFetchTime;
//   bool _isFetchingMoreData = false;
//   bool _isFetchingData = false;
//
//
//   Future<void> getSlots(DateTime pickedAppointDate, String companyNo, String doctorNo, String orgNo) async {
//     var res = await AvailableSlotsRepository().fetchSpecializationList(pickedAppointDate, companyNo, doctorNo, orgNo);
//     notifyListeners();
//     _slots.clear();
//     res.fold((l) {
//       _appError = l;
//       _isFetchingMoreData = false;
//       notifyListeners();
//     }, (r) {
//       _isFetchingMoreData = false;
//       _slots.addAll(r.slotList);
//       notifyListeners();
//     });
//   }
//
//
//   AppError get appError => _appError;
//
//   bool get isFetchingData => _isFetchingData;
//
//   bool get isFetchingMoreData => _isFetchingMoreData;
//
//
//   bool get shouldShowPageLoader =>
//       _isFetchingData && _slots.length == 0;
//
//   List<Items> get slotList => _slots;
//
// }

import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/appointments/models/available_slots_model.dart';
import 'package:myhealthbd_app/features/appointments/models/consultation_type_model.dart';
import 'package:myhealthbd_app/features/appointments/models/patient_type_model.dart';
import 'package:myhealthbd_app/features/appointments/repositories/available_slots_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';


class AvailableSlotsViewModel extends ChangeNotifier {
  List<Items> _slots = [];
  List<PatientItem> _patientItem = [];
  List<ConsultType> _consultItem = [];
  String slot;
  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  bool _isLoading;
  bool _isSlotStatusLoading;
  bool _isPatientLoading;
  String consultFee;
  bool _forMe= true;
  bool _addPatient= false;
  String _forMeBackColor = "#141D53";
  String _forMeTextColor = "#FFFFFF";
  String _addPatientBackColor = "#00FFFFFF";
  String _addPatientTextColor = "#8389A9";
  getAppointType(bool forMe, bool addPatient){
    _forMe = forMe;
    _addPatient= addPatient;
    notifyListeners();
  }
  getButtonColor(String forMeBackColor, String forMeTextColor, String addPatientBackColor, String addPatientTextColor){
    _forMeBackColor= forMeBackColor;
    _forMeTextColor= forMeTextColor;
    _addPatientBackColor= addPatientBackColor;
    _addPatientTextColor= addPatientTextColor;
    notifyListeners();
  }
  Future<void> getSlots(DateTime pickedAppointDate, String companyNo,
      String docotrNo, String orgNo) async {
    _isLoading = true;
    var res = await AvailableSlotsRepository()
        .fetchSlotInfo(pickedAppointDate, companyNo, docotrNo, orgNo);
    _slots.clear();
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _slots.addAll(r.slotList);
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> getSlotStatus(String slotNo, String companyNo, String orgNo) async {
    _isSlotStatusLoading = true;
    var res = await AvailableSlotsRepository()
        .fetchStatus(slotNo, companyNo, orgNo);
    _slots.clear();
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isSlotStatusLoading = false;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      slot = r.slotStatus;
      _isSlotStatusLoading = false;
      notifyListeners();
    });

  }


  Future<void> getPatType(String doctorNo) async {
    _isLoading = true;
    var res = await AvailableSlotsRepository().fetchPatType(doctorNo);
    _patientItem.clear();
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _patientItem.addAll(r.patType);
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> getConType(String doctorNo, String selectedType, String companyNo, String orgNo) async {
    _isLoading = true;
    var res = await AvailableSlotsRepository()
        .fetchConType(doctorNo, selectedType, companyNo, orgNo);
    consultType.clear();
    _consultItem.clear();
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _consultItem.addAll(r.consultType);
      _isLoading = false;
      notifyListeners();
    });
  }
  Future<void> getFee(String companyNo, String conTypeNo, String doctorNo, String orgNo, String patTypeNo) async {
    _isLoading = true;
    var res = await AvailableSlotsRepository().fetchFee(companyNo, conTypeNo, doctorNo,orgNo, patTypeNo);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
     consultFee = r.fee;
      _isLoading = false;
      notifyListeners();
    });
  }


  AppError get appError => _appError;

  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;
  bool get isSlotStatusLoading => _isSlotStatusLoading;
  bool get isLoading => _isLoading;

  bool get shouldShowPageLoader => _isFetchingData && _slots.length == 0;

  String get slotStatus => slot;

  String  get consultationFee =>   consultFee;
  List<PatientItem> get patientItem => _patientItem;
  List<Items> get slotList => _slots;
  List<ConsultType> get consultType => _consultItem;
  bool get forMe => _forMe;
  bool get addPatient => _addPatient;
  String get forMeBackColor => _forMeBackColor;
  String get forMeTextColor=> _forMeTextColor;
  String get addPatientBackColor=> _addPatientBackColor;
  String get addPatientTextColor => _addPatientTextColor;
}
