import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/favourite_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/common_favourite_list_repository.dart';
import 'package:myhealthbd_app/doctor/main_app/prescription_favourite_type.dart';
import 'package:provider/provider.dart';

class OrthosisViewModel extends ChangeNotifier {
  static OrthosisViewModel read(BuildContext context) =>
      context.read<OrthosisViewModel>();
  static OrthosisViewModel watch(BuildContext context) =>
      context.watch<OrthosisViewModel>();
  bool shouldShowInReport;
  List<FavouriteItemModel> favouriteList = [];
  List searchItemList = [];
  List chiefComplaintList = [];

  Future<void> getData() async {
    var res = await CommonFavouriteListRepository().fetchFavouriteList(
        favouriteType: PrescriptionFavouriteType.orthosis.toString());
    favouriteList = res.items;
    notifyListeners();
    return;
  }
}
