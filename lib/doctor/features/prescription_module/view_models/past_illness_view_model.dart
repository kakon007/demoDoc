import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/favourite_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/chirf_complaint_repository.dart';
import 'package:myhealthbd_app/doctor/main_app/prescription_favourite_type.dart';
import 'package:provider/provider.dart';

class PastIllnessViewModel extends ChangeNotifier {
  static PastIllnessViewModel read(BuildContext context) =>
      context.read<PastIllnessViewModel>();
  static PastIllnessViewModel watch(BuildContext context) =>
      context.watch<PastIllnessViewModel>();
  bool shouldShowInReport;
  List<FavouriteItemModel> favouriteList = [];
  List searchItemList = [];
  List chiefComplaintList = [];

  Future<void> getData() async {
    var res = await ChiefComplaintsRepository().fetchFavouriteList(favouriteType: PrescriptionFavouriteType.pastIllness.toString());
    favouriteList = res.items;
    notifyListeners();
    return;
  }
}
