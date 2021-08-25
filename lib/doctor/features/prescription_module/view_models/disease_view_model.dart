import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/favourite_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/common_favourite_list_repository.dart';
import 'package:provider/provider.dart';

class DiseaseViewModel extends ChangeNotifier {
  static DiseaseViewModel read(BuildContext context) =>
      context.read<DiseaseViewModel>();
  static DiseaseViewModel watch(BuildContext context) =>
      context.watch<DiseaseViewModel>();
  bool shouldShowInReport;
  List<FavouriteItemModel> favouriteList = [];
  List searchItemList = [];
  List diseaseList = [];

  Future<void> getData() async {
    var res = await CommonFavouriteListRepository().fetchFavouriteList();
    favouriteList = res.items;
    notifyListeners();
    return;
  }
}
