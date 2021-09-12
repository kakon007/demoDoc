import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/dashboard/models/consult_status_model.dart';
import 'package:myhealthbd_app/doctor/features/dashboard/repositories/consultation_repository.dart';
import 'package:myhealthbd_app/doctor/features/profile/repositories/digital_signature_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:provider/provider.dart';

class ConsultationViewModel extends ChangeNotifier {

  bool _isLoading= false;
  AppError _appError;
  ConsultationStatusModel _consultationStatus;
  static ConsultationViewModel read(BuildContext context) =>
      context.read<ConsultationViewModel>();
  static ConsultationViewModel watch(BuildContext context) =>
      context.watch<ConsultationViewModel>();
  Future<void> getConsultationStatus() async {
      _isLoading = true;
      notifyListeners();
      var res = await ConsultationStatusRepository().fetchConsultationData();
      res.fold((l) {
        _appError = l;
        _isLoading = false;
        notifyListeners();
      }, (r) {
        _consultationStatus= r;
        _isLoading = false;
        notifyListeners();

      });
  }
  bool get isLoading => _isLoading;
  ConsultationStatusModel get consultationStatus => _consultationStatus;
}
