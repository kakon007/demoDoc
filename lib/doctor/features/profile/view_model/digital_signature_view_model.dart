import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/profile/models/designation_model.dart';
import 'package:myhealthbd_app/doctor/features/profile/models/personal_info_model.dart';
import 'package:myhealthbd_app/doctor/features/profile/models/specialization_name_model.dart';
import 'package:myhealthbd_app/doctor/features/profile/repositories/digital_signature_repository.dart';
import 'package:myhealthbd_app/doctor/features/profile/repositories/personal_info_repository.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:provider/provider.dart';

class DigitalSignatureViewModel extends ChangeNotifier {

  bool _isLoading= false;
  String _signatureImage;
  AppError _appError;
  File _file;
  static DigitalSignatureViewModel read(BuildContext context) =>
      context.read<DigitalSignatureViewModel>();
  static DigitalSignatureViewModel watch(BuildContext context) =>
      context.watch<DigitalSignatureViewModel>();
  Future<void> getDigitalSignature({bool force=false}) async {
    if(_signatureImage==null || force){
      _isLoading = true;
      notifyListeners();
      var res = await DigitalSignatureRepository().fetchDigitalSignature();
      res.fold((l) {
        _appError = l;
        _isLoading = false;
        notifyListeners();
      }, (r) {
        _signatureImage = r.signature;
        _isLoading = false;
        notifyListeners();

      });
    }
  }
  Future<void> uploadSignature({bool force=false}) async {
    Map<String, String> data = {
      'doctoreNo': Provider.of<UserImageViewModel>(appNavigator.context, listen: false)
           .details.doctorNo.toString()
    };
      _isLoading = true;
      notifyListeners();
      var res = await DigitalSignatureRepository().uploadDigitalSignature();
      if(res=='200'){
        getDigitalSignature(force: true);
      }
  }
  initialSignatureFile(File file){
    // print(file.path);
    _file = file;
    //notifyListeners();
  }
  signatureFile(File file){
   // print(file.path);
    _file = file;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  String get signatureImage => _signatureImage;
  File get imageFile => _file;
}
