import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/book_test/model/test_item_model.dart';
import 'package:myhealthbd_app/features/book_test/repository/test_item_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/util/common_serviec_rule.dart';

class TestItemViewModel extends ChangeNotifier {
  List<TestItem> _testItemList = [];

  AppError _appError;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  int _page = 0;

  Future<void> refresh() {
    _testItemList.clear();
    return getData();
  }

  Future<void> getData() async {
    print("lllllllllllllllllllllllllllll");
    _isFetchingData = true;

    var res = await TestItemListRepository().fetchTestListDataData();
    print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
    notifyListeners();
    _testItemList.clear();
    res.fold((l) {
      _appError = l;
      _isFetchingData = false;
      print('left');
      notifyListeners();
    }, (r) {
      _isFetchingData = false;
      _testItemList.addAll(r.items);
      print('right');
      notifyListeners();
    });
  }

  AppError get appError => _appError;

  bool get shouldShowAppError => _appError != null && _testItemList.length == 0;

  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;

  bool get shouldShowNoNewsFound =>
      _testItemList.length == 0 && !isFetchingData;

  bool get shouldShowPageLoader => _isFetchingData && _testItemList.length == 0;

  List<TestItem> get testItemList => _testItemList;
}
