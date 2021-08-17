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
  List<Datum> _workListData = [];
  List<Datum> _waitingWorkListData = [];
  List<Datum> _completedListData = [];
  var start = 0;
  int _totalRecords=0;

  Future<void> getWorkListData(
      {String fromDate, String toDate, String searchValue}) async {
    _isFetchingMoreData = true;
    print(start);
    start = 0;
    var res = await WorkListRepository().fetchWorkListData(
        fromDate: fromDate,
        toDate: toDate,
        start: start.toString(),
        searchValue: searchValue);
    _isLoading = true;
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
      _waitingWorkListData.clear();
      _completedListData.clear();
      _workListData.clear();
      _workListData = r.obj.data;
      _totalRecords = int.parse(r.obj.recordsTotal);
      print("_totalRecords $_totalRecords");
      r.obj.data.forEach((item) {
        if (item.consultationOut.toString().contains('0')) {
          _waitingWorkListData.add(item);
          print('aaa ${_waitingWorkListData.length}');
        } else {
          _completedListData.add(item);
          print('aaa ${_waitingWorkListData.length}');
        }
      });
      // _workListData= r.obj.data;
      notifyListeners();
    });
  }

  getMoreWorkListData(
      {String fromDate, String toDate, String searchValue}) async {
    _isFetchingMoreData = true;
    notifyListeners();
    start = start + 10;
    print("222 $start");
    var res = await WorkListRepository().fetchWorkListData(
        fromDate: fromDate,
        toDate: toDate,
        start: start.toString(),
        searchValue: searchValue);
    _isLoading = true;
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
      _workListData.addAll(r.obj.data);
      r.obj.data.forEach((item) {
        if (item.consultationOut.toString().contains('0')) {
          _waitingWorkListData.add(item);
          print('aaa ${_waitingWorkListData.length}');
        } else {
          _completedListData.add(item);
          print('aaa ${_waitingWorkListData.length}');
        }
      });
      notifyListeners();
    });
  }

  AppError get appError => _appError;

  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;

  bool get isLoading => _isLoading;

  List<Datum> get workListData => _workListData;

  List<Datum> get completedData => _completedListData;

  List<Datum> get waitingData => _waitingWorkListData;

  int get totalRecords => _totalRecords;
}
