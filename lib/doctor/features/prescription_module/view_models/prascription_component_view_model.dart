import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/prascription_component_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/prascription_component_repository.dart';

class PrescriptionComponentViewModel extends ChangeNotifier {
  PrescriptionComponentModel _componentList;
  Future<bool> getData() async {
    var res = await PrescriptionComponentRepository()
        .fetchPrescriptionComponentModel();
    _componentList = res;
    notifyListeners();
  }

  PrescriptionComponentModel get componentList => _componentList;
}
