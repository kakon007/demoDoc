
import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/appointments/models/available_slots_model.dart';
import 'package:myhealthbd_app/features/appointments/models/consultation_type_model.dart';
import 'package:myhealthbd_app/features/appointments/models/doctor_info_model.dart';
import 'package:myhealthbd_app/features/appointments/models/patient_type_model.dart';
import 'package:myhealthbd_app/features/appointments/repositories/available_slots_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class OrderConfirmViewModel extends ChangeNotifier {
  bool _forMe = true;
  bool _addPatient = false;
  String _forMeBackColor = "#141D53";
  String _forMeTextColor = "#FFFFFF";
  String _addPatientBackColor = "#00FFFFFF";
  String _addPatientTextColor = "#8389A9";

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

  bool get forMe => _forMe;

  bool get addPatient => _addPatient;

  String get forMeBackColor => _forMeBackColor;

  String get forMeTextColor => _forMeTextColor;

  String get addPatientBackColor => _addPatientBackColor;

  String get addPatientTextColor => _addPatientTextColor;

}
