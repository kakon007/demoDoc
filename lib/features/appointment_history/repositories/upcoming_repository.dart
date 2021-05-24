
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/features/appointment_history/models/upcoming_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';

class AppointmentUpcomingRepository{
  Future<Either<AppError,Upcoming>> fetchAppointmentUpcomingHistory({int pageCount,String accessToken,String userName, String query,int startIndex=0}) async{
    //var url='https://qa.myhealthbd.com:9096/diagnostic-api/api/opd-appointments/appointment-History?draw=$pageCount&columns%5B0%5D%5Bdata%5D=regId&columns%5B0%5D%5Bname%5D=regId&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=asc&start=$startIndex&length=10&search%5Bvalue%5D=$query&search%5Bregex%5D=false&regId=$userName&statusArr%5B%5D=0&statusArr%5B%5D=1&_=1620284317159';
    //var url='https://qa.myhealthbd.com:9096/diagnostic-api/api/opd-appointments/appointment-History?draw=$pageCount&columns[0][data]=appointNo&columns[0][name]=&columns[0][searchable]=true&columns[0][orderable]=true&columns[0][search][value]=&columns[0][search][regex]=false&columns[1][data]=doctorName&columns[1][name]=doctorName&startcolumns[1][searchable]=true&columns[1][orderable]=true&columns[1][search][value]=&columns[1][search][regex]=false&columns[2][data]=companyName&columns[2][name]=companyName&columns[2][searchable]=true&columns[2][orderable]=true&columns[2][search][value]=&columns[2][search][regex]=false&order[0][column]=0&order[0][dir]=asc&start=$startIndex&length=10&search[value]=$query&search[regex]=false&regId=$userName&statusArr[]=0&statusArr[]=1&_=1621657556234';
    var url=
            'https://qa.myhealthbd.com:9096/diagnostic-api/api/opd-appointments/appointment-History?draw=$pageCount&columns%5B0%5D%5Bdata%5D=regId&columns%5B0%5D%5Bname%5D=regId&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=doctorName&columns%5B1%5D%5Bname%5D=doctorName&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=companyName&columns%5B2%5D%5Bname%5D=companyName&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=asc&start=$startIndex&length=10&search%5Bvalue%5D=$query&search%5Bregex%5D=false&regId=$userName&statusArr%5B%5D=0&statusArr%5B%5D=1&_=1620284317159';
    try{
      var client=http.Client();
      var response= await client.get(url,headers: {'Authorization': 'Bearer $accessToken',});
      if(response.statusCode==200){
        AppointmentUpcomingModel data= appointmentUpcomingModelFromJson(response.body);
        return Right(
            Upcoming(
              dataList:data.obj.data,
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
  int totalCount;
  Upcoming({this.dataList,this.totalCount});
}