import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/user_profile/models/userImageModel.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';
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
  String _resDoctorStatusCode;
  bool _isLoading = false;
  bool _isImageLoading = false;

  loadProfileImage(String image, double height, double width, double border) {
    Uint8List _bytesImage = Base64Decoder().convert(image);
    //print(_bytesImage);
    return ClipRRect(
      borderRadius: BorderRadius.circular(border),
      child: Image.memory(
        _bytesImage,
        fit: BoxFit.cover,
        width: width,
        height: height,
        gaplessPlayback: true,
      ),
    );
  }

  Future<void> updateImage(File image, String hospitalNo, String id) async {
    _isImageLoading = true;
    var headers = {
      'Authorization':
          'Bearer ${Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken}'
    };
    var request = http.MultipartRequest(
        'PUT', Uri.parse('${Urls.baseUrl}auth-api/api/coreUser/update-user-info'));
    request.fields.addAll({
      'reqobj': {"name": hospitalNo.toUpperCase(), "id": id, "userMobile": null, "userEmail": null}
          .toString()
    });
    request.files
        .add(await http.MultipartFile.fromPath('file', image.path, filename: basename(image.path)));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    _resStatusCode = response.statusCode.toString();
    print(response.statusCode);
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
      // Fluttertoast.showToast(
      //     msg: "Check Network Connection!!",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 12.0);
    }
  }

  Future<void> updateDoctorProfile(
      {String hospitalNo, String id, String userEmail, userMobile}) async {
    print(userEmail);
    _isImageLoading = true;
    var headers = {
      'Authorization':
          'Bearer ${Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken}'
    };
    var request = http.MultipartRequest(
        'PUT', Uri.parse('${Urls.baseUrl}auth-api/api/coreUser/update-user-info'));
    request.fields.addAll({
      'reqobj': {
        "userMobile": "0$userMobile",
        "name": hospitalNo.toUpperCase(),
        "userEmail": userEmail,
        "id": id
      }.toString()
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    _resDoctorStatusCode = response.statusCode.toString();
    print(response.statusCode);
    try {
      if (response.statusCode == 200) {
        userImage();
        Fluttertoast.showToast(
            msg: "Profile updated successfully!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 12.0);
        notifyListeners();
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {}
  }

  updateProfile2(
      File image,
      String userId,
      String name,
      String email,
      String number,
      String address,
      String birthDate,
      String gender,
      String blood,
      String hospitalNumber,
      String regDate) async {
    if (gender == "Male") {
      gender = "M";
    }
    if (gender == "Female") {
      gender = "F";
    }
    DateTime tempDate = DateFormat("yyyy-MM-dd").parse(regDate);
    String registrationDate = DateFormat("yyyy-MM-dd").format(tempDate);
    var headers = {
      'Authorization':
          'Bearer ${Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken}'
    };
    var request = http.MultipartRequest(
        'PUT', Uri.parse('${Urls.baseUrl}diagnostic-api/api/opd-registration/update-with-image'));
    request.fields.addAll({
      'reqobj': json.encode({
        "opdReg": {
          "id": userId,
          "fname": name,
          "dob": birthDate,
          "gender": gender,
          "phoneMobile": number,
          "email": email,
          "address": address,
          "bloodGroup": blood,
          "hospitalNumber": hospitalNumber,
          "regDate": registrationDate,
          "organizationNo": 1
        }
      })
    });
    request.files
        .add(await http.MultipartFile.fromPath('file', image.path, filename: basename(image.path)));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    try {
      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        notifyListeners();
      } else {}
    } catch (e) {}
  }

  Future<void> userImage() async {
    _isImageLoading = true;
    var headers = {
      'Authorization':
          'Bearer ${Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken}'
    };

    var request =
        http.Request('GET', Uri.parse('${Urls.baseUrl}auth-api/api/coreUser/user-details'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    try {
      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        print("shakil ${res}");
        UserImageModel data = userImageModelFromJson(res);
        _details = data.obj;
        print("details $_details");
        _isImageLoading = false;
        notifyListeners();
      } else {
        _isImageLoading = false;
      }
    } catch (e) {
      _isImageLoading = false;
      // Fluttertoast.showToast(
      //     msg: "Check Network Connection!!",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 12.0);
    }
  }

  Future<void> switchImage(var accessToken) async {
    //_switchDetails=null;
    var headers = {'Authorization': 'Bearer $accessToken'};

    var request =
        http.Request('GET', Uri.parse('${Urls.baseUrl}auth-api/api/coreUser/user-details'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    try {
      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        print("shakil" + res);
        UserImageModel data = userImageModelFromJson(res);
        _switchDetails = data.obj;
        notifyListeners();
      } else {}
    } catch (e) {
      // Fluttertoast.showToast(
      //     msg: "Check Network Connection!!",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 12.0);
    }
  }

  AppError get appError => _appError;

  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;

  bool get isLoading => _isLoading;

  bool get isImageLoading => _isImageLoading;

  Obj get details => _details;

  Obj get switchDetails => _switchDetails;

  String get resStatusCode => _resStatusCode;
  String get resDoctorStatusCode => _resDoctorStatusCode;
}
