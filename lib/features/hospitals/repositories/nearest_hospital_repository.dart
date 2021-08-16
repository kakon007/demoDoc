import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/hospitals/models/nearest_hospital_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';

class NearestHospitalRepositry {
  Future<Either<AppError, HospitalListM>> fetchNearestHospitalList({var userLatitude,var userLongitude}) async {
    var url = "${Urls.baseUrl}online-appointment-api/fapi/appointment/companyListNearUser?userLatitude=$userLatitude&userLongitude=$userLongitude";
    try {
      var client = http.Client();
      var response = await client.get(Uri.parse(url));
      //print('body:::: '+ response.body.toString());
      if (response.statusCode == 200) {
        NrearestHospitalModel data = nrearestHospitalModelFromJson(response.body);
        return Right(HospitalListM(
          dataList: data.items,
        ));
      } else {
        BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    } on SocketException catch (e) {
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    } catch (e) {
      BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.unknownError);
    }
  }
}

class HospitalListM {
  List<Items> dataList =  List<Items>();
  HospitalListM({this.dataList});
}
