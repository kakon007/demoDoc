import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/my_health/models/search_doctor_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';

class SearchDoctorRepository {
  Future<Either<AppError, SearchDoctorM>> fetchDoctorList(
      {String accessToken, String name,int companyNo}) async {
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'text/plain'
      };
      var request = http.Request('POST', Uri.parse('${Urls.baseUrl}diagnostic-api/api/file-shared/searchDoctor'));
      request.body = '''{"doctorName":"$name","companyNo":$companyNo}''';
      request.headers.addAll(headers);
      print('Name $name');
      print('acc $accessToken');
      http.StreamedResponse response = await request.send();
      print('Res ${response.statusCode}');
      if (response.statusCode == 200) {
        var body=await response.stream.bytesToString();
        SearchDoctorModel data = searchDoctorModelFromJson(body);
        //print('Dataaaaaaa:: ' + data.obj.data.first.consultationId);

        return Right(
            SearchDoctorM(
              dataListOfsearchDoc: data.items,
                  message: data.message
            ));
        //print(data[0]['companySlogan']);
      } else {
        // BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    } on SocketException catch (e) {
      print("FromprescriptionRepo:::" + e.toString());
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    } catch (e) {
      //BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.unknownError);
    }
  }
}

class SearchDoctorM {
  List<Itemm> dataListOfsearchDoc = List<Itemm>();
  String message;
  SearchDoctorM({this.dataListOfsearchDoc, this.message});
}
