import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myhealthbd_app/features/user_profile/models/get_family_member_model.dart';
import 'package:myhealthbd_app/features/user_profile/repositories/add_family_member_repository.dart';
import 'package:myhealthbd_app/features/user_profile/repositories/family_members_list_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class FamilyMembersListViewModel extends ChangeNotifier {
  List<Item> _familyMembersList = [];
  bool _isLoading = false;
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
  bool _isSelected = false;
  String _familyMemName = '';
  String _familyMemEmail = '';
  String _familyMemMobile = '';
  String _familyMemAddress = '';
  String _familyMemGender = '';
  String _familyMemDob = '';
  String _familyMemRegNo = '';
  String _imageMem = '';
  String _relation = '';
  int _selectedCard=-1;

  memberDetail(
    int selectedCard,
    bool isSelected,
    String familyMemName,
    String familyMemEmail,
    String familyMemMobile,
    String familyMemAddress,
    String familyMemGender,
    String familyMemDob,
    String familyMemRegNo,
    String imageMem,
    String relation,
  ) {
    _selectedCard=selectedCard;
    _isSelected = isSelected;
    _familyMemName = familyMemName;
    _familyMemEmail = familyMemEmail;
    _familyMemMobile = familyMemMobile;
    _familyMemAddress = familyMemAddress;
    _familyMemGender = familyMemGender;
    _familyMemDob = familyMemDob;
    _familyMemRegNo = familyMemRegNo;
    _imageMem = imageMem;
    _relation = relation;
  }

  userRegId(String regId) {
    _regId = regId;
    notifyListeners();
  }

  getSelectedUserImage(
      {String regId,
      String id,
      String name,
      String userId,
      String image,
      String relationName,
      String relationId}) {
    _regId = regId;
    _id = id;
    _image = image;
    _name = name;
    _userId = userId;
    _relationName = relationName;
    _relationId = relationId;
    notifyListeners();
  }

  Future<void> deleteMember() async {
    _isLoading = true;
    var res = await FamilyMembersList().deleteMember(_id);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _deleteMessage = r.message;
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
      _updateMessage = r.message;
      //_familyMembersList=r.items;
      familyMembers(_regId);
      _isFetchingMoreData = false;
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> addFamilyMember(
      String regId, String regNo, String relation, String relatedRegNo) async {
    _isLoading = true;
    var res = await AddFamilyMemberRepository()
        .addFamilyMember(regId, regNo, relation, relatedRegNo);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      familyMembers(_regId);
      _saveMessage = r.message;
      _isFetchingMoreData = false;
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> familyMembers(String regId) async {
    var res = await FamilyMembersList().fetchFamilyMembersList(regId);
    notifyListeners();
    _isLoading = true;
    _familyMembersList.clear();
    res.fold((l) {
      _appError = l;
      _isLoading = false;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _familyMembersList.addAll(r.items);
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

  String get name => _name;

  String get userId => _userId;

  String get relationName => _relationName;

  String get id => _id;

  String get relationId => _relationId;

  String get deleteMessage => _deleteMessage;

  String get updateMessage => _updateMessage;

  String get saveMessage => _saveMessage;

  bool get isSelected => _isSelected;

  String get familyMemName => _familyMemName;

  String get familyMemEmail => _familyMemEmail;

  String get familyMemMobile => _familyMemMobile;

  String get familyMemAddress => _familyMemAddress;

  String get familyMemGender => _familyMemGender;

  String get familyMemDob => _familyMemDob;

  String get familyMemRegNo => _familyMemRegNo;

  String get imageMem => _imageMem;

  String get relation => _relation;

  int get selectedCard => _selectedCard;
}
