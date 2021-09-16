import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/profile/models/designation_model.dart';
import 'package:myhealthbd_app/doctor/features/profile/models/personal_info_model.dart';
import 'package:myhealthbd_app/doctor/features/profile/models/specialization_name_model.dart';
import 'package:myhealthbd_app/doctor/features/profile/repositories/personal_info_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:provider/provider.dart';

class AdminPersonalInfoViewModel extends ChangeNotifier {
  bool _isPersonalInfoEditing=false;
  bool _isLoading= false;
  static AdminPersonalInfoViewModel read(BuildContext context) =>
      context.read<AdminPersonalInfoViewModel>();
  static AdminPersonalInfoViewModel watch(BuildContext context) =>
      context.watch<AdminPersonalInfoViewModel>();
  editingPersonalInfo({bool isPersonalInfoEditing}) {
    _isPersonalInfoEditing = isPersonalInfoEditing;
    // notifyListeners();
  }
  bool get isLoading => _isLoading;
  bool get isPersonalInfoEditing => _isPersonalInfoEditing;
}
