import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/doctor/features/dashboard/models/consult_status_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';

class ConsultationStatusRepository {
  Future<Either<AppError, ConsultationStatusModel>> fetchConsultationData() async {
    // var url =
    //     "${Urls.baseUrl}prescription-service-api/api/prescription/getTemplateListByDoctor";
    try {
      var body = {
        "shiftdtlNo":null,
        "fromDate":DateFormat('yyyy-MM-dd').format(DateTime.now()),
        "toDate":DateFormat('yyyy-MM-dd').format(DateTime.now())
      };
      print(DateFormat('yyyy-MM-dd').format(DateTime.now()));
      var response = await ApiClient().postRequest(
          "prescription-service-api/api/consultation/doctor-wise-consultation-status",body);
      print('status ${response.body}');
      if (response.statusCode == 200) {
        var body=response.body;
        ConsultationStatusModel data = consultationStatusModelFromJson(body);
        return Right(data);
      } else {
        return Left(AppError.serverError);
      }
    } on SocketException catch (e) {
      print("FromprescriptionTemplateRepo:::" + e.toString());
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    } catch (e) {
      return Left(AppError.unknownError);
    }
  }
}
