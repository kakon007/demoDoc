import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/user_profile/models/add_family_member_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';
import 'package:provider/provider.dart';

class AddFamilyMemberRepository {

  Future<Either<AppError, AddFamilyMemberModel>>   addFamilyMember(String regId, String regNo,
      String relation, String relatedRegNo) async {
    var accessToken = Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken;
    var url =
        "${Urls.baseUrl}diagnostic-api/api/familyMember/create";
    final http.Response response = await http.post(Uri.parse(url),headers: {'Authorization': 'Bearer $accessToken',},body: jsonEncode(<String, String>{
      "regId":regId,
      "regNo":regNo,
      "relation":relation,
      "relatedRegNo":relatedRegNo,
      "activeStatus":"1"
    }),);
  //  print(response.body);
    try {
      if (response.statusCode == 200) {
        AddFamilyMemberModel data = addFamilyMemberModelFromJson(response.body);
        return Right(AddFamilyMemberModel(
          message: data.message
        ));
      } else {
        BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    } on SocketException catch (e) {
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    } catch (e) {
      return Left(AppError.unknownError);
    }
  }
}