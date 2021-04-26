
import 'dart:convert';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/hospitals/models/hospital_list_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';
class HospitalListRepositry{


  Future<Either<AppError,HospiitalListM>> fetchHospitalList() async {
    var url =
        "${Urls.buildUrl}online-appointment-api/fapi/appointment/companyList";
   // List<Item> dataList = new List<Item>();

    try{
      var client = http.Client();
      var response = await client.get(url);
      if (response.statusCode == 200) {
       // Map<String, dynamic> jsonMap = json.decode(response.body);
        //data = jsonMap["items"];
        // HospitalListModel data =hospitalListModelFromJson(response.body) ;
        // var mapData = json.decode(utf8.decode(response.bodyBytes));
        // var hospitalList = fromJson(mapData);

        HospitalListModel data = hospitalListModelFromJson(response.body) ;
        // data.items.forEach((elemant) {
        //   dataList.add(elemant);
        // });

        // data.items.forEach((elemant) {
        //   dataList.add(elemant);
        // });
        //
        print('Dataaaaaaa:: ' + data.items[5].companyAddress);
        // return data;

        return Right(
            HospiitalListM(
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
  // List<HospitalListModel> fromJson(json) {
  //   List<HospitalListModel> hospitalList = new List<HospitalListModel>();
  //   if (json != null) {
  //     json.forEach((v) {
  //       hospitalList.add(new HospitalListModel.fromJson(v));
  //     });
  //   }
  //   return hospitalList;
  // }
}

class HospiitalListM{
  List<Item> dataList = new List<Item>();
  HospiitalListM({this.dataList});
}