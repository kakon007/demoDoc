import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/features/appointments/models/patient__fee.dart';
import 'package:myhealthbd_app/features/appointments/repositories/available_slots_repository.dart';
import 'package:myhealthbd_app/features/auth/model/sign_in_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';

class AuthRepository{

  Future<Either<AppError, SignInModel>>   fetchFee(String user, String pass ) async {
    String username = 'telemedCareIdPassword';
    String password = 'secret';
    String basicAuth = 'Basic ' +
        base64Encode(
            utf8.encode('$username:$password'));
    String url =
        "${Urls.buildUrl}auth-api/oauth/token?username=$user&password=$pass&grant_type=password";
    var response = await http.post(url,
        headers: <String, String>{
          'authorization': basicAuth
        });
      if (response.statusCode == 200) {
        print(response.body);
        SignInModel data = signInModelFromJson(response.body);
        return Right(SignInModel(
          accessToken: data.accessToken.toString(),
        ));
      } else {
        // BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    }        // BotToast.showText(text: StringResources.somethingIsWrong);
}