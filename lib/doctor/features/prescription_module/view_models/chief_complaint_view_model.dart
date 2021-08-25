import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/favourite_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/common_favourite_list_repository.dart';
import 'package:myhealthbd_app/doctor/main_app/prescription_favourite_type.dart';
import 'package:provider/provider.dart';

class ChiefComplaintViewModel extends ChangeNotifier {
  static ChiefComplaintViewModel read(BuildContext context) =>
      context.read<ChiefComplaintViewModel>();
  static ChiefComplaintViewModel watch(BuildContext context) =>
      context.watch<ChiefComplaintViewModel>();
  bool shouldShowInReport;
  List<FavouriteItemModel> favouriteList = [];
  List searchItemList = [];
  List chiefComplaintList = [];

  Future<void> getData() async {
    var res = await CommonFavouriteListRepository().fetchFavouriteList(
        favouriteType: PrescriptionFavouriteType.chiefComplaint.toString());
    favouriteList = res.items;
    notifyListeners();
    return;
  }
}
