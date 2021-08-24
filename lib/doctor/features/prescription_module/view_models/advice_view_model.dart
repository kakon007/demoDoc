import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/favourite_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/advice_repository.dart';
import 'package:provider/provider.dart';

class AdviceViewModel extends ChangeNotifier {
  static AdviceViewModel read(BuildContext context) =>
      context.read<AdviceViewModel>();
  static AdviceViewModel watch(BuildContext context) =>
      context.watch<AdviceViewModel>();
  bool shouldShowInReport;
  List<FavouriteItemModel> favouriteList = [];
  List searchItemList = [];
  List chiefComplaintList = [];

  Future<void> getData() async {
    var res = await AdviceRepository().fetchFavouriteList();
    favouriteList = res.items;
    notifyListeners();
    return;
  }
}
