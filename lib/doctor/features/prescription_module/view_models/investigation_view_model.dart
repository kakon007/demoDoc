import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/favourite_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/common_favourite_list_repository.dart';
import 'package:provider/provider.dart';

class InvestigationViewModel extends ChangeNotifier {
  static InvestigationViewModel read(BuildContext context) =>
      context.read<InvestigationViewModel>();
  static InvestigationViewModel watch(BuildContext context) =>
      context.watch<InvestigationViewModel>();
  bool shouldShowInReport;
  List<FavouriteItemModel> favouriteList = [];
  List searchItemList = [];
  List investigationList = [];

  Future<void> getData() async {
    var res = await CommonFavouriteListRepository().fetchFavouriteList();
    favouriteList = res.items;
    notifyListeners();
    return;
  }
}
