

import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/features/hospitals/models/company_logo_model.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
class HospitalLogoRepository{
  // Future<CompanyLogoModel> fetchHospitalList() async {
  //   var url =
  //       "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/companyLogoList";
  //   var client = http.Client();
  //   var response = await client.get(url);
  //   if (response.statusCode == 200) {
  //     //Map<String, dynamic> jsonMap = json.decode(response.body);
  //     //data = jsonMap["items"];
  //     CompanyLogoModel data = companyLogoModelFromJson(response.body) ;
  //     data.items.forEach((elemant) {
  //       dataListforLogo.add(elemant);
  //     });
  //     //print('CompanyLogo:::::: ' + data.items[0].photoLogo);
  //     return data;
  //     //print(data[0]['companySlogan']);
  //   }else {
  //     return null;
  //   }
  // }

  Future<Either<AppError,HospiitalLogoM>> fetchHospitalLogo() async {

    try{
      var url =
          "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/companyLogoList";
      var client = http.Client();
      var response = await client.get(url);
      if (response.statusCode == 200) {
        //Map<String, dynamic> jsonMap = json.decode(response.body);
        //data = jsonMap["items"];
        CompanyLogoModel data = companyLogoModelFromJson(response.body) ;

        return Right(
            HospiitalLogoM(
              dataList: data.items,
            )

        );
        //print(data[0]['companySlogan']);
      }else {
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

class HospiitalLogoM{
  List<Item> dataList = new List<Item>();
  HospiitalLogoM({this.dataList});
}