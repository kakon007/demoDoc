import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/user_profile/models/userImageModel.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
class UserImageViewModel extends ChangeNotifier{
  String _image;
  Obj _details;
  AppError _appError;
  DateTime _lastFetchTime;
  bool _isFetchingMoreData = false;
  bool _isFetchingData = false;

  loadProfileImage(String image, double height, double width) {
    Uint8List _bytesImage = Base64Decoder().convert(image);
    //print(_bytesImage);
    return Image.memory(
      _bytesImage,
      fit: BoxFit.fill,
      width: width,
      height: height,
      gaplessPlayback: true,
    );
  }
  // loadLogoDashboard(String image) {
  //   Uint8List _bytesImage = Base64Decoder().convert(image);
  //   //print(_bytesImage);
  //   return Image.memory(
  //     _bytesImage,
  //     fit: BoxFit.fill,
  //     width: 32,
  //     height: 32,
  //     gaplessPlayback: true,
  //   );
  // }\
  Future <void> updateImage(File name, String hospitalNo, String id) async {
    print("Shakil" + name.toString());
    var headers = {
      'Authorization': '${Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken}'
    };
    var request = http.MultipartRequest('PUT', Uri.parse('https://qa.myhealthbd.com:9096/auth-api/api/coreUser/update-user-info'));
    request.fields.addAll({
      'reqobj': '{"userMobile":null,"name":$hospitalNo,"userEmail":null,"id":$id}'
    });
    request.files.add(await http.MultipartFile.fromPath('file', '$name'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }

  }
  Future<void> userImage() async {

    var headers = {
      'Authorization': 'Bearer ${Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken}'
    };
    var request = http.Request('GET', Uri.parse('https://qa.myhealthbd.com:9096/auth-api/api/coreUser/user-details'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
       var res= await response.stream.bytesToString();
       print(res);
       UserImageModel data = userImageModelFromJson(res);
       _details =data.obj;
       notifyListeners();
    }
    else {
      print(response.reasonPhrase);
    }
  }
  AppError get appError => _appError;

  bool get isFetchingData => _isFetchingData;

  bool get isFetchingMoreData => _isFetchingMoreData;
  Obj get details => _details;



}