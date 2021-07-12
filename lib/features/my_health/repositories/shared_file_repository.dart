import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/my_health/models/shared_file_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';
class SharedFileRepository{
Future<Either<AppError,SharedFileM>> fetchSharedFile({String accessToken,int fileNo})async{
  //String url='${Urls.baseUrl}diagnostic-api/api/file-shared/getListByFileNo';
  print('Enter Shared Repo');
  try{
    var headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'text/plain'
    };
    var request = http.Request('GET', Uri.parse('${Urls.baseUrl}diagnostic-api/api/file-shared/getListByFileNo'));
    request.body = '''{\n"fileNo":  $fileNo\n}\n''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if(response.statusCode==200){
      var body=await response.stream.bytesToString();
      SharedFileModel data=sharedFileModelFromJson(body);
      return Right(
          SharedFileM(
            dataList: data.items,
          ),
      );
    }else{
      return Left(AppError.serverError);
    }

  }on SocketException catch (e) {
    BotToast.showText(text: StringResources.unableToReachServerMessage);
    return Left(AppError.networkError);
  }catch(e){
    return Left(AppError.unknownError);
  }

}

}

class SharedFileM{
  List<Item> dataList;
  SharedFileM({this.dataList});
}