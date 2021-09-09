import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/appointment_report/repositories/appointment_report_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/doctor/features/appointment_report/models/appointment_report_models.dart';




class AppointmentReportListDocViewModel extends ChangeNotifier{
  List<Item> _appointmentReportList =[];
  AppError _appError;
  bool _isFetchingData = false;
  get logger => null;

  Future<bool> getData({int doctorNo,int ogNo, var fromDate, var toDate,int shiftNo}) async {
    _isFetchingData = true;
    var res = await AppointmentReportHistory().fetchAppointmentReportList(doctorNo: doctorNo,ogNo: ogNo,toDate: toDate,fromDate: fromDate,shiftNo: shiftNo);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingData = false;
      notifyListeners();
      return false;
    }, (r) {
      _isFetchingData = false;
      _appointmentReportList=r.dataList;
      notifyListeners();
      return true;
    });
  }

  AppError get appError => _appError;
  bool get isFetchingData => _isFetchingData;

  bool get shouldShowNoPrescriptionFound => _appointmentReportList.length == 0 && !isFetchingData;

  bool get shouldShowPageLoader =>
      _isFetchingData && _appointmentReportList.length == 0;


  List<Item> get appointmentReportList => _appointmentReportList;

}