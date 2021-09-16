import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/user_profile/models/change_password_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';
import 'package:provider/provider.dart';

class ChangePasswordRepository {
  Future<Either<AppError, ChangePasswordModel>> fetchPassword(String newPassword, String confirmPassword, String currentPassword) async {
     BotToast.showLoading();
    var accessToken = Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken;
    var headers = {'Authorization': 'Bearer $accessToken', 'Content-Type': 'application/json'};

    try {
      final http.Response response = await http.post(
        Uri.parse('${Urls.baseUrl}auth-api/api/changePassword'),
        headers: headers,
        body: jsonEncode(<String, String>{
          "newPassword": newPassword,
          "confirmPassword": confirmPassword,
          "currentPassword": currentPassword
        }),
      );
      if (response.statusCode == 200) {
        ChangePasswordModel data2 = changePasswordModelFromJson(response.body);
        BotToast.closeAllLoading();
        return Right(ChangePasswordModel(
          message: data2.message,
        ));
      } else {
        BotToast.closeAllLoading();
        return Left(AppError.serverError);
      }
    } on SocketException catch (e) {
      //logger.e(e);
      BotToast.closeAllLoading();
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    } catch (e) {
      BotToast.closeAllLoading();
      return Left(AppError.unknownError);
    }
  }
}
