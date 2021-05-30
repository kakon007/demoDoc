import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/features/my_health/models/prescription_list_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';

class PrescriptionRepository {
  Future<Either<AppError, PrescriptioM>> fetchPrescriptionList(
      {String accessToken, var page, String query, int startIndex = 0}) async {
    var url =
        "${Urls.buildUrl}diagnostic-api/api/pat-investigation-report/patient-prescription-list?draw=$page&columns%5B0%5D%5Bdata%5D=consultationId&columns%5B0%5D%5Bname%5D=consultationId&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=prescriptionDateTime&columns%5B1%5D%5Bname%5D=prescriptionDateTime&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=doctorName&columns%5B2%5D%5Bname%5D=doctorName&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=companyName&columns%5B3%5D%5Bname%5D=companyName&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=&columns%5B4%5D%5Bname%5D=&columns%5B4%5D%5Bsearchable%5D=true&columns%5B4%5D%5Borderable%5D=true&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=desc&start=$startIndex&length=10&search%5Bvalue%5D=$query&search%5Bregex%5D=false&_=1617439318994";

    try {
      var client = http.Client();
      var response = await client.get(Uri.parse(url), headers: {
        'Authorization': 'Bearer $accessToken',
      });
      if (response.statusCode == 200) {
        PrescriptionListModel data = prescriptionListModelFromJson(response.body);
        print('Dataaaaaaa:: ' + data.obj.data.first.consultationId);

        return Right(
            PrescriptioM(dataListofPrescription: data.obj.data, totalCount: data.obj.recordsTotal));
        //print(data[0]['companySlogan']);
      } else {
        BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    } on SocketException catch (e) {
      print("FromprescriptionRepo:::" + e.toString());
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    } catch (e) {
      BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.unknownError);
    }
  }
}

class PrescriptioM {
  List<Datum> dataListofPrescription = List<Datum>();
  int totalCount;
  PrescriptioM({this.dataListofPrescription, this.totalCount});
}
