import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/patient_details/models/consultation_history_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class ConsultationHistory{
  Future<Either<AppError,ConsModel>> fetchConsultationList({var id}) async {
    try{
      var response=await ApiClient().postRequest("prescription-service-api/api/prescription/findOpdConsHistory", {"hospitalId": "$id"});
      print('constwer ${response.statusCode}');
      if(response.statusCode==200){
        var body=response.body;
        ConsultationHistoryModel data=consultationHistoryModelFromJson(body);
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