
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/features/appointment_history/models/upcoming_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';

class AppointmentUpcomingRepository{
  Future<Either<AppError,Upcoming>> fetchAppointmentUpcomingHistory({int pageCount,String accessToken,String userName}) async{
    var url='https://qa.myhealthbd.com:9096/diagnostic-api/api/opd-appointments/appointment-History?draw=$pageCount&columns%5B0%5D%5Bdata%5D=regId&columns%5B0%5D%5Bname%5D=regId&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=asc&start=0&length=10&search%5Bvalue%5D&search%5Bregex%5D=false&regId=MH22012014368&statusArr%5B%5D=0&statusArr%5B%5D=1&_=1620284317159';
    try{
      var client=http.Client();
      var response= await client.get(url,headers: {'Authorization': 'Bearer $accessToken',});
      if(response.statusCode==200){
        AppointmentUpcomingModel data= appointmentUpcomingModelFromJson(response.body);
        return Right(
            Upcoming(
              dataList:data.items,
              totalCount: data.obj.recordsTotal
            )
        );
      }
      else {
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

class Upcoming{
  List<Item> dataList=new List();
  var totalCount;
  Upcoming({this.dataList,this.totalCount});
}