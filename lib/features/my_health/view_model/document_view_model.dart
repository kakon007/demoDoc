import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/my_health/repositories/document_repository.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:provider/provider.dart';
import 'package:myhealthbd_app/features/my_health/models/documents_list_model.dart';
import 'package:http/http.dart' as http;

class DocumentViewModel extends ChangeNotifier{
  List<Item> _documentList =[];
  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  int _pageCount = 0;
  bool _hasMoreData = false;
  String searchQuery = '';
  bool _isInSearchMode = false;
  var count = 0;
  get logger => null;
  int limit=10;
  int startIndex=0;
  String _accessToken;
  int _id;
  String _filed;


  void resetPageCounter() {
    _pageCount = 1;
  }

  int get totalCount => count;

  set totalCount(int value) {
    count = value;
    notifyListeners();
  }

  bool get isFetchingMoreData => _isFetchingMoreData;

  set isFetchingMoreData(bool value) {
    _isFetchingMoreData = value;
    notifyListeners();
  }

  Future<bool> getDataforDoc() async {
    startIndex=0;
    _pageCount++;
    _isFetchingData = true;
    _lastFetchTime = DateTime.now();
    var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
    var vm = Provider.of<UserDetailsViewModel>(appNavigator.context,listen: false);
    var res = await DocumentRepository().fetchDocumentsList(accessToken: accessToken,page: _pageCount,query: searchQuery,username: vm.userDetailsList.hospitalNumber,startIndex: startIndex);
    notifyListeners();
    _documentList.clear();
    res.fold((l) {
      _appError = l;
      _isFetchingData = false;
      print('DataaaaaaafromDocumenterror:: ' );
      notifyListeners();
      return false;
    }, (r) {
      hasMoreData = r.totalCount-1>startIndex;
      _isFetchingData = false;
      _documentList.addAll(r.dataListOfDocuments);
      count = r.totalCount;
      print('DataaaaaaafromDocument:: ' + _documentList.length.toString());
      notifyListeners();
      return true;
    });
  }


  // Future<void> uploadDocuments({File file,String accessToken,int attachmentTypeNo,String description,int regID,String username,DateTime pickBirthDate}) async {
  //   var headers = {
  //     'Authorization': 'Bearer 43deaf1a-0ff8-459f-80b1-c66b37a1e73c'
  //   };
  //   var request = http.MultipartRequest('POST', Uri.parse('https://qa.myhealthbd.com:9096/diagnostic-api/api/file-attachment/create'));
  //   request.fields.addAll({
  //     'reqobj': json.encode({"activeStatus":1,"attachmentTypeNo":"105","reportDate":"2021-05-01T12:11:27.000Z","description":"Test","referenceNo":2200000086431,"attachmentName":"bill.pdf","type":2,"regId":"MH22012014368"})
  //   });
  //   request.files.add(await http.MultipartFile.fromPath('file', file.path));
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //
  //
  //   print("Stataaaaa:::: ${response.statusCode}");
  //   try {
  //     if (response.statusCode == 200) {
  //       var res=await response.stream.bytesToString();
  //       DocumentListModel data = documentListModelFromJson(res) ;
  //       _documentList=data.items;
  //       notifyListeners();
  //       //print(await response.stream.bytesToString());
  //       Fluttertoast.showToast(
  //           msg: "Document Upload successfully!",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           backgroundColor: Colors.green,
  //           textColor: Colors.white,
  //           fontSize: 12.0);
  //
  //       //return body;
  //     } else {
  //       print(response.reasonPhrase);
  //     }
  //   }
  //   catch (e) {
  //     Fluttertoast.showToast(
  //         msg: "Something went wrong!!",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 12.0);
  //   }
  // }

  Future<void> editDocument({String fileName}) async {
    var headers = {
      'Authorization': 'Bearer $_accessToken'
    };
    print('idddddddeeeeee:: $_accessToken');
    var request = http.MultipartRequest('POST', Uri.parse('https://qa.myhealthbd.com:9096/diagnostic-api/api/file-attachment/edit'));
    request.fields.addAll({
      'reqobj':json.encode({"id":_id,"attachmentName":"$fileName"})
    });


    print('iddffrr $_id');
    print('iddffrr $fileName');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print("Stataaaaa44444:::: ${response.statusCode}");
    try {
      if (response.statusCode == 200) {
        getDataforDoc();
        //var body=await response.stream.bytesToString();
        print("BodyfromDoc4444::"+await response.stream.bytesToString());
        Fluttertoast.showToast(
            msg: "Document Upload successfully!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 12.0);
        notifyListeners();
        //return body;
      } else {
        print(await response.stream.bytesToString());
        print(response.reasonPhrase);
      }
    }
    catch (e) {
      Fluttertoast.showToast(
          msg: "Something went wrong!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12.0);
    }
  }

  getData(
      {String accessToken,int id,String fileName}
      ){
    _accessToken=accessToken;
    print('idddddddeeeee:: $_accessToken');
    _id=id;
    print('iddddddd:: $_id');
    _filed=fileName;
    notifyListeners();
  }


  String get accessToken=>_accessToken;
  int get id=>_id;
  String get fileName=>_filed;

  getMoreData(String accessToken) async {
    print("Calling from getMoreData:::::");
    print("HasMoreData ${hasMoreData}");
    print("fetch ${isFetchingMoreData}");
    print("fetched ${isFetchingData}");
    if (!isFetchingMoreData && !isFetchingData && hasMoreData) {
      startIndex+=limit;
      _pageCount++;
      isFetchingMoreData = true;
      //var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
      var vm = Provider.of<UserDetailsViewModel>(appNavigator.context,listen: false);
      var res = await DocumentRepository().fetchDocumentsList(accessToken: accessToken,page: _pageCount,query: searchQuery,username: vm.userDetailsList.hospitalNumber,startIndex: startIndex);
      notifyListeners();
      return res.fold((l) {
        isFetchingMoreData= false;
        hasMoreData = false;
        logger.i(l);
        notifyListeners();
        return false;
      }, (r) {

        hasMoreData = r.totalCount-1>startIndex+limit;
        isFetchingMoreData = false;
        _documentList.addAll(r.dataListOfDocuments);
        count = r.totalCount;
        notifyListeners();
        return true;
      });
    }
  }


  Future<bool> refresh() async {
    _pageCount = 1;
    notifyListeners();
    return getDataforDoc();
  }
  search(String query,String accessToken) {
    _documentList.clear();
    _pageCount = 1;
    searchQuery = query;
    print("Searching for: $query");
    getDataforDoc();
  }

  toggleIsInSearchMode(String accessToken) {
    _isInSearchMode = !_isInSearchMode;
    count = 0;
    resetPageCounter();
    if (!_isInSearchMode) {
      searchQuery = "";
      getDataforDoc();
    }
    notifyListeners();
  }

  AppError get appError => _appError;



  bool get isFetchingData => _isFetchingData;

  // bool get isFetchingMoreData => _isFetchingMoreData;
  // set isFetchingMoreData(bool value) {
  //   _isFetchingMoreData = value;
  //   notifyListeners();
  // }

  bool get isInSearchMode => _isInSearchMode;

  set isInSearchMode(bool value) {
    _isInSearchMode = value;
  }

  bool get hasMoreData => _hasMoreData;

  set hasMoreData(bool value) {
    _hasMoreData = value;
    notifyListeners();
  }

  bool get shouldShowNoPrescriptionFound => _documentList.length == 0 && !isFetchingData;

  bool get shouldShowPageLoader =>
      _isFetchingData && _documentList.length == 0;


  List<Item> get documentList => _documentList;
}