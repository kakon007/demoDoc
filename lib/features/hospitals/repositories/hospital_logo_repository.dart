import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/features/cache/cache_repositories.dart';
import 'package:myhealthbd_app/features/hospitals/models/company_logo_model.dart' as logo;
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';

class HospitalLogoRepository {
  Future<Either<AppError, HospiitalLogoM>> fetchHospitalLogo() async {
    try {
      var url =
          "${Urls.baseUrl}online-appointment-api/fapi/appointment/companyLogoList";
      var client = http.Client();
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        //Map<String, dynamic> jsonMap = json.decode(response.body);
        //data = jsonMap["items"];
        logo.CompanyLogoModel data = logo.companyLogoModelFromJson(response.body);
        CacheRepositories.setCacheAsDecodeJson(response.body, CacheKeys.hospitalLogo);

        return Right(HospiitalLogoM(
          dataList: data.items,
        ));
        //print(data[0]['companySlogan']);
      } else {
        BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    } on SocketException catch (e) {
      //logger.e(e);
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    } catch (e) {
      //logger.e(e);
      BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.unknownError);
    }
  }
}

class HospiitalLogoM {
  List<logo.Item> dataList = new List<logo.Item>();
  HospiitalLogoM({this.dataList});
}
