import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/doctor/features/worklist/models/worklist_model.dart';
import 'package:myhealthbd_app/doctor/features/worklist/repositories/worklist_repository.dart';
import 'package:myhealthbd_app/features/appointments/models/available_slots_model.dart';
import 'package:myhealthbd_app/features/appointments/models/consultation_type_model.dart';
import 'package:myhealthbd_app/features/appointments/models/patient_type_model.dart';
import 'package:myhealthbd_app/features/appointments/repositories/book_appointment_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class WorkListViewModel extends ChangeNotifier {
  bool _isLoading = true;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  AppError _appError;
  WorkListModel _workListData;

  Future<void> getWorkListData({String fromDate, String toDate}) async {

    var res = await WorkListRepository().fetchWorkListData(fromDate: fromDate,toDate: toDate);
    _isLoading =true;
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _isLoading = false;
      _workListData= r;
      notifyListeners();
    });
  }

  AppError get appError => _appError;

  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;

  bool get isLoading => _isLoading;

  WorkListModel get workListData => _workListData;

}
