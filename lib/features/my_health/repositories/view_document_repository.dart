import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/my_health/models/documents_list_model.dart';
import 'package:myhealthbd_app/features/my_health/models/view_document_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';

class ViewDocumentRepository{
  Future<Either<AppError,ViewDocumentM>> fetchViewDocumentsList({String accessToken,var page, String query,int startIndex=0,String username,String filePath}) async {
    //var url ='https://qa.myhealthbd.com:9096/diagnostic-api/api/file-attachment/gridList?columns%5B0%5D%5Bdata%5D=id&columns%5B0%5D%5Bname%5D&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=attachmentName&columns%5B1%5D%5Bname%5D=attachmentName&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=attachmentTypeName&columns%5B2%5D%5Bname%5D&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=description&columns%5B3%5D%5Bname%5D=description&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=4&columns%5B4%5D%5Bname%5D&columns%5B4%5D%5Bsearchable%5D=true&columns%5B4%5D%5Borderable%5D=false&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B5%5D%5Bdata%5D=5&columns%5B5%5D%5Bname%5D&columns%5B5%5D%5Bsearchable%5D=true&columns%5B5%5D%5Borderable%5D=false&columns%5B5%5D%5Bsearch%5D%5Bvalue%5D&columns%5B5%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B6%5D%5Bdata%5D=6&columns%5B6%5D%5Bname%5D&columns%5B6%5D%5Bsearchable%5D=true&columns%5B6%5D%5Borderable%5D=false&columns%5B6%5D%5Bsearch%5D%5Bvalue%5D&columns%5B6%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=asc&start=$startIndex&length=80&search%5Bvalue%5D=$query&search%5Bregex%5D=false&regId=$username&type=2&_=1621685486743';
    try{
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'text/plain'
      };
      var request = http.Request('POST', Uri.parse('https://qa.myhealthbd.com:9096/diagnostic-api/api/file-attachment/file-by-name'));
      request.body =json.encode('''{\n"attachmentPath" : $filePath\n}\n''');
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var body=await response.stream.bytesToString();
      print("BODYOFSTFRomView:::"+body.toString());
      if (response.statusCode == 200) {
        ViewDocumentModel data = viewDocumentModelFromJson(body) ;
        //print('Dataaaaaaa:: ' + data.obj.data.first.consultationId);

        return Right(
            ViewDocumentM(
                dataListOfDocuments: data.obj,
                //totalCount: data.obj.recordsTotal
            )

        );
        //print(data[0]['companySlogan']);
      }else {
       // BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    }on SocketException catch (e){
      print("FromprescriptionRepo:::"+e.toString());
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    }catch (e) {
      //BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.unknownError);
    }

  }

  //try {
  // var headers = {
  // 'Authorization': 'Bearer 95588a14-9938-41cf-9fb9-77a55a505428',
  // 'Content-Type': 'text/plain'
  // };
  // var request = http.Request('POST', Uri.parse('https://qa.myhealthbd.com:9096/diagnostic-api/api/file-attachment/file-by-name'));
  // request.body =json.encode('''{\n"attachmentPath" : $filePath\n}\n''');
  // request.headers.addAll(headers);
  //
  // http.StreamedResponse response = await request.send();

  // if (response.statusCode == 200) {
  // var body=await response.stream.bytesToString();
  // }
  // else {
  // print(response.reasonPhrase);
  // }
  //
  // } on Exception catch (e) {
  // // TODO
  // print("PDFDATAERROR");
  // print(e.toString());
  // return null;
  // }
}

class ViewDocumentM{
  String dataListOfDocuments;
  int totalCount;
   ViewDocumentM({this.dataListOfDocuments,this.totalCount});
}