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
import 'package:myhealthbd_app/features/appointments/models/doctor_info_model.dart';
import 'package:myhealthbd_app/features/appointments/models/patient_type_model.dart';
import 'package:myhealthbd_app/features/appointments/repositories/available_slots_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class AvailableSlotsViewModel extends ChangeNotifier {
  List<Items> _slots = [];
  Obj _doctors;
  List<PatientItem> _patientItem = [];
  String _patNo;
  String _patOther;
  List<ConsultType> _consultItem = [];
  List<ConsultType> _consultItem2 = [];
  String slot;
  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  bool _isLoading;
  bool _isSlotStatusLoading;
  bool _isPatientLoading;
  String consultFee;
  String consultFeeForMe;
  bool _forMe = true;
  bool _addPatient = false;
  String _forMeBackColor = "#141D53";
  String _forMeTextColor = "#FFFFFF";
  String _addPatientBackColor = "#00FFFFFF";
  String _addPatientTextColor = "#8389A9";

  String _doctorNo;
  String _doctorName;
  String _appointDate;
  String _shiftdtlNo;
  String _shift;
  String _slotNo;
  String _slotSl;
  String _startTime;
  String _endTime;
  String _durationMin;
  String _extraSlot;
  String _slotSplited;
  String _ssCreatedOn;
  String _ssCreator;
  String _remarks;
  String _appointStatus;
  String _companyNo;
  String _ogNo;
  String _docNo;
  String _orgNo;
  String _comNo;
  getInfo(
      String doctorNo,
      String companyNo,
      String orgNo
      ){
    _docNo= doctorNo;
    _comNo= companyNo;
    _orgNo= orgNo;
  }
  getAppointInfo(
      String doctorNo,
      String doctorName,
      String appointDate,
      String shiftdtlNo,
      String shift,
      String slotNo,
      String slotSl,
      String startTime,
      String endTime,
      String durationMin,
      String extraSlot,
      String slotSplited,
      String ssCreatedOn,
      String ssCreator,
      String remarks,
      String appointStatus,
      String companyNo,
      String ogNo) {
    print(doctorNo);
    print(ssCreator);
    print(ssCreatedOn);
    print(slotSplited);
    print(slotSl);
    _doctorNo = _doctorName;
    _doctorName = doctorName;
    _appointDate = appointDate;
    _shiftdtlNo = shiftdtlNo;
    _shift = shift;
    _slotNo = slotNo;
    _slotSl = slotSl;
    _startTime = startTime;
    _endTime = endTime;
    _durationMin = durationMin;
    _extraSlot = extraSlot;
    _slotSplited = slotSplited;
    _ssCreatedOn = ssCreatedOn;
    _ssCreator = ssCreator;
    _remarks = remarks;
    _appointStatus = appointStatus;
    _companyNo = companyNo;
    _ogNo = ogNo;

    notifyListeners();
  }

  getAppointType(bool forMe, bool addPatient) {
    _forMe = forMe;
    _addPatient = addPatient;
    notifyListeners();
  }

  getButtonColor(String forMeBackColor, String forMeTextColor,
      String addPatientBackColor, String addPatientTextColor) {
    _forMeBackColor = forMeBackColor;
    _forMeTextColor = forMeTextColor;
    _addPatientBackColor = addPatientBackColor;
    _addPatientTextColor = addPatientTextColor;
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
  Future<void> getDoctorInfo(String companyNo,
      String doctorNo, String orgNo) async {
    _isLoading = true;
    var res = await AvailableSlotsRepository()
        .fetchDoctorInfo(companyNo, doctorNo, orgNo);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _doctors=r.obj;
      _isLoading = false;
      notifyListeners();
    });
  }
  Future<void> getSlotStatus(
      String slotNo, String companyNo, String orgNo) async {
    _isSlotStatusLoading = true;
    var res =
        await AvailableSlotsRepository().fetchStatus(slotNo, companyNo, orgNo);
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
      for(int i= 0; i<=_patientItem.length; i++)
        {
          _patNo= _patientItem.reversed.first.patientTypeNo.toString();
          _patOther= _patientItem.first.patientTypeNo.toString();
        }
      print("abc" + _patNo);
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> getConType(String doctorNo, String selectedType,
      String companyNo, String orgNo) async {
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
  Future<void> getConTypeForMe(String doctorNo, String selectedType,
      String companyNo, String orgNo) async {
    _isLoading = true;
    var res = await AvailableSlotsRepository()
        .fetchConType(doctorNo, selectedType, companyNo, orgNo);
    //consultType.clear();
    _consultItem2.clear();
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _consultItem2.addAll(r.consultType);
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> getFee(String companyNo, String conTypeNo, String doctorNo,
      String orgNo, String patNo) async {
    _isLoading = true;
    print("company $companyNo");
    print("con $conTypeNo");
    print("doc $doctorNo");
    print("orgNo $orgNo");
    print("Pat $patNo");
    var res = await AvailableSlotsRepository()
        .fetchFee(companyNo, conTypeNo, doctorNo, orgNo, patNo);
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
  Future<void> getFeeForMe(String companyNo, String conTypeNo, String doctorNo,
      String orgNo, String patNo) async {
    _isLoading = true;
    print("company $companyNo");
    print("con $conTypeNo");
    print("doc $doctorNo");
    print("orgNo $orgNo");
    print("Pat $patNo");
    var res = await AvailableSlotsRepository()
        .fetchFee(companyNo, conTypeNo, doctorNo, orgNo, patNo);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      consultFeeForMe = r.fee;
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

  String get consultationFee => consultFee;

  String get consultationFeeForMe => consultFeeForMe;


  Obj get doctorInfo => _doctors;
  List<PatientItem> get patientItem => _patientItem;
String get patNo => _patNo;
  List<Items> get slotList => _slots;

  List<ConsultType> get consultType => _consultItem;
  List<ConsultType> get consultType2 => _consultItem2;

  bool get forMe => _forMe;

  bool get addPatient => _addPatient;

  String get forMeBackColor => _forMeBackColor;

  String get forMeTextColor => _forMeTextColor;

  String get addPatientBackColor => _addPatientBackColor;

  String get addPatientTextColor => _addPatientTextColor;

  String get doctorNo => _doctorNo;

  String get doctorName => _doctorName;

  String get appointDate => _appointDate;

  String get shiftdtlNo => _shiftdtlNo;

  String get shift => _shift;

  String get slotNo => _slotNo;

  String get slotSl => _slotSl;

  String get startTime => _startTime;

  String get endTime => _endTime;

  String get durationMin => _durationMin;

  String get extraSlot => _extraSlot;

  String get slotSplited => _slotSplited;

  String get ssCreatedOn => _ssCreatedOn;

  String get ssCreator => _ssCreator;

  String get remarks => _remarks;

  String get appointStatus => _appointStatus;

  String get companyNo => _companyNo;

  String get ogNo => _ogNo;

  String get orgNo => _orgNo;
  String get comNo => _comNo;
  String get docNo => _docNo;
  String get patOther => _patOther;
}
