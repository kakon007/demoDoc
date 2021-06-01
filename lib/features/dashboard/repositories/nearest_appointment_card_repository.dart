import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/dashboard/model/nearest_appointment_card_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
class NearestAppointmentRepository {
  Future<Either<AppError, NearestAppointmentM>> fetchNearestAppointmentDetails({String accessToken,String regID}) async {
    print('Hellollll');
    var headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'text/plain'
    };
    var request = http.Request('GET', Uri.parse('https://qa.myhealthbd.com:9096/diagnostic-api/api/opd-appointments/nearest-appointment'));
    request.body = '''{\n    "regId": "$regID"\n}\n''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('nes Res'+response.statusCode.toString());

    try {
      // var client = http.Client();
      // var response = await client.get(Uri.parse(url), headers: {
      //   'Authorization': 'Bearer $accessToken',
      // });

      if (response.statusCode == 200) {
        var body=await response.stream.bytesToString();
        NearestAppointmentCardModel data2 = nearestAppointmentCardModelFromJson(body);
        print('User Details Data:: ' + data2.obj.regId);
        print(body);
        return Right(NearestAppointmentM(
          dataList: data2.obj,
        ));
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


class NearestAppointmentM {
  Obj dataList = new Obj();
  NearestAppointmentM({this.dataList});
}
