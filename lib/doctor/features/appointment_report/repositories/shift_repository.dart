import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/appointment_report/models/shift_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class ShiftReportHistory{
  Future<Either<AppError,ConsModel>> fetchShiftList({var ogNo}) async {
    try{
      var response=await ApiClient().getRequest('https://qa.myhealthbd.com:9096/diagnostic-api/api/opd-consultation/shift-list-new?ogNo=$ogNo');
      if(response.statusCode==200){
        var body=response.body;
        ShiftListModel data=shiftListModelFromJson(body);
        return Right(
            ConsModel(dataList: data.items)
        );
      }else{
        print(response.reasonPhrase);
        return Left(
            AppError.httpError
        );
      }
    }catch(e){
      print(e);
    }
  }
}

class ConsModel{
  List<Item> dataList=[];
  ConsModel({this.dataList});
}