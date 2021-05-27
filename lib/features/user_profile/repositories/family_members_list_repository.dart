import 'dart:convert';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/appointments/models/available_slots_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/user_profile/models/add_family_member_model.dart';
import 'package:myhealthbd_app/features/user_profile/models/get_family_member_model.dart';
import 'package:myhealthbd_app/features/user_profile/models/member_delete_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';
import 'package:provider/provider.dart';

class FamilyMembersList {

  Future<Either<AppError, GetFamilyMember>>   fetchFamilyMembersList(String regId) async {
    var accessToken = Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken;
    var url =
        "${Urls.buildUrl}diagnostic-api/api/familyMember/gridList?draw=1&columns[0][data]=fmName&columns[0][name]=fmName&columns[0][searchable]=true&columns[0][orderable]=true&columns[0][search][value]&columns[0][search][regex]=false&columns[1][data]=fmRegId&columns[1][name]=fmRegId&columns[1][searchable]=true&columns[1][orderable]=true&columns[1][search][value]&columns[1][search][regex]=false&columns[2][data]=relationName&columns[2][name]=relationName&columns[2][searchable]=true&columns[2][orderable]=true&columns[2][search][value]&columns[2][search][regex]=false&columns[3][data]=fmAge&columns[3][name]&columns[3][searchable]=true&columns[3][orderable]=true&columns[3][search][value]&columns[3][search][regex]=false&columns[4][data]=fmAddress&columns[4][name]=fmAddress&columns[4][searchable]=true&columns[4][orderable]=true&columns[4][search][value]&columns[4][search][regex]=false&order[0][column]=0&order[0][dir]=asc&start=0&length=30&search[value]&search[regex]=false&regId=$regId&_=1621949211472";
    final http.Response response = await http.get(Uri.parse(url),headers: {'Authorization': 'Bearer $accessToken',},);
    print(response.body);
    try {
      if (response.statusCode == 200) {
        print("aaaaaaaaaaadsdsdsdsdsa");
        print(response.body);
        GetFamilyMember data = getFamilyMemberFromJson(response.body);
        return Right(GetFamilyMember(
          items: data.items
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
      // BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.unknownError);
    }
  }
  Future<Either<AppError, MemberDeleteModel>>   updateMember(String id, String relation) async {
    var accessToken = Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken;
    var url =
        "${Urls.buildUrl}diagnostic-api/api/familyMember/update";
    final http.Response response = await http.put(Uri.parse(url),headers: {'Authorization': 'Bearer $accessToken',},body: jsonEncode(<String, dynamic>{
      "id":id,
      "relation":relation
    }));
    print(response.body);
    try {
      if (response.statusCode == 200) {
        MemberDeleteModel data = memberDeleteModelFromJson(response.body);
        return Right(MemberDeleteModel(
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
  Future<Either<AppError, MemberDeleteModel>>   deleteMember(String id) async {
    var accessToken = Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken;
    var url =
        "${Urls.buildUrl}diagnostic-api/api/familyMember/delete?id=$id";
    final http.Response response = await http.delete(Uri.parse(url),headers: {'Authorization': 'Bearer $accessToken',});

    print(response.body);
    try {
      if (response.statusCode == 200) {
    MemberDeleteModel data = memberDeleteModelFromJson(response.body);
        return Right(MemberDeleteModel(
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
