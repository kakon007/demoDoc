import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/user_profile/models/userImageModel.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:path/path.dart';
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
  Future <void> updateImage(File image, String hospitalNo, String id) async {
    print(hospitalNo);

    print("Shakil ${image.path}");
    List<int> imageBytes = image.readAsBytesSync();
//    print(imageBytes);
   // var img = "data:image/jpg;base64," + base64Encode(imageBytes);
    var headers = {
      'Authorization': 'Bearer ${Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken}'
    };
    var request = http.MultipartRequest('PUT', Uri.parse('https://qa.myhealthbd.com:9096/auth-api/api/coreUser/update-user-info'));
    request.fields.addAll({
      'reqobj': {"name":hospitalNo,"id":id,"userMobile": null, "userEmail":null}.toString()
    });
    request.files.add(await http.MultipartFile.fromPath('file', image.path, filename: basename(image.path)));
  //  request.files.add(await http.MultipartFile('file', image.openRead(), image.lengthSync(), filename: basename(image.toString())));
   // var multipartFile = new http.MultipartFile();
    // request.files.add(http.MultipartFile.fromString(
    //     'file', image.toString()
    // ));
    // request.files.add(http.MultipartFile(
    //   'file',
    //   image.readAsBytes().asStream(),
    //   image.lengthSync(),
    // ));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print( response.statusCode);
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