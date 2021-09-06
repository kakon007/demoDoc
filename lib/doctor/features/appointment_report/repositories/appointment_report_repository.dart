import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/appointment_report/models/appointment_report_models.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class AppointmentReportHistory{
  Future<Either<AppError,ConsModel>> fetchAppointmentReportList({int doctorNo,int ogNo, String fromDate, String toDate}) async {
    try{
      var response=await ApiClient().postRequest("diagnostic-api/api/opd-appointment-report/report-list", {"fromDate":"2021-08-31T18:00:00.000Z","toDate":"2021-09-05T09:56:24.763Z","printFormate":"PDF","doctorNo":doctorNo,"ogNo":ogNo,"shiftNo":0});
      print('constwer ${response.statusCode}');
      if(response.statusCode==200){
        var body=response.body;
        AppointmentReportListModel data=appointmentReportListModelFromJson(body);
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