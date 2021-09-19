import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/favourite_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/vitals_set_up_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/get_vitals_setup_list_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/vitals_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/advice_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/get_template_data_view_model.dart';
import 'package:myhealthbd_app/doctor/main_app/prescription_favourite_type.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:provider/provider.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/common_favourite_list_repository.dart';

class VitalsListSetupViewModel extends ChangeNotifier {
  static VitalsSetupModel read(BuildContext context) =>
      context.read<VitalsSetupModel>();
  static VitalsSetupModel watch(BuildContext context) =>
      context.watch<VitalsSetupModel>();
  bool shouldShowInReport;
  List<VitalsItem> vitalsSetupList = [];
  List searchItemList = [];
  List chiefComplaintList = [];
  bool get isActive => vitalsSetupList
      .any((element) => element.vitalsController.text.isNotEmpty);

  Future<void> getData() async {
    var res = await VitalsListSetupListRepository().fetchVitalsSetupList();
    vitalsSetupList = res.vitalsItems;
    notifyListeners();
    return;
  }
}
