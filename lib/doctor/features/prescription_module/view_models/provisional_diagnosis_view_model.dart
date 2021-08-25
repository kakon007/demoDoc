import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/favourite_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/chirf_complaint_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/provisional_diagnosis_repository.dart';
import 'package:provider/provider.dart';

class ProvisionalDiagnosisViewModel extends ChangeNotifier {
  static ProvisionalDiagnosisViewModel read(BuildContext context) =>
      context.read<ProvisionalDiagnosisViewModel>();
  static ProvisionalDiagnosisViewModel watch(BuildContext context) =>
      context.watch<ProvisionalDiagnosisViewModel>();
  bool shouldShowInReport;
  List<FavouriteItemModel> favouriteList = [];
  List searchItemList = [];
  List provisionalDiagnosisList = [];

  Future<void> getData() async {
    var res = await ProvisionalDiagnosisRepository().fetchFavouriteList();
    favouriteList = res.items;
    notifyListeners();
    return;
  }
}
