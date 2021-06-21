import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:myhealthbd_app/features/news/model/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/user_profile/models/change_password_model.dart';
import 'package:myhealthbd_app/features/user_profile/models/userDetails_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';

class ChangePasswordRepository {
  Future<Either<AppError, ChangePasswordModel>> fetchPassword(String accessToken,
      String newPassword, String confirmPassword, String currentPassword) async {
    var url = 'https://qa.myhealthbd.com:9096/auth-api/api/changePassword';
    var headers = {'Authorization': 'Bearer $accessToken', 'Content-Type': 'application/json'};

    try {
      final http.Response response = await http.post(
        Uri.parse('https://qa.myhealthbd.com:9096/auth-api/api/changePassword'),
        headers: headers,
        body: jsonEncode(<String, String>{
          "newPassword": newPassword,
          "confirmPassword": confirmPassword,
          "currentPassword": currentPassword
        }),
      );
      if (response.statusCode == 200) {
        print(response.body);
        ChangePasswordModel data2 = changePasswordModelFromJson(response.body);
        return Right(ChangePasswordModel(
          message: data2.message,
        ));
      } else {
       // BotToast.showText(text: StringResources.somethingIsWrong);
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
