import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/auth/model/term_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';

class TermsRepositry {
  Future<Either<AppError, TermsM>> fetchTerms() async {
    try {
      var request = http.Request('GET', Uri.parse('https://qa.myhealthbd.com:9096/online-appointment-api/fapi/trems-condition/get-terms-conditions'));
      request.body = '''''';

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body=await response.stream.bytesToString();
        TermsModel data = termsModelFromJson(body);
        return Right(TermsM(
          dataList: data.obj,
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

class TermsM {
  var dataList;
  TermsM({this.dataList});
}
