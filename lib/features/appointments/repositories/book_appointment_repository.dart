import 'dart:convert';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/appointments/models/available_slots_model.dart';
import 'package:myhealthbd_app/features/appointments/models/book_appointment_model.dart';
import 'package:myhealthbd_app/features/appointments/models/consultation_type_model.dart';
import 'package:myhealthbd_app/features/appointments/models/patient__fee.dart';
import 'package:myhealthbd_app/features/appointments/models/patient_type_model.dart';
import 'package:myhealthbd_app/features/appointments/models/slot_status.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';

class BookAppointmentRepository {

  Future<Either<AppError, BookAppointmentModel>>  fetchAppointmentData(
      String doctorNo,
      String doctorName,
      String appointDate,
      String shiftdtlNo,
      String shift,
      String slotNo,
      String slotSl,
      String startTime,
      String endTime,
      String durationMin,
      String extraSlot,
      String slotSplited,
      String ssCreatedOn,
      String ssCreator,
      String remarks,
      String appointStatus,
      String companyNo,
      String ogNo,
      String patientType,
      String consultationType,
      String opdConsultationFee,
      String fname,
      String phoneMobile,
      String gender,
      String address,
      String email,
      String dob,
      String paymodeNo,
      ) async {
   var url = "${Urls.buildUrl}online-appointment-api/fapi/appointment/bookAppointment";
   print("Shakil" + ssCreator);
    try {
      final http.Response response = await http.post(url,body: jsonEncode(<String, dynamic>{

        "doctorNo": doctorNo,
        "doctorName": doctorName,
        "appointDate": appointDate,
        "shiftdtlNo": shiftdtlNo,
        "shift":shift,
        "slotNo": slotNo,
        "slotSl": slotSl,
        "startTime" : startTime,
        "endTime": endTime,
        "durationMin": durationMin,
        "extraSlot": extraSlot,
        "slotSplited": slotSplited,
        "ssCreatedOn": ssCreatedOn,
        "ssCreator": ssCreator,
        "remarks": remarks,
        "appointStatus": appointStatus,
        "companyNo": companyNo,
        "ogNo": ogNo,
        "patientType": patientType,
        "consultationType": consultationType,
        "opdConsultationFee":opdConsultationFee,
        "fname": fname,
        //"ageYy": "30",
        "phoneMobile":phoneMobile,
        "gender": gender,
        "address":address,
        "email":email,
        "dob": dob,
        "paymodeNo":paymodeNo ,
        "paymentArray": [],
        "appointType": "Internet"
      }),);
      if (response.statusCode == 200) {
        print(response.body);
        BookAppointmentModel data = bookAppointmentModelFromJson(response.body);
        //BotToast.closeAllLoading();
        return Right(BookAppointmentModel(
          message: data.message,
        ));
      } else {
       // BotToast.closeAllLoading();
         BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    } on SocketException catch (e) {
      //BotToast.closeAllLoading();
      //logger.e(e);
       BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    } catch (e) {
     // BotToast.closeAllLoading();
      //logger.e(e);
    }       BotToast.showText(text: StringResources.somethingIsWrong);
    return Left(AppError.unknownError);
  }

}