import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/doctor/features/emr_screen/models/prescription_list_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
class PrescriptionListRepository{
  Future<Either<AppError, PrescriptionListM>> fetchPrescriptionList(
      {var fromDate,var toDate,int startIndex}) async {
     try{
       // var headers = {
       //   'Authorization': 'Bearer f7388c39-9f2f-4879-b22c-d9a60826f4c9'
       // };
       // var request = http.Request('GET', Uri.parse('https://qa.myhealthbd.com:9096/diagnostic-api/api/emr/view-prescription/gridList?draw=1&columns%5B0%5D%5Bdata%5D=ssModifiedOn&columns%5B0%5D%5Bname%5D=ssModifiedOn&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=ssModifiedOn&columns%5B1%5D%5Bname%5D&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=consultationId&columns%5B2%5D%5Bname%5D=consultationId&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=doctorName&columns%5B3%5D%5Bname%5D=doctorName&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=4&columns%5B4%5D%5Bname%5D&columns%5B4%5D%5Bsearchable%5D=true&columns%5B4%5D%5Borderable%5D=true&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=desc&start=0&length=10&search%5Bvalue%5D&search%5Bregex%5D=false&hospitalId=MH22101014392&ipdFlag=0&fromDate=11-jan-2020&toDate=11-Aug-2021&_=1628675251994#/external-service/patient-portal/patient-portal-home'));
       // request.headers.addAll(headers);

      var response= await ApiClient().getRequest(
           "diagnostic-api/api/emr/view-prescription/gridList?draw=1&columns%5B0%5D%5Bdata%5D=ssModifiedOn&columns%5B0%5D%5Bname%5D=ssModifiedOn&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=ssModifiedOn&columns%5B1%5D%5Bname%5D&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=consultationId&columns%5B2%5D%5Bname%5D=consultationId&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=doctorName&columns%5B3%5D%5Bname%5D=doctorName&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=4&columns%5B4%5D%5Bname%5D&columns%5B4%5D%5Bsearchable%5D=true&columns%5B4%5D%5Borderable%5D=true&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=desc&start=$startIndex&length=10&search%5Bvalue%5D&search%5Bregex%5D=false&hospitalId=MH22101014392&ipdFlag=0&fromDate=$fromDate&toDate=$toDate&_=1628675251994#/external-service/patient-portal/patient-portal-home",
           );

      // http.StreamedResponse response = await request.send();
print('response ${response.statusCode}');
       if (response.statusCode == 200) {
         var body=response.body;
         EmrPrescriptionListModel data=emrPrescriptionListModelFromJson(body);
         print('body: ${body}');
         return Right(PrescriptionListM(
           datafromprescriptionList: data.obj.data,
           totalCount: data.obj.recordsTotal
         ));
       }
       else {
         print(response.reasonPhrase);
         return Left(AppError.serverError);
       }
     }on SocketException catch (e) {
       print("FromprescriptionTemplateRepo:::" + e.toString());
       BotToast.showText(text: StringResources.unableToReachServerMessage);
       return Left(AppError.networkError);
     } catch(e){
       print(e);
       return Left(AppError.unknownError);
     }
  }
}

class PrescriptionListM{
  List<Datum> datafromprescriptionList=List<Datum>();
  int totalCount;
  PrescriptionListM({this.datafromprescriptionList,this.totalCount});
}