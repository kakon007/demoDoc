
import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/appointments/models/available_slots_model.dart';
import 'package:myhealthbd_app/features/appointments/models/consultation_type_model.dart';
import 'package:myhealthbd_app/features/appointments/models/doctor_info_model.dart';
import 'package:myhealthbd_app/features/appointments/models/patient_type_model.dart';
import 'package:myhealthbd_app/features/appointments/repositories/available_slots_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class OrderConfirmViewModel extends ChangeNotifier {
  String _forMeBackColor = "#141D53";
  String _forMeTextColor = "#FFFFFF";
  String _addPatientBackColor = "#00FFFFFF";
  String _addPatientTextColor = "#8389A9";
}
