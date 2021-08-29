import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/favourite_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/medication_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/common_favourite_list_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/medication_repository.dart';
import 'package:myhealthbd_app/doctor/main_app/prescription_favourite_type.dart';
import 'package:provider/provider.dart';

class MedicationViewModel extends ChangeNotifier {
  static MedicationViewModel read(BuildContext context) =>
      context.read<MedicationViewModel>();
  static MedicationViewModel watch(BuildContext context) =>
      context.watch<MedicationViewModel>();
  bool shouldShowInReport;
  List<FavouriteItemModel> favouriteList = [];
  List searchItemList = [];
  List medicationList = [];
  MedicationModel medicationModelList;

  Future<void> getData() async {
    var res = await CommonFavouriteListRepository().fetchFavouriteList(
        favouriteType: PrescriptionFavouriteType.medication.toString());
    favouriteList = res.items;
    notifyListeners();
    return;
  }

  Future<void> getDataRouteToInstruction() async {
    var res = await MedicationRepository().fetchMedicationList();
    medicationModelList = res;
    // print("gggg${res.items.first.companyNo}");
    notifyListeners();
    return;
  }
}
