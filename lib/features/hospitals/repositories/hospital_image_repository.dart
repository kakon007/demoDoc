import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/features/hospitals/models/company_image_model.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';

class HospitalImagerepository {
  Future<Either<AppError, HospitalImageM>> fetchHospitalImage() async {
    try {
      var url =
          "${Urls.baseUrl}online-appointment-api/fapi/appointment/companyImageList";
      var client = http.Client();
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        CompanyImageModel data2 = companyImageModelFromJson(response.body);
        print("image repository::");
        return Right(HospitalImageM(
          dataList2: data2.items,
        ));
        //print(data[0]['companySlogan']);
      } else {
        //BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    } on SocketException catch (e) {
      //logger.e(e);
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    } catch (e) {
      //logger.e(e);
      //BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.unknownError);
    }
  }
}

class HospitalImageM {
  List<Item> dataList2 = new List<Item>();
  HospitalImageM({this.dataList2});
}
