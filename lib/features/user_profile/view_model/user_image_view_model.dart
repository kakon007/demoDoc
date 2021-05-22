import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/user_profile/models/userImageModel.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class UserImageViewModel extends ChangeNotifier {
  String _image;
  Obj _details;
  Obj _switchDetails;
  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;
  String _resStatusCode;

  loadProfileImage(String image, double height, double width, double border) {
    Uint8List _bytesImage = Base64Decoder().convert(image);
    //print(_bytesImage);
    return ClipRRect(
      borderRadius: BorderRadius.circular(border),
      child: Image.memory(
        _bytesImage,
        fit: BoxFit.fill,
        width: width,
        height: height,
        gaplessPlayback: true,
      ),
    );
  }

  Future<void> updateImage(File image, String hospitalNo, String id) async {
    var headers = {
      'Authorization':
          'Bearer ${Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken}'
    };
    var request = http.MultipartRequest(
        'PUT',
        Uri.parse(
            'https://qa.myhealthbd.com:9096/auth-api/api/coreUser/update-user-info'));
    request.fields.addAll({
      'reqobj': {
        "name": hospitalNo,
        "id": id,
        "userMobile": null,
        "userEmail": null
      }.toString()
    });
    request.files.add(await http.MultipartFile.fromPath('file', image.path,
        filename: basename(image.path)));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    _resStatusCode = response.statusCode.toString();
    try {
      if (response.statusCode == 200) {
        userImage();
        Fluttertoast.showToast(
            msg: "Profile picture updated successfully!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 12.0);
        notifyListeners();
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Something went wrong!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12.0);
    }
  }

  Future<void> userImage() async {
    var headers = {
      'Authorization':
          'Bearer ${Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken}'
    };

    var request = http.Request(
        'GET',
        Uri.parse(
            'https://qa.myhealthbd.com:9096/auth-api/api/coreUser/user-details'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    try {
      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        print(res);
        UserImageModel data = userImageModelFromJson(res);
        _details = data.obj;
        notifyListeners();
      } else {}
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Something went wrong!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12.0);
    }
  }
  Future<void> switchImage(var accessToken) async {
    var headers = {
      'Authorization':
      'Bearer $accessToken'
    };

    var request = http.Request(
        'GET',
        Uri.parse(
            'https://qa.myhealthbd.com:9096/auth-api/api/coreUser/user-details'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    try {
      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        print(res);
        UserImageModel data = userImageModelFromJson(res);
        _switchDetails = data.obj;
        notifyListeners();
      } else {}
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Something went wrong!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12.0);
    }
  }
  AppError get appError => _appError;

  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;

  Obj get details => _details;
  Obj get switchDetails => _switchDetails;

  String get resStatusCode => _resStatusCode;
}
