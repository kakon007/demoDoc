import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/doctor/features/worklist/models/worklist_model.dart';
import 'package:myhealthbd_app/doctor/features/worklist/repositories/worklist_repository.dart';
import 'package:myhealthbd_app/features/appointments/models/available_slots_model.dart';
import 'package:myhealthbd_app/features/appointments/models/consultation_type_model.dart';
import 'package:myhealthbd_app/features/appointments/models/patient_type_model.dart';
import 'package:myhealthbd_app/features/appointments/repositories/book_appointment_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class WorkListViewModel extends ChangeNotifier {
  bool _isLoading = true;
  bool _isLoadingWorkList = true;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  var freshTotal;
  var reportCheck;
  var followUpTotal;
  var totalPatientConsult;
  AppError _appError;
  List<Datum> _workListData = [];
  List<Datum> _waitingWorkListData = [];
  List<Datum> _completedListData = [];
  List<Datum> _todayWorkList = [];
  List _filteredItems = [];
  var start = 0;
  int _totalRecords = 0;
  String _shift;

  Future<void> getWorkListData(
      {String fromDate,
      String toDate,
      String searchValue,
      String shift}) async {
    _isFetchingMoreData = true;
    print(start);
    start = 0;
    var res = await WorkListRepository().fetchWorkListData(
        fromDate: fromDate,
        toDate: toDate,
        start: start.toString(),
        searchValue: searchValue,
        shift: shift);
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
      {String fromDate,
      String toDate,
      String searchValue,
      String shift}) async {
    _isFetchingMoreData = true;
    notifyListeners();
    start = start + 10;
    print("222 $start");
    var res = await WorkListRepository().fetchWorkListData(
        fromDate: fromDate,
        toDate: toDate,
        start: start.toString(),
        searchValue: searchValue,
        shift: shift);
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

  Future<void> getTodaysWorklist() async {
    start = 0;
    var res = await WorkListRepository().fetchWorkListData(
      //fromDate: '18-Jul-2021',
      //toDate: '12-Aug-2021',
      fromDate: DateFormat("dd-MMM-yyyy").format(DateTime.now()),
      toDate: DateFormat("dd-MMM-yyyy").format(DateTime.now()),
      //DateFormat("dd-MMM-yyyy").format(DateTime.now())
      start: start.toString(),
    );
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoadingWorkList = false;
      notifyListeners();
    }, (r) {
      _isLoadingWorkList = false;
      _isLoading = false;
      _todayWorkList = r.obj.data;
      // _workListData= r.obj.data;
      notifyListeners();
    });
  }

  getFilteredList({List items}) {
    _filteredItems = items;
    notifyListeners();
  }

  getShiftData({String shift}) {
    _shift = shift;
    // notifyListeners();
  }

  Future<void> getFollowUpTotal(
      {String fromDate,
      String toDate,
      String searchValue,
      String shift}) async {
    _isFetchingMoreData = true;
    print(start);
    start = 0;
    var res = await WorkListRepository().fetchWorkListData(
        fromDate: fromDate,
        isFiltered: true,
        filterValue: "1ST FOLLOW UP",
        toDate: toDate,
        start: start.toString(),
        searchValue: searchValue,
        shift: shift);
    _isLoading = true;
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      followUpTotal = r.obj.recordsTotal;
      // _workListData= r.obj.data;
      notifyListeners();
    });
  }

  Future<void> getReportCheckTotal(
      {String fromDate,
      String toDate,
      String searchValue,
      String shift}) async {
    _isFetchingMoreData = true;
    print(start);
    start = 0;
    var res = await WorkListRepository().fetchWorkListData(
        fromDate: fromDate,
        isFiltered: true,
        filterValue: "REPORT CHECK",
        toDate: toDate,
        start: start.toString(),
        searchValue: searchValue,
        shift: shift);
    _isLoading = true;
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      reportCheck = r.obj.recordsTotal;
      // _workListData= r.obj.data;
      notifyListeners();
    });
  }

  Future<void> getFreshVisitTotal(
      {String fromDate,
      String toDate,
      String searchValue,
      String shift}) async {
    _isFetchingMoreData = true;
    print(start);
    start = 0;
    var res = await WorkListRepository().fetchWorkListData(
        fromDate: fromDate,
        isFiltered: true,
        filterValue: "New Patient",
        toDate: toDate,
        start: start.toString(),
        searchValue: searchValue,
        shift: shift);
    _isLoading = true;
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      freshTotal = r.obj.recordsTotal;
      // _workListData= r.obj.data;
      notifyListeners();
    });
  }

  Future<void> getPatientConsultTotal(
      {String fromDate,
      String toDate,
      String searchValue,
      String shift}) async {
    _isFetchingMoreData = true;
    print(start);
    start = 0;
    var res = await WorkListRepository().fetchWorkListData(
        fromDate: fromDate,
        isFiltered: true,
        toDate: toDate,
        start: start.toString(),
        searchValue: searchValue,
        shift: shift);
    _isLoading = true;
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      _isLoading = false;
      notifyListeners();
    }, (r) {
      freshTotal = r.obj.recordsTotal;
      // _workListData= r.obj.data;
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

  List<Datum> get todayWorkList => _todayWorkList;

  int get totalRecords => _totalRecords;

  List get filteredItems => _filteredItems;

  String get shift => _shift;
}
