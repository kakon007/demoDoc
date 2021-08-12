import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/features/appointment_history/models/zoom_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';

class ZoomRepository {
  Future<Either<AppError, ZoomM>> fetchZoomLink({String accessToken, String consultationId}) async {
    var url =
        '${Urls.baseUrl}diagnostic-api/api/videoConference/getMeetingByConsultationID';
    var headers = {
      'Authorization': 'Bearer $accessToken',
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(<String, String>{"consultationId": consultationId}),
      );
      if (response.statusCode == 200) {
        print(response.body);
        ZoomModel data2 = zoomModelFromJson(response.body);
        return Right(ZoomM(
          dataList: data2.obj,
          message: data2.success,
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
      return Left(AppError.unknownError);
    }
  }
}

class ZoomM {
  Obj dataList;
  bool message;
  ZoomM({this.dataList, this.message});
}
