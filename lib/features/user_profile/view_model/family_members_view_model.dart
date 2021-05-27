// import 'package:flutter/cupertino.dart';
// import 'package:myhealthbd_app/features/appointments/models/available_slots_model.dart';
// import 'package:myhealthbd_app/features/appointments/repositories/available_slots_repository.dart';
// import 'package:myhealthbd_app/features/find_doctor/models/doctors_list_model.dart';
// import 'package:myhealthbd_app/features/find_doctor/repositories/doctor_list_repository.dart';
// import 'package:myhealthbd_app/main_app/failure/app_error.dart';
//
// class AvailableSlotsViewModel extends ChangeNotifier{
//   List<Items> _slots =[];
//   AppError _appError;
//   DateTime _lastFetchTime;
//   bool _isFetchingMoreData = false;
//   bool _isFetchingData = false;
//
//
//   Future<void> getSlots(DateTime pickedAppointDate, String companyNo, String doctorNo, String orgNo) async {
//     var res = await AvailableSlotsRepository().fetchSpecializationList(pickedAppointDate, companyNo, doctorNo, orgNo);
//     notifyListeners();
//     _slots.clear();
//     res.fold((l) {
//       _appError = l;
//       _isFetchingMoreData = false;
//       notifyListeners();
//     }, (r) {
//       _isFetchingMoreData = false;
//       _slots.addAll(r.slotList);
//       notifyListeners();
//     });
//   }
//
//
//   AppError get appError => _appError;
//
//   bool get isFetchingData => _isFetchingData;
//
//   bool get isFetchingMoreData => _isFetchingMoreData;
//
//
//   bool get shouldShowPageLoader =>
//       _isFetchingData && _slots.length == 0;
//
//   List<Items> get slotList => _slots;
//
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myhealthbd_app/features/user_profile/models/get_family_member_model.dart';
import 'package:myhealthbd_app/features/user_profile/repositories/add_family_member_repository.dart';
import 'package:myhealthbd_app/features/user_profile/repositories/family_members_list_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class FamilyMembersListViewModel extends ChangeNotifier {
  List<Item> _familyMembersList=[];
  bool _isLoading= false;
  String slot;
  AppError _appError;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  String _name;
  String _userId;
  String _image;
  String _relationName;
  String _id;
  String _regId;
  String _relationId;
  String _deleteMessage;
  String _updateMessage;
  String _saveMessage;


  userRegId(String regId){
 _regId=regId;
 notifyListeners();
  }
  getSelectedUserImage({String regId,String id, String name, String userId, String image, String relationName, String relationId}){
    _regId=regId;
    _id= id;
    _image=image;
    _name=name;
    _userId=userId;
    _relationName=relationName;
    _relationId= relationId;
    notifyListeners();
  }
  Future<void> deleteMember() async {
    //print("regIddddd : $regId");
    _isLoading = true;
    var res = await FamilyMembersList().deleteMember(_id);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {

      _deleteMessage= r.message;
      familyMembers(_regId);
      _isFetchingMoreData = false;
      _isLoading = false;
      notifyListeners();
    });
  }
  Future<void> updateMember(String relationId) async {
    //print("regIddddd : $regId");
    _isLoading = true;
    var res = await FamilyMembersList().updateMember(_id, relationId);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _updateMessage= r.message;
      //_familyMembersList=r.items;
      familyMembers(_regId);
      _isFetchingMoreData = false;
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> addFamilyMember(String regId, String regNo,
      String relation, String relatedRegNo) async {
    _isLoading = true;
    print("regId: $regId");
    print("regNo: $regNo");
    print("relation: $relation");
    print("related:$relatedRegNo");
    var res = await AddFamilyMemberRepository().addFamilyMember(regId, regNo, relation, relatedRegNo);
    notifyListeners();
    res.fold((l) {
      Fluttertoast.showToast(
          msg: "Something went wrong!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      familyMembers(_regId);
      _saveMessage= r.message;
      _isFetchingMoreData = false;
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> familyMembers(String regId) async {
    print("regIddddd : $regId");
    _isLoading = true;
    var res = await FamilyMembersList().fetchFamilyMembersList(regId);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {

      _familyMembersList=r.items;
      print("itemsssssssssssssssssssss: $_familyMembersList");
      _isFetchingMoreData = false;
      _isLoading = false;
      notifyListeners();
    });
  }



  AppError get appError => _appError;

  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;
  List<Item> get familyMembersList => _familyMembersList;

  bool get isLoading => _isLoading;
String get image => _image;
String get name=> _name;
String get userId => _userId;
String get relationName => _relationName;
String get id => _id;
String get relationId => _relationId;
String get deleteMessage=> _deleteMessage;
String get updateMessage => _updateMessage;
String get saveMessage => _saveMessage;

}
