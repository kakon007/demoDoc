import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/auth/repositories/term_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class TermsViewModel extends ChangeNotifier {
  var _hospitalList;

  AppError _appError;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  int _page = 1;
  bool _isLoading;

  Future<void> refresh() {
    _page = 0;
    _hospitalList.clear();
    return getData();
  }

  Future<void> getData() async {
    _isFetchingData = true;
    _isLoading = true;
    var res = await TermsRepositry().fetchTerms();
    print('Nesrestcallllk');
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isLoading = false;
      _isFetchingMoreData = false;
      _hospitalList = r.dataList;
      notifyListeners();
    });
  }

  AppError get appError => _appError;

  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;

  bool get isLoading => _isLoading;

  String get terms => _hospitalList;
}
