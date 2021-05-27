import 'dart:convert';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/hospitals/models/department_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/specialization_list_model.dart';
import 'package:myhealthbd_app/features/user_profile/models/registered_members_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';
import 'package:provider/provider.dart';
class RegisteredMembersRepository{
  Future<Either<AppError, RegisteredMembersModel>>   fetchMembers(String regId, String patName) async {
    if(regId==null){
      regId= "";
    }
    if(patName==null){
      patName= "";
    }
    var accessToken = Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken;
    var url =
        "${Urls.buildUrl}diagnostic-api/api/opd-registration/patientListByIdName";
    final http.Response response = await http.post(url,headers: {'Authorization': 'Bearer $accessToken',}, body: jsonEncode(<String, String>{
      "regId":regId,
      "patientName":patName
    }),);
    try {
      if (response.statusCode == 200) {
        print(response.body);
        RegisteredMembersModel data = registeredMembersModelFromJson(response.body);
        return Right(RegisteredMembersModel(
          items: data.items,
        ));
      } else {
        BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    } on SocketException catch (e) {
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    } catch (e) {
      //logger.e(e);
      // BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.unknownError);
    }
  }
}