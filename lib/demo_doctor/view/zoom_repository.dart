import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/demo_doctor/view/zoom_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
class ZoomDemoDoctorRepository {
  Future<Either<AppError, Upcoming>> fetchZoomLinkHistory() async {
    var url ='https://raw.githubusercontent.com/Kakon007/jobap/main/job.json';

    try {
      var client = http.Client();
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        ZoomApiModel data = zoomApiModelFromJson(response.body);
        //CacheRepositories.setCacheAsDecodeJson(response.body, CacheKeys.appointmentHistoryUpcomingList);
        return Right(Upcoming(dataList: data.items));
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

class Upcoming {
  List<ZoomAPI> dataList = new List();
  int totalCount;
  Upcoming({this.dataList, this.totalCount});
}
