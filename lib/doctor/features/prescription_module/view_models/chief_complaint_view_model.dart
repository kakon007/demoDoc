import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/favourite_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/chirf_complaint_repository.dart';
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
    var res = await ChiefComplaintsRepository().fetchFavouriteList();
    favouriteList = res.items;
    notifyListeners();
    return;
  }
}
