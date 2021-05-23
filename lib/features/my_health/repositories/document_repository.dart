import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/my_health/models/documents_list_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';

class DocumentRepository{
  Future<Either<AppError,DocumentM>> fetchDocumentsList({String accessToken,var page, String query,int startIndex=0,String username}) async {
    var url ='https://qa.myhealthbd.com:9096/diagnostic-api/api/file-attachment/gridList?columns%5B0%5D%5Bdata%5D=id&columns%5B0%5D%5Bname%5D&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=attachmentName&columns%5B1%5D%5Bname%5D=attachmentName&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=attachmentTypeName&columns%5B2%5D%5Bname%5D&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=description&columns%5B3%5D%5Bname%5D=description&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=4&columns%5B4%5D%5Bname%5D&columns%5B4%5D%5Bsearchable%5D=true&columns%5B4%5D%5Borderable%5D=false&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B5%5D%5Bdata%5D=5&columns%5B5%5D%5Bname%5D&columns%5B5%5D%5Bsearchable%5D=true&columns%5B5%5D%5Borderable%5D=false&columns%5B5%5D%5Bsearch%5D%5Bvalue%5D&columns%5B5%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B6%5D%5Bdata%5D=6&columns%5B6%5D%5Bname%5D&columns%5B6%5D%5Bsearchable%5D=true&columns%5B6%5D%5Borderable%5D=false&columns%5B6%5D%5Bsearch%5D%5Bvalue%5D&columns%5B6%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=asc&start=$startIndex&length=10&search%5Bvalue%5D&search%5Bregex%5D=false&regId=$username&type=2&_=1621685486743';

    try{
      var client = http.Client();
      var response = await client.get(url,headers: {'Authorization': 'Bearer $accessToken',});
      if (response.statusCode == 200) {
        DocumentListModel data = documentListModelFromJson(response.body) ;
        //print('Dataaaaaaa:: ' + data.obj.data.first.consultationId);

        return Right(
            DocumentM(
                dataListofReport: data.items,
            )

        );
        //print(data[0]['companySlogan']);
      }else {
        BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    }on SocketException catch (e){
      print("FromprescriptionRepo:::"+e.toString());
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    }catch (e) {
      BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.unknownError);
    }

  }
}

class DocumentM{
  List<Item> dataListofReport=List<Item>();
  int totalCount;
  DocumentM({this.dataListofReport,this.totalCount});
}