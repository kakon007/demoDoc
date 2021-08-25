import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/favourite_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/common_favourite_list_repository.dart';
import 'package:myhealthbd_app/doctor/main_app/prescription_favourite_type.dart';
import 'package:provider/provider.dart';

class ClinicalHistoryViewModel extends ChangeNotifier {
  static ClinicalHistoryViewModel read(BuildContext context) =>
      context.read<ClinicalHistoryViewModel>();
  static ClinicalHistoryViewModel watch(BuildContext context) =>
      context.watch<ClinicalHistoryViewModel>();
  bool shouldShowInReport;
  List<FavouriteItemModel> favouriteList = [];
  List searchItemList = [];
  List chiefComplaintList = [];

  Future<void> getData() async {
    var res = await CommonFavouriteListRepository().fetchFavouriteList(
        favouriteType: PrescriptionFavouriteType.clinicalHistory.toString());
    favouriteList = res.items;
    notifyListeners();
    return;
  }
}
