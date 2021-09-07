import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/appointment_report/models/appointment_report_models.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class AppointmentReportHistory{
  Future<Either<AppError,ConsModel>> fetchAppointmentReportList({int doctorNo,int ogNo, var fromDate, var toDate,int shiftNo}) async {
    try{
      var response=await ApiClient().postRequest("diagnostic-api/api/opd-appointment-report/report-list", {"fromDate":"$fromDate","toDate":"$toDate","printFormate":"PDF","doctorNo":doctorNo,"ogNo":ogNo,"shiftNo":shiftNo});
      print('constwer ${response.statusCode}');
      print('constwe $shiftNo');
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