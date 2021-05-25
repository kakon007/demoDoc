import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/my_health/models/file_type_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';

class FileTypeRepository{
  Future<Either<AppError,FileM>> fetchFileType(String accessToken) async {
    var url =
        "https://qa.myhealthbd.com:9096/diagnostic-api/api/file-attachment/type-list";
    // List<Item> dataList = new List<Item>();

    try{
      var client = http.Client();
      var response = await client.post(url,headers: {'Authorization': 'Bearer $accessToken',});
      if (response.statusCode == 200) {
        FileTypeListModel data2 = fileTypeListModelFromJson(response.body) ;
        //print('User Details Data:: '+data2.obj.fname);
        print(response.body);
        return Right(
            FileM(
              dataList: data2.items,
            )

        );
      }else {
        BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    }on SocketException catch (e){
      //logger.e(e);
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    }catch (e) {
      //logger.e(e);
      BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.unknownError);
    }

  }
}


class FileM{
  List<Item> dataList = new List<Item>();
  FileM({this.dataList});
}