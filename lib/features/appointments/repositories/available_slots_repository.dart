import 'dart:convert';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/appointments/models/available_slots_model.dart';
import 'package:myhealthbd_app/features/appointments/models/slot_status.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';

class AvailableSlotsRepository {

  Future<Either<AppError, AvailableSlotListModel>>   fetchSlotInfo(DateTime pickedAppointDate,String companyNo, String doctorNo, String orgNo ) async {

    var url =
        "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/getAvailableSlot";
    final http.Response response = await http.post(url,body: jsonEncode(<String, String>{
      "appointDate": DateFormat("yyyy-MM-dd").format(pickedAppointDate).toString(),
      "companyNo": companyNo,
      "doctorNo": doctorNo,
      "ogNo": orgNo
    }),);
    //print(response.body);
      try {
        if (response.statusCode == 200) {
          print("aaaaaaaaaaadsdsdsdsdsa");
          print(response.body);
          AvailableSlotModel data = availableSlotModelFromJson(response.body);
          //print("shakil" + data.items[1].doctorNo.toString());
          return Right(AvailableSlotListModel(
            slotList: data.items,
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




  Future<Either<AppError, SlotCheckModel>>   fetchStatus( String slotNo,String companyNo, String orgNo ) async {

    var url =
        "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/appointment/checkSlotStatus";
    final http.Response response = await http.post(url,body: jsonEncode(<String, String>{
      "slotNo": slotNo,
      "companyNo": companyNo,
      "ogNo": orgNo
    }),);
    print(response.body);
    try {
      if (response.statusCode == 200) {
        print("aaaaaaaaaaadsdsdsdsdsa");
        print(response.body);
        SlotStatusModel data = slotStatusModelFromJson(response.body);
        return Right(SlotCheckModel(
          slotStatus: data.model.status
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
    }      // BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.unknownError);
    }
}



class AvailableSlotListModel {
  List<Items> slotList = new List<Items>();

  AvailableSlotListModel({this.slotList});
}
class SlotCheckModel {
  String slotStatus;

  SlotCheckModel({this.slotStatus});
}