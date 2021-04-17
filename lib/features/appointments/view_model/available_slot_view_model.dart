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
import 'package:myhealthbd_app/features/appointments/models/slot_status.dart';
import 'package:myhealthbd_app/features/appointments/repositories/available_slots_repository.dart';
import 'package:myhealthbd_app/features/find_doctor/models/doctors_list_model.dart';
import 'package:myhealthbd_app/features/find_doctor/repositories/doctor_list_repository.dart';
import 'package:myhealthbd_app/features/hospitals/models/department_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/specialization_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/repositories/filter_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class AvailableSlotsViewModel extends ChangeNotifier{
  List<Items> _slots =[];
  String slot;
  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  bool _isLoading;

  Future<AvailableSlotModel> getSlots(DateTime pickedAppointDate, String companyNo, String docotrNo, String orgNo) async {
     _isLoading= true;
    print(pickedAppointDate);
    var res = await AvailableSlotsRepository().fetchSlotInfo(pickedAppointDate, companyNo, docotrNo, orgNo);
    slotList.clear();
    _slots.clear();
    print("length" + slotList.length.toString());
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = true;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = true;
      _slots.addAll(r.slotList);
      _isLoading= false;
      notifyListeners();
    });
  }
  Future<SlotCheckModel> getSlotStatus(String slotNo,String companyNo,  String orgNo) async {
    var res = await AvailableSlotsRepository().fetchStatus(slotNo, companyNo, orgNo);
    notifyListeners();
    print(res);
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = true;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = true;
      slot= r.slotStatus;
      //print(_slots);
      notifyListeners();
    });

  }

  // Future<SlotStatusModel> getSlotStatus(String slotNo,String companyNo,  String orgNo) async {
  //
  //   var res = await AvailableSlotsRepository().fetchStatus(slotNo, companyNo, orgNo);
  //
  //   notifyListeners();
  //   res.fold((l) {
  //     print("ssssssssssssssssssssssssssssssssssssssssssssssssssssss");
  //     _appError = l;
  //     _isFetchingMoreData = false;
  //     slot = r.model;
  //     notifyListeners();
  //   }, (r) {
  //     _isFetchingMoreData = false;
  //     slot = r.model;
  //     print("12330255236");
  //     print(slot);
  //     notifyListeners();
  //   });
  // }

  AppError get appError => _appError;

  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;

  bool get isLoading => _isLoading;
  bool get shouldShowPageLoader =>
      _isFetchingData && _slots.length == 0;
  String  get slotStatus =>   slot;
  List<Items> get slotList => _slots;

}