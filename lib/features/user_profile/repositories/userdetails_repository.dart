import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:myhealthbd_app/features/cache/cache_repositories.dart';
import 'package:myhealthbd_app/features/news/model/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/user_profile/models/userDetails_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';

class UserDetailsRepository {
  Future<Either<AppError, UserM>> fetchUserDetails(String accessToken) async {
    var url =
        "${Urls.baseUrl}"
        "diagnostic-api/api/pat-investigation-report/find-hospitalNumber";
    // List<Item> dataList = new List<Item>();

    try {
      var client = http.Client();
      var response = await client.post(Uri.parse(url), headers: {
        'Authorization': 'Bearer $accessToken',
      });
      if (response.statusCode == 200) {
        UserDetailsModel data2 = userDetailsModelFromJson(response.body);
        print('User Details Data:: ' + data2.obj.fname);
        print(response.body);
        return Right(UserM(
          dataList: data2.obj,
        ));
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
  Future<Either<AppError, UserM>> fetchPatInfo(String accessToken, String hospitalNumber) async {
    var url =
        "${Urls.baseUrl}diagnostic-api/api/opd-registration/findByHospitalNumber?hospitalNumber=$hospitalNumber";

    try {
      var client = http.Client();
      var response = await client.get(Uri.parse(url),headers: {
        'Authorization': 'Bearer $accessToken',
      });
      print(response.body);
      if (response.statusCode == 200) {
        UserDetailsModel data2 = userDetailsModelFromJson(response.body);
        CacheRepositories.setCacheAsDecodeJson(response.body, CacheKeys.userDetails);
        print('User Details Data:: ' + data2.obj.fname);
        print(response.body);
        return Right(UserM(
          dataList: data2.obj,
        ));
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


class UserM {
  Obj dataList = new Obj();
  UserM({this.dataList});
}
