
import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/find_doctor/repositories/doctor_list_repository.dart';
import 'package:myhealthbd_app/features/user_profile/models/registered_members_model.dart';
import 'package:myhealthbd_app/features/user_profile/repositories/registered_member_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class RegisteredMemberViewModel extends ChangeNotifier{
  AppError _appError;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  bool _isLoading = false;
  bool _hasMoreData = false;
  List<Item> _members =[];
  String _message;
  String _regId;
  String  _regNo;
  String _relatedRegNo;
  String _name;
  String _image;
  var count = 0;
  get logger => null;
  int limit=10;
  int startIndex=0;


  addFamilyMemberInfo({
    String regId,
    String regNo,
    String relatedRegNo,
    String name,
    String image,
  }){
    print("regId $regId");
    print("regNo $regNo");
    print("relatedRegId $relatedRegNo");
    _regId= regId;
    _regNo=regNo;
    _relatedRegNo= relatedRegNo;
    _name= name;
    _image= image;
  }

  Future<void> getMembers(String regId, String patName) async {
    _isLoading=true;
    var res = await RegisteredMembersRepository().fetchMembers(regId, patName);
    notifyListeners();
    //  _doctor.clear();
    res.fold((l) {
      _isLoading= false;
      _appError = l;
      _isFetchingData = false;
      notifyListeners();
      return false;
    }, (r) {
      _isLoading= false;
      _isFetchingData = false;
      _message=r.message;
      _members= r.items;
      notifyListeners();
      return true;
    });
  }

  AppError get appError => _appError;
  bool get isFetchingData => _isFetchingData;
  bool get isFetchingMoreData => _isFetchingMoreData;

  set isFetchingMoreData(bool value) {
    _isFetchingMoreData = value;
    notifyListeners();
  }


  bool get hasMoreData => _hasMoreData;

  set hasMoreData(bool value) {
    _hasMoreData = value;
    notifyListeners();
  }
  bool get isLoading =>_isLoading;
  List<Item> get members => _members;
  String get message => _message;
  String get regId => _regId;
  String get regNo => _regNo;
  String get relatedRegNo =>_relatedRegNo;
  String get name =>_name;
  String get image => _image;

}