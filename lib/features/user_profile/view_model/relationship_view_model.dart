
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/cache/cache_repositories.dart';
import 'package:myhealthbd_app/features/user_profile/models/relationship_model.dart';
import 'package:myhealthbd_app/features/user_profile/models/userDetails_model.dart';
import 'package:myhealthbd_app/features/user_profile/repositories/relationship_repository.dart';
import 'package:myhealthbd_app/features/user_profile/repositories/userdetails_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/util/common_serviec_rule.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
class RelationShipViewModel extends ChangeNotifier{

  AppError _appError;
  List<Item> _relations=[];
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;



  Future<void> getRelationShip() async {
    CacheRepositories.loadCachedFamilyMemberRelationList().then((value) {
      if(value!=null){
        _relations=value.items;
      }
    });
    _isFetchingData = true;
    var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
    var res = await RelationshipRepository().fetchRelationship(accessToken);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingMoreData = false;
      notifyListeners();
    }, (r) {
      _relations=r.items;
      _isFetchingMoreData = false;
      notifyListeners();
    });
  }
  AppError get appError => _appError;
  List<Item> get relations => _relations;

}