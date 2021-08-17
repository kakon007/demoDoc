import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/auth/model/reset_passwod_model.dart';
import 'package:myhealthbd_app/features/auth/model/sign_in_model.dart';
import 'package:myhealthbd_app/features/auth/model/sign_out_model.dart';
import 'package:myhealthbd_app/features/auth/model/sign_up_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';

class AuthRepository {
  Future<Either<AppError, SignInModel>> fetchAuthData(String user, String pass) async {
    String username = 'telemedCareIdPassword';
    String password = 'secret';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    String url =
        "${Urls.baseUrl}auth-api/oauth/token?username=$user&password=$pass&grant_type=password";
    var response =
        await http.post(Uri.parse(url), headers: <String, String>{'authorization': basicAuth});
    print(response.body);
    if (response.statusCode == 200) {
      SignInModel data = signInModelFromJson(response.body);
      return Right(SignInModel(
        accessToken: data.accessToken.toString(),
      ));
    } else {
      return Left(AppError.serverError);
    }
  }

  Future<Either<AppError, SignOutModel>> fetchSignOutInfo(String accessToken) async {
    String url = "${Urls.baseUrl}auth-api/oauth/token/logout";
    var response = await http.delete(Uri.parse(url), headers: {
      'Authorization': 'Bearer $accessToken',
    });
    //print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      SignOutModel data = signOutModelFromJson(response.body);
      return Right(SignOutModel(
        message: data.message.toString(),
      ));
    } else {
      return Left(AppError.serverError);
    }
  }

  Future<dynamic> fetchSignUpInfo(String name, String email, String mobile, String address,
      String selectedGender, String formatDate2) async {
    String salutation;
    if (selectedGender == "Male") {
      selectedGender = "M";
      salutation = "Mr.";
    }
    if (selectedGender == "Female") {
      selectedGender = "F";
      salutation = "Mrs.";
    }
    print(name);
    print(email);
    print(mobile);
    print(address);
    print(selectedGender);
    print(formatDate2);
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            '${Urls.baseUrl}online-appointment-api/fapi/registration/create-with-image'));
    request.fields.addAll({
      'reqobj': json.encode({
        "opdReg": {
          "salutation": salutation,
          "fname": name,
          "lname": "",
          "dob": formatDate2,
          "gender": selectedGender,
          "phoneMobile": mobile,
          "email": email,
          "address": address,
          "companyNo": "1",
          "organizationNo": "1"
        },
        "opdRegOthers": {}
      })
    });
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = response.stream.bytesToString();
      SignUpModel data = signUpModelFromJson(await body);
      return body;
    }
    else{
      BotToast.closeAllLoading();
    }
  }

  Future<Either<AppError, ResetPasswordModel>> fetchResetInfo(String userName, String email) async {
    BotToast.showLoading();
    String url =
        "${Urls.baseUrl}online-appointment-api/fapi/registration/forgot-password";
    final http.Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(<String, String>{
        "userName"  : userName,
        "userEmail" : email
      }),
    );
    if (response.statusCode == 200) {
      print(response.body);
      BotToast.closeAllLoading();
      ResetPasswordModel data = resetPasswordModelFromJson(response.body);
      print("data $data");
      return Right(data);
    } else {
      print('abs');
      BotToast.closeAllLoading();
      return Left(AppError.serverError);
    }
  }
}

class SignUpInfoModel {
  String username;
  String password;
  SignUpInfoModel({this.username, this.password});
}
