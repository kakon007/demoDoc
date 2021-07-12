import 'dart:convert';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/auth/model/term_model.dart';
import 'package:myhealthbd_app/features/cache/cache_repositories.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';

class TermsRepositry {
  Future<Either<AppError, TermsM>> fetchTerms() async {
    print('enter');

    // var url = "${Urls.baseUrl}online-appointment-api/fapi/appointment/companyListNearUser?userLatitude=$userLatitude&userLongitude=$userLongitude";
    // // List<Item> dataList = new List<Item>();
    // print('Hospital :: ' + userLatitude.toString());
    // print('Hospital :: ' + userLongitude.toString());
    try {
      var request = http.Request('GET', Uri.parse('https://qa.myhealthbd.com:9096/online-appointment-api/fapi/trems-condition/get-terms-conditions'));
      request.body = '''''';

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body=await response.stream.bytesToString();
        TermsModel data = termsModelFromJson(body);
        //CacheRepositories.setCacheAsDecodeJson(response.body, CacheKeys.nearestHospital);
       // print('Hospital Data:: ${response.body}');
        // return data;

        return Right(TermsM(
          dataList: data.obj,
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

class TermsM {
  var dataList;
  TermsM({this.dataList});
}
