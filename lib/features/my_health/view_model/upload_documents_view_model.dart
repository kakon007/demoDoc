import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class UploadDocumentsViewModel extends ChangeNotifier{
  Future<void> uploadDocuments({File file,String accessToken, attachmentTypeNo,String description,int regID,String username,DateTime pickBirthDate}) async {
    var headers = {
      'Authorization': 'Bearer $accessToken'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://qa.myhealthbd.com:9096/diagnostic-api/api/file-attachment/create'));
    request.fields.addAll({
      'reqobj': json.encode({"activeStatus":1,"attachmentTypeNo":"$attachmentTypeNo","reportDate":"2021-05-01T12:11:27.000Z","description":"$description","referenceNo":regID,"attachmentName":"${file.path}","type":2,"regId":"$username"})
    });
    request.files.add(await http.MultipartFile.fromPath('file', file.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print("Stataaaaa:::: ${response.statusCode}");
    try {
      if (response.statusCode == 200) {
        //var body=await response.stream.bytesToString();
        //print(await response.stream.bytesToString());
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
}