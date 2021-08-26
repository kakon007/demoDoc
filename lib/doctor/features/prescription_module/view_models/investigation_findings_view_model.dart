import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/favourite_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/common_favourite_list_repository.dart';
import 'package:myhealthbd_app/doctor/main_app/prescription_favourite_type.dart';
import 'package:provider/provider.dart';

class InvestigationFindingsViewModel extends ChangeNotifier {
  static InvestigationFindingsViewModel read(BuildContext context) =>
      context.read<InvestigationFindingsViewModel>();
  static InvestigationFindingsViewModel watch(BuildContext context) =>
      context.watch<InvestigationFindingsViewModel>();
  bool shouldShowInReport;
  List<FavouriteItemModel> favouriteList = [];
  List searchItemList = [];

  Future<void> getData() async {
    var res = await CommonFavouriteListRepository().fetchFavouriteList(
        favouriteType: PrescriptionFavouriteType.investigationFindings.toString());
    favouriteList = res.items;
    notifyListeners();
    return;
  }
}
