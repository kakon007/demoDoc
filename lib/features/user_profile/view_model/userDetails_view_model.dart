
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/user_profile/models/userDetails_model.dart';
import 'package:myhealthbd_app/features/user_profile/repositories/userdetails_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';
import 'package:myhealthbd_app/main_app/util/common_serviec_rule.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
class UserDetailsViewModel extends ChangeNotifier{
  Obj _userDetailsList;
  Obj _patDetails;
  Obj _userSwitchDetailsList;
  String _message;
  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  int _page = 1;

  Future<void> updateProfile(String userId, String name, String email, String number,String address, String birthDate,String gender, String blood, String hospitalNumber, String regDate) async {
    if(gender=="Male"){
      gender="M";
    }
    if(gender=="Female"){
      gender="F";
    }
    DateTime tempDate =  DateFormat("yyyy-MM-dd").parse(regDate);
    String registrationDate = DateFormat("yyyy-MM-dd").format(tempDate);
    var headers = {
      'Authorization': 'Bearer ${Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken}'
    };
    var request = http.MultipartRequest('PUT', Uri.parse('${Urls.buildUrl}diagnostic-api/api/opd-registration/update-with-image'));
    request.fields.addAll({
      'reqobj':  json.encode({"opdReg":{"id":userId,"fname":name,"dob":birthDate,"gender":gender,"phoneMobile":number,"email":email,"address":address,"bloodGroup":blood,"hospitalNumber":hospitalNumber,"regDate":registrationDate,"organizationNo":1}})
    });
   request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    try{
      if (response.statusCode == 200) {
        var res= await response.stream.bytesToString();
        UserDetailsModel data = userDetailsModelFromJson(res);
        _userDetailsList= data.obj;
        _message= data.message;
        notifyListeners();
      }
      else {
        print(response.reasonPhrase);
      }
    }catch(e){
      // Fluttertoast.showToast(
      //     msg: "Check Network Connection!!",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 12.0);
    }


  }
  Future<void> getPatData(String hospitalNumber) async {
    _isFetchingData = true;
    _lastFetchTime = DateTime.now();
    var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
    var res = await UserDetailsRepository().fetchPatInfo(accessToken,hospitalNumber);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _patDetails=r.dataList;
      notifyListeners();
    });
  }
  Future<void> getData() async {
    _isFetchingData = true;
    _lastFetchTime = DateTime.now();
    var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
    var res = await UserDetailsRepository().fetchUserDetails(accessToken);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _userDetailsList=r.dataList;
      notifyListeners();
    });
  }
  Future<void> getSwitchData(var accessToken) async {
    _isFetchingData = true;
    //var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
    var res = await UserDetailsRepository().fetchUserDetails(accessToken);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _isFetchingMoreData = false;
      _userSwitchDetailsList=r.dataList;
      notifyListeners();
    });
  }
  AppError get appError => _appError;


  bool get shouldShowAppError => _appError != null && _userDetailsList== null;
  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;
  bool get shouldShowNoNewsFound => _userDetailsList== null && !isFetchingData;

  bool get shouldShowPageLoader =>
      _isFetchingData && _userDetailsList == null;
  String get message => _message;

  Obj get userDetailsList => _userDetailsList;
  Obj get userSwitchDetailsList => _userSwitchDetailsList;
  Obj get patDetails => _patDetails;
}