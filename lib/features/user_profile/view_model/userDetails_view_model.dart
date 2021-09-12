import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/book_test/view_model/order_confirm_view_model.dart';
import 'package:myhealthbd_app/features/cache/cache_repositories.dart';
import 'package:myhealthbd_app/features/user_profile/models/userDetails_model.dart';
import 'package:myhealthbd_app/features/user_profile/repositories/userdetails_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';
import 'package:provider/provider.dart';

class UserDetailsViewModel extends ChangeNotifier {
  Obj _userDetailsList;
  Obj _userDetailsList2;
  Obj _patDetails;
  Obj _userSwitchDetailsList;
  String _message;
  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  int _page = 1;

  Future<void> updateProfile(
      String userId,
      String name,
      String email,
      String number,
      String address,
      String birthDate,
      String gender,
      String blood,
      String hospitalNumber,
      String regDate) async {
    if (gender == "Male") {
      gender = "M";
    }
    if (gender == "Female") {
      gender = "F";
    }
    DateTime tempDate = DateFormat("yyyy-MM-dd").parse(regDate);
    String registrationDate = DateFormat("yyyy-MM-dd").format(tempDate);
    var headers = {
      'Authorization':
          'Bearer ${Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken}'
    };
    var request = http.MultipartRequest(
        'PUT',
        Uri.parse(
            '${Urls.baseUrl}diagnostic-api/api/opd-registration/update-with-image'));
    request.fields.addAll({
      'reqobj': json.encode({
        "opdReg": {
          "id": userId,
          "fname": name,
          "dob": birthDate,
          "gender": gender,
          "phoneMobile": number,
          "email": email,
          "address": address,
          "bloodGroup": blood,
          "hospitalNumber": hospitalNumber,
          "regDate": registrationDate,
          "organizationNo": 1
        }
      })
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    try {
      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        UserDetailsModel data = userDetailsModelFromJson(res);
        _userDetailsList = data.obj;
        _message = data.message;
        notifyListeners();
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {}
  }

  Future<void> getPatData(String hospitalNumber) async {
    CacheRepositories.loadCachedUserDetails().then((value) {
      if (value != null) {
        // _userDetailsList = value.obj;
        notifyListeners();
      }
    });
    _isFetchingData = true;
    _lastFetchTime = DateTime.now();
    var accessToken = await Provider.of<AccessTokenProvider>(
            appNavigator.context,
            listen: false)
        .getToken();
    var res =
        await UserDetailsRepository().fetchPatInfo(accessToken, hospitalNumber);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _patDetails = r.dataList;
      notifyListeners();
    });
  }

  Future<void> getData() async {
    _isFetchingData = true;
    _lastFetchTime = DateTime.now();
    var accessToken = await Provider.of<AccessTokenProvider>(
            appNavigator.context,
            listen: false)
        .getToken();
    var res = await UserDetailsRepository().fetchUserDetails(accessToken);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _userDetailsList = r.dataList;

      notifyListeners();
    });
  }

  Future<void> getSwitchData(var accessToken) async {
    _isFetchingData = true;
    var res = await UserDetailsRepository().fetchUserDetails(accessToken);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _userSwitchDetailsList = r.dataList;
      notifyListeners();
    });
  }

  Future<void> getData2(String accessToken) async {
    _isFetchingData = true;
    _lastFetchTime = DateTime.now();
    var res = await UserDetailsRepository().fetchUserDetails2(accessToken);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _userDetailsList2 = r.dataList;
      var cartVM = Provider.of<OrderConfirmViewModel>(appNavigator.context,
          listen: false);
      cartVM.fathersName.text = r.dataList.fatherName ?? "";
      cartVM.mothersName.text = r.dataList.motherName ?? "";
      cartVM.lastNameController.text = r.dataList.lname ?? "";
      cartVM.firstNameController.text = r.dataList.fname ?? "";
      cartVM.mobileNumberController.text = r.dataList.phoneMobile ?? "";
      cartVM.emailController.text = r.dataList.email ?? "";
      cartVM.nidController.text = r.dataList.nationalId ?? "";
      cartVM.passportController.text = r.dataList.passportNo ?? "";
      cartVM.addressController.text = r.dataList.address ?? "";
      cartVM.dayController.text = r.dataList.ageDd.toString() ?? "";
      cartVM.monthController.text = r.dataList.ageMm.toString() ?? "";
      cartVM.yearController.text = r.dataList.ageYy.toString() ?? "";
      cartVM.selectedDob = DateTime.parse(r.dataList.dob) ?? "";
      notifyListeners();
    });
  }

  AppError get appError => _appError;

  bool get shouldShowAppError => _appError != null && _userDetailsList == null;

  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;

  bool get shouldShowNoNewsFound => _userDetailsList == null && !isFetchingData;

  bool get shouldShowPageLoader => _isFetchingData && _userDetailsList == null;

  String get message => _message;

  Obj get userDetailsList => _userDetailsList;

  Obj get userDetailsList2 => _userDetailsList2;

  Obj get userSwitchDetailsList => _userSwitchDetailsList;

  Obj get patDetails => _patDetails;
}
