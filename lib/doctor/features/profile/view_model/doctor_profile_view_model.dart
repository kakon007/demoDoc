import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myhealthbd_app/features/cache/cache_repositories.dart';
import 'package:myhealthbd_app/features/user_profile/models/get_family_member_model.dart';
import 'package:myhealthbd_app/features/user_profile/repositories/add_family_member_repository.dart';
import 'package:myhealthbd_app/features/user_profile/repositories/family_members_list_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class DoctorProfileViewModel extends ChangeNotifier {
    bool _isDoctorInfoEditing=false;
    bool _isPersonalInfoEditing=false;
    List _filteredList = [];
    editingDoctorInfo({bool isDoctorInfoEditing}) {
    _isDoctorInfoEditing =isDoctorInfoEditing;
    notifyListeners();
    }
    editingPersonalInfo({bool isPersonalInfoEditing}) {
        _isPersonalInfoEditing = isPersonalInfoEditing;
        notifyListeners();
    }
    void filterInfo({List filteredList}) {
        _filteredList = filteredList;
        notifyListeners();
    }
    bool get isDoctorInfoEditing => _isDoctorInfoEditing;
    bool get isPersonalInfoEditing => _isPersonalInfoEditing;
    List get filteredList => _filteredList;
}
