
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/features/notification/models/notification_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';

class NotificationRepository {
  Future<Either<AppError, NotificationM>> fetchNotificationList(
      {String accessToken, var userName, String deviceToken}) async {
   // var url =
        // "${Urls.baseUrl}diagnostic-api/api/pat-investigation-report/patient-prescription-list?draw=$page&columns%5B0%5D%5Bdata%5D=consultationId&columns%5B0%5D%5Bname%5D=consultationId&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=prescriptionDateTime&columns%5B1%5D%5Bname%5D=prescriptionDateTime&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=doctorName&columns%5B2%5D%5Bname%5D=doctorName&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=companyName&columns%5B3%5D%5Bname%5D=companyName&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=&columns%5B4%5D%5Bname%5D=&columns%5B4%5D%5Bsearchable%5D=true&columns%5B4%5D%5Borderable%5D=true&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=desc&start=$startIndex&length=10&search%5Bvalue%5D=$query&search%5Bregex%5D=false&_=1617439318994";

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'text/plain'
      };
      var request = http.Request('POST', Uri.parse('${Urls.baseUrl}diagnostic-api/api/notification/notification-list-by-user'));
      request.body = '''{\n        "userName": "$userName",\n        "deviceToken": "$deviceToken"   \n}\n\n''';
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body=await response.stream.bytesToString();
        NotificationListModel data = notificationListModelFromJson(body);
        print('BizDev ${data.items[1].messageTitle}');

        return Right(
            NotificationM(dataListofNotification: data.items));
      } else {
        // BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    } on SocketException catch (e) {
      print("FromNotificationRepo:::" + e.toString());
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    } catch (e) {
      // BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.unknownError);
    }
  }
}

class NotificationM {
  List<Item> dataListofNotification = List<Item>();
  int totalCount;
  NotificationM({this.dataListofNotification, this.totalCount});
}
