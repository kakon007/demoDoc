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
import 'package:myhealthbd_app/features/appointments/repositories/book_appointment_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class BookAppointmentViewModel extends ChangeNotifier {
  List<Items> _slots = [];
  List<PatientItem> _patientItem = [];
  List<ConsultType> _consultItem = [];
  String _message="abc";
  bool _isLoading= false;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  AppError _appError;


  Future<void> getAppointData(
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
      String ogNo,
      String patientType,
      String consultationType,
      String opdConsultationFee,
      String fname,
      String phoneMobile,
      String gender,
      String address,
      String email,
      String dob,
      String paymodeNo,) async {
    _isLoading = true;
    var res = await BookAppointmentRepository().fetchAppointmentData(doctorNo, doctorName, appointDate, shiftdtlNo, shift, slotNo, slotSl, startTime, endTime, durationMin, extraSlot, slotSplited, ssCreatedOn, ssCreator, remarks, appointStatus, companyNo, ogNo, patientType, consultationType, opdConsultationFee, fname, phoneMobile, gender, address, email, dob, paymodeNo
     );
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      _isLoading= false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _message= r.message;
      _isLoading = false;
      notifyListeners();
    });
  }


  AppError get appError => _appError;

  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;


  bool get isLoading => _isLoading;

  bool get shouldShowPageLoader => _isFetchingData && _slots.length == 0;
  String get message => _message;

}
