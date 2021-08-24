import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/doctor/features/profile/models/designation_model.dart';
import 'package:myhealthbd_app/doctor/features/profile/models/personal_info_model.dart';
import 'package:myhealthbd_app/doctor/features/profile/models/specialization_name_model.dart';
import 'package:myhealthbd_app/doctor/features/profile/view_model/digital_signature_view_model.dart';
import 'package:myhealthbd_app/doctor/features/profile/view_model/personal_info_view_model.dart';
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
    var companyNo = Provider.of<PersonalInfoViewModel>(appNavigator.context,listen: false).personalInfoData.companyNo;
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
    var companyNo = Provider.of<PersonalInfoViewModel>(appNavigator.context,listen: false).personalInfoData.companyNo;
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
  Future updatePersonalInfo({String name, String designation , String specializationNo,String degree, String signature, String mobile, String email }) async {
    var personalInfoVm = PersonalInfoViewModel.read(appNavigator.context);
    var personalInfo = personalInfoVm.personalInfoData;
    print(personalInfo.phoneMobile);
    print(degree);
    var body ={
      "companyNo":personalInfo.companyNo,
      "organizationNo":personalInfo.organizationNo,
      "doctorNo":personalInfo.doctorNo,
      "doctorId":personalInfo.doctorId,
      "salutation":personalInfo.salutation,
      "firstName":personalInfo.firstName,
      "doctorName":name,
      "fatherName":personalInfo.fatherName,
      "motherName":personalInfo.motherName,
      "spouseName":personalInfo.spouseName,
      "gender":personalInfo.gender,
      "maritalStatus":personalInfo.maritalStatus,
      "dob":personalInfo.dob,
      "buNo":personalInfo.buNo,
      "joinDate":personalInfo.joinDate,
      "jobTitleNo":220000000003,
      "activeStatus":personalInfo.activeStatus,
      "bloodGroup":personalInfo.bloodGroup,
      "religion":personalInfo.religion,
      "phoneHome":personalInfo.phoneHome,
      "phoneMobile":mobile,
      "altMobileNo":personalInfo.altMobileNo,
      "phoneOffice":personalInfo.phoneOffice,
      "nationalId":personalInfo.nationalId,
      "drivingLcNo":personalInfo.drivingLcNo,
      "placeOfBirth":personalInfo.placeOfBirth,
      "height":personalInfo.height,
      "heightUnit":personalInfo.heightUnit,
      "weight":personalInfo.weight,
      "weightUnit":personalInfo.weightUnit,
      "blackListFlag":personalInfo.blackListFlag,
      "vipFlag":personalInfo.vipFlag,
      "athleticFlag":personalInfo.athleticFlag,
      "concealFlag":personalInfo.concealFlag,
      "bdmcRegNo":personalInfo.bdmcRegNo,
      "bdmcRegDate":personalInfo.bdmcRegDate,
      "description":personalInfo.description,
      "nationality":personalInfo.nationality,
      "emailPersonal":email,
      "emailOfficial":personalInfo.emailOfficial,
      "ssNo":personalInfo.ssNo,
      "faxNo":personalInfo.faxNo,
      "cardNo":personalInfo.cardNo,
      "address":personalInfo.address,
      "preAddress":personalInfo.preAddress,
      "preVillage":personalInfo.preVillage,
      "preUnion":personalInfo.preUnion,
      "prePoffice":personalInfo.prePoffice,
      "preThana":personalInfo.preThana,
      "preDistrict":personalInfo.preDistrict,
      "preDivision":personalInfo.preDivision,
      "preProvince":personalInfo.preProvince,
      "preCountry":personalInfo.preCountry,
      "specialityNo":220000000217,
      "offDayRemarks":personalInfo.offDayRemarks,
      "doctorSignature":signature,
      "chamberAddress1":personalInfo.chamberAddress1,
      "chamberAddress2":personalInfo.chamberAddress2,
      "chamberAddress3":personalInfo.chamberAddress3,
      "qualification":personalInfo.qualification,
      "docDegree":degree,
      "remarks":personalInfo.remarks,
      "docDgtlSing":personalInfo.docDgtlSing,
      "consultationFee":personalInfo.consultationFee,
      "onlineDoctorFlag":personalInfo.onlineDoctorFlag,
      "photo":personalInfo.photo,
      "doctorNoList":personalInfo.doctorNoList,
      "buNoList":personalInfo.buNoList,
      "doctorsNo":personalInfo.doctorsNo,
      "allPresciptionDoctorFlag":personalInfo.allPresciptionDoctorFlag,
      "likeDocName":personalInfo.likeDocName,
      "specializationName":personalInfo.specializationName,
      "lname":personalInfo.lname,
      "passportNo":personalInfo.passportNo,
      "tinNo":personalInfo.tinNo,
      "mname":personalInfo.mname
   };
    var response = await ApiClient().putRequest(
      "auth-api/api/doctor/update",body);
    print(response.body);
    try {
      if (response.statusCode == 200) {
        return Right(response.statusCode.toString());
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
