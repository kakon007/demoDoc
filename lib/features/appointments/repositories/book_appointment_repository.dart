import 'dart:convert';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/appointments/models/book_appointment_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';
import 'package:provider/provider.dart';

class BookAppointmentRepository {
  Future<Either<AppError, BookAppointmentModel>> fetchAppointmentData(
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
    String regNo,
  ) async {
    var url = "${Urls.baseUrl}diagnostic-api/api/opd-appointments/create";
    print("Shakil" + regNo);
    print('slotNo $slotNo');
    try {
      final http.Response response = await http.post(
        Uri.parse(url),headers: {'Authorization': 'Bearer ${Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken}',},
        body: regNo!=''? jsonEncode(<String, dynamic>{
          "doctorNo": doctorNo,
          "doctorName": doctorName,
          "appointDate": appointDate,
          "shiftdtlNo": shiftdtlNo,
          "shift": shift,
          "slotNo": slotNo,
          "slotSl": slotSl,
          "startTime": startTime,
          "endTime": endTime,
          "durationMin": durationMin,
          "extraSlot": extraSlot,
          "slotSplited": slotSplited,
          "ssCreatedOn": ssCreatedOn,
          "ssCreator": ssCreator,
          "remarks": remarks,
          "appointStatus": "1",
          "companyNo": companyNo,
          "ogNo": ogNo,
          "patientType": patientType,
          "consultationType": consultationType,
          "opdConsultationFee": opdConsultationFee,
          "fname": fname,
          "phoneMobile": phoneMobile,
          "gender": gender,
          "address": address,
          "email": email,
          "dob": dob,
          "paymodeNo": paymodeNo,
          "paymentArray": [],
          "appointType": "Internet",
          "regNo": regNo,
        }) : jsonEncode(<String, dynamic>{
          "doctorNo": doctorNo,
          "doctorName": doctorName,
          "appointDate": appointDate,
          "shiftdtlNo": shiftdtlNo,
          "shift": shift,
          "slotNo": slotNo,
          "slotSl": slotSl,
          "startTime": startTime,
          "endTime": endTime,
          "durationMin": durationMin,
          "extraSlot": extraSlot,
          "slotSplited": slotSplited,
          "ssCreatedOn": ssCreatedOn,
          "ssCreator": ssCreator,
          "remarks": remarks,
          "appointStatus": "1",
          "companyNo": companyNo,
          "ogNo": ogNo,
          "patientType": patientType,
          "consultationType": consultationType,
          "opdConsultationFee": opdConsultationFee,
          "fname": fname,
          "phoneMobile": phoneMobile,
          "gender": gender,
          "address": address,
          "email": email,
          "dob": dob,
          "paymodeNo": paymodeNo,
          "paymentArray": [],
          "appointType": "Internet",
        }) ,
      );
      //print('body ${response.body}');
      if (response.statusCode == 200) {
        BookAppointmentModel data = bookAppointmentModelFromJson(response.body);
        return Right(BookAppointmentModel(
          message: data.message,
        ));
      } else {
        BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    } on SocketException catch (e) {
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    } catch (e) {
    }
    BotToast.showText(text: StringResources.somethingIsWrong);
    return Left(AppError.unknownError);
  }
}
