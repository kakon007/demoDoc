import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/doctor/features/profile/models/designation_model.dart';
import 'package:myhealthbd_app/doctor/features/profile/models/personal_info_model.dart';
import 'package:myhealthbd_app/doctor/features/profile/models/specialization_name_model.dart';
import 'package:myhealthbd_app/doctor/features/profile/view_model/doctor_profile_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/user_profile/models/add_family_member_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';
import 'package:provider/provider.dart';

class PersonalInfoRepository {

  Future<Either<AppError, PersonalInfoModel>>   fetchPersonalInfo() async {
    var accessToken = Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken;
    var url =
        "${Urls.baseUrl}auth-api/api/doctor/findDoctorByNo?doctorNo=2000011";
    final http.Response response = await http.get(Uri.parse(url),headers: {'Authorization': 'Bearer $accessToken',},);
    print(response.body);
    try {
      if (response.statusCode == 200) {
        PersonalInfoModel data = personalInfoModelFromJson(response.body);
        return Right(data);
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
  Future<Either<AppError, SpecializationNameModel>>   fetchSpecializationName() async {
    var companyNo = Provider.of<DoctorProfileViewModel>(appNavigator.context,listen: false).personalInfoData.companyNo;
    var response = await ApiClient().getRequest(
        "auth-api/api/doctor/initEmployeeSetupLists/$companyNo",);
    print(response.body);
    try {
      if (response.statusCode == 200) {
        SpecializationNameModel data = specializationNameModelFromJson(response.body);
        return Right(data);
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
  Future<Either<AppError, DesignationModel>>   fetchDesignationList() async {
    var companyNo = Provider.of<DoctorProfileViewModel>(appNavigator.context,listen: false).personalInfoData.companyNo;
    var response = await ApiClient().getRequest(
      "auth-api/api/employee/jobtitle/list/$companyNo",);
    print(response.body);
    try {
      if (response.statusCode == 200) {
        DesignationModel data = designationModelFromJson(response.body);
        return Right(data);
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
