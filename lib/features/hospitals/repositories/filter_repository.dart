import 'dart:convert';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/hospitals/models/department_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/specialization_list_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';

class FilterRepository {
  Future<Either<AppError, DepartmentListModel>> fetchDepartment(String companyNo) async {
    var url =
        "${Urls.baseUrl}online-appointment-api/fapi/appointment/departmentList?companyNo=$companyNo&flagList=2,3";
    try {
      var client = http.Client();
      var response = await client.get(Uri.parse(url));
      print(response.body);
      if (response.statusCode == 200) {
        DeptListModel data = deptListModelFromJson(response.body);
        return Right(DepartmentListModel(
          deptList: data.deptItem,
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
      BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.unknownError);
    }
  }

  Future<Either<AppError, SpecialistListModel>> fetchSpeciality(String id, String orgNo) async {
    var url = "${Urls.baseUrl}online-appointment-api/fapi/appointment/specializationList";
    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(<String, String>{'id': id, "ogNo": orgNo}),
      );
      if (response.statusCode == 200) {
        SepcializationListModel data = sepcializationListModelFromJson(response.body);
        //print('Dataaaaaaa:: ' + data.specializationItem[5].dtlName);
        return Right(SpecialistListModel(
          specialList: data.specializationItem,
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
      BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.unknownError);
    }
  }
}

class DepartmentListModel {
  List<DeptItem> deptList = new List<DeptItem>();
  DepartmentListModel({this.deptList});
}

class SpecialistListModel {
  List<SpecializationItem> specialList = List<SpecializationItem>();
  SpecialistListModel({this.specialList});
}
