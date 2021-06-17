import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

class UploadDocumentsViewModel extends ChangeNotifier{

  String _accessToken;
  int _id;
  String _filed;
  Future<void> uploadDocuments({File file,String accessToken, attachmentTypeNo,String description,int regID,String username,String pickDate,String attachmentName}) async {
    SVProgressHUD.show(
      status: 'Uploading'
    );
    var headers = {
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://qa.myhealthbd.com:9096/diagnostic-api/api/file-attachment/create'));
    request.fields.addAll({
      'reqobj': json.encode({"activeStatus":1,"attachmentTypeNo":"$attachmentTypeNo","reportDate":pickDate,"description":description,"referenceNo":regID,"attachmentName":"$attachmentName","type":2,"regId":"$username"})
    });
    request.files.add(await http.MultipartFile.fromBytes('file', file.readAsBytesSync(),filename: attachmentName));
    print("Dile Pathh:::"+file.path.split('/').last);
    print("Dile P:::"+attachmentName);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print("Stataaaaa:::: ${response.statusCode}");
    try {
      if (response.statusCode == 200) {
        //var body=await response.stream.bytesToString();
        print("BodyfromDoc::"+await response.stream.bytesToString());
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
    SVProgressHUD.dismiss();
  }


  Future<void> deleteDocuments({int id,String attachmentName,String attachmentPath,int attachmentTypeNo,String description,int activeStatus,int referenceNo,int referenceTypeNo,String regId,int type,String accessToken}) async {
var headers = {
  'Authorization': 'Bearer $accessToken',
  'Content-Type': 'text/plain'
};
var request = http.Request('POST', Uri.parse('https://qa.myhealthbd.com:9096/diagnostic-api/api/file-attachment/delete'));
request.body = ''' {\n           \n            "id": $id,\n            "attachmentName": "$attachmentName",\n            "attachmentPath": "$attachmentPath",\n            "attachmentTypeNo": $attachmentTypeNo,\n            "description": $description,\n            "activeStatus": $activeStatus,\n            "referenceNo": $referenceNo,\n            "referenceTypeNo": $referenceTypeNo,\n            "regId": "$regId",\n            "type": $type\n        },''';
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

    print("Stataaaaa33333:::: ${response.statusCode}");
    try {
      if (response.statusCode == 200) {
        //var body=await response.stream.bytesToString();
        print("BodyfromDoc33333::"+await response.stream.bytesToString());
        Fluttertoast.showToast(
            msg: "Document Delete Successfully!",
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


  // Future<void> editDocument({String fileName}) async {
  //   var headers = {
  //     'Authorization': 'Bearer $_accessToken'
  //   };
  //   print('idddddddeeeeee:: $_accessToken');
  //   var request = http.MultipartRequest('POST', Uri.parse('https://qa.myhealthbd.com:9096/diagnostic-api/api/file-attachment/edit'));
  //   request.fields.addAll({
  //     'reqobj':json.encode({"id":_id,"attachmentName":"$fileName"})
  //   });
  //
  //
  //   print('iddffrr $_id');
  //   print('iddffrr $fileName');
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   print("Stataaaaa44444:::: ${response.statusCode}");
  //   try {
  //     if (response.statusCode == 200) {
  //       //var body=await response.stream.bytesToString();
  //       print("BodyfromDoc4444::"+await response.stream.bytesToString());
  //       Fluttertoast.showToast(
  //           msg: "Document Upload successfully!",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           backgroundColor: Colors.green,
  //           textColor: Colors.white,
  //           fontSize: 12.0);
  //       notifyListeners();
  //       //return body;
  //     } else {
  //       print(await response.stream.bytesToString());
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
  //
  // getData(
  //     {String accessToken,int id,String fileName}
  //     ){
  //   _accessToken=accessToken;
  //   print('idddddddeeeee:: $_accessToken');
  //   _id=id;
  //   print('iddddddd:: $_id');
  //   _filed=fileName;
  //   notifyListeners();
  // }
  //
  //
  // String get accessToken=>_accessToken;
  // int get id=>_id;
  // String get fileName=>_filed;

}