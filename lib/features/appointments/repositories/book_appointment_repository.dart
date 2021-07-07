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
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';
import 'package:provider/provider.dart';

class BookAppointmentRepository {
//
//   Future<Either<AppError, BookAppointmentModel>>  fetchAppointmentData(
//   {
//   String doctorNo,
//   String appointDate,
//   String shiftdtlNo,
//   String regNo,
//   String patientType,
//   String fname,
//   String phoneMobile,
//   String email,
//   String dob,
//   String gender,
//   String address,
//   String consultationType,
//   String appointType,
//   String  appointStatus,
//       String appFromFlag,
//   String remarks,
//       String slotNo,
//   String slotSl,
//       String startTime,
//   String endTime,
// }
//       ) async {
//     var url = "https://qa.myhealthbd.com:9096/diagnostic-api/api/opd-appointments/create";
//     print("Abir" + appointDate);
//     try {
//       final http.Response response = await http.post(Uri.parse(url),headers: {'Authorization': 'Bearer ${Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken}',}, body: jsonEncode(<String, dynamic>{
//         "doctorNo": doctorNo,
//         "appointDate": appointDate,
//         "shiftdtlNo": shiftdtlNo,
//         "regNo": regNo,
//         "patientType": patientType,
//         "fname":fname,
//         "phoneMobile":phoneMobile,
//         "email":email,
//         "dob":dob,
//         "gender":gender,
//         "address":address,
//         "consultationType":consultationType,
//         "appointType":appointType,
//         "appointStatus":appointStatus,
//         "appFromFlag":appFromFlag,
//         "remarks":remarks,
//         "slotNo":slotNo,
//         "slotSl":slotSl,
//         "startTime":startTime,
//         "endTime":endTime
//       }),);
//       if (response.statusCode == 200) {
//         print(response.body);
//         BookAppointmentModel data = bookAppointmentModelFromJson(response.body);
//         //BotToast.closeAllLoading();
//         return Right(BookAppointmentModel(
//           message: data.message,
//         ));
//       } else {
//         // BotToast.closeAllLoading();
//         BotToast.showText(text: StringResources.somethingIsWrong);
//         return Left(AppError.serverError);
//       }
//     } on SocketException catch (e) {
//       //BotToast.closeAllLoading();
//       //logger.e(e);
//       BotToast.showText(text: StringResources.unableToReachServerMessage);
//       return Left(AppError.networkError);
//     } catch (e) {
//       // BotToast.closeAllLoading();
//       //logger.e(e);
//     }       BotToast.showText(text: StringResources.somethingIsWrong);
//     return Left(AppError.unknownError);
//   }
//   Future<Either<AppError, BookAppointmentModel>> fetchAppointmentData(
//       {   String doctorNo,
//   String appointDate,
//   String shiftdtlNo,
//   String regNo,
//   String patientType,
//   String salutation,
//   String fname,
//   String phoneMobile,
//   String email,
//   String dob,
//   String ageDd,
//   String ageMm,
//   String ageYy,
//   String gender,
//   String mStatus,
//   String bloodGroup,
//   String address,
//   String consultationType,
//   String appointType,
//   String appointStatus,
//   String appFromFlag,
//   String remarks,
//   String slotNo,
//   String slotSl,
//   String startTime,
//         String endTime
// }
//       ) async {
//     var url = "${Urls.baseUrl}diagnostic-api/api/opd-appointments/create";
//     print('doctor $doctorNo');
//     print('appointDate $appointDate');
//     print('shiftdtlNo $shiftdtlNo');
//     print('regNo $regNo');
//     print('patientType $patientType');
//     print('salutation $salutation');
//     print('fname $fname');
//     print('phoneMobile $phoneMobile');
//     print('email $email');
//     print('dob $dob');
//     print('ageDd $ageDd');
//     print('ageMm $ageMm');
//     print('ageYy $ageYy');
//     print('gender $gender');
//     print('mStatus $mStatus');
//     print('bloodGroup $bloodGroup');
//     print('address $address');
//     print('consultationType $consultationType');
//     print('appFromFlag $appFromFlag');
//     print('appointType $appointType');
//     print('slotNo $slotNo');
//     print('slotSl $slotSl');
//     print('start $startTime');
//     print('endTime $endTime');
//
//     try {
//       final http.Response response = await http.post(
//         Uri.parse(url),headers: {'Authorization': 'Bearer ${Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken}',},
//         body: jsonEncode(<String, dynamic>{
//           "doctorNo":doctorNo,
//           "appointDate":appointDate,
//           "shiftdtlNo":shiftdtlNo,
//           "regNo":regNo,
//           "patientType":patientType,
//           "salutation":"MR.",
//           "fname":fname,
//           "phoneMobile":phoneMobile,
//           "email":email,
//           "dob":dob,
//           "ageDd":ageDd,
//           "ageMm":ageMm,
//           "ageYy":ageYy,
//           "gender":gender,
//           "mStatus":null,
//           "bloodGroup":bloodGroup,
//           "address":address,
//           "consultationType":consultationType,
//           "appointType":"Internet",
//           "appointStatus":1,
//           "appFromFlag":null,
//           "remarks":"Online Appointment",
//           "slotNo":slotNo,
//           "slotSl":slotSl,
//           "startTime":startTime,
//           "endTime":endTime
//
//         }),
//       );
//       print('status ${response.statusCode}');
//       print('body ${response.body}');
//       if (response.statusCode == 200) {
//         print('abcd');
//         print(response.body);
//         BookAppointmentModel data = bookAppointmentModelFromJson(response.body);
//         //BotToast.closeAllLoading();
//         return Right(BookAppointmentModel(
//           message: data.message,
//         ));
//       } else {
//         // BotToast.closeAllLoading();
//         BotToast.showText(text: StringResources.somethingIsWrong);
//         return Left(AppError.serverError);
//       }
//     } on SocketException catch (e) {
//       //BotToast.closeAllLoading();
//       //logger.e(e);
//       BotToast.showText(text: StringResources.unableToReachServerMessage);
//       return Left(AppError.networkError);
//     } catch (e) {
//       // BotToast.closeAllLoading();
//       //logger.e(e);
//     }
//     BotToast.showText(text: StringResources.somethingIsWrong);
//     return Left(AppError.unknownError);
//   }
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
        body: jsonEncode(<String, dynamic>{
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
          //"ageYy": "30",
          "phoneMobile": phoneMobile,
          "gender": gender,
          "address": address,
          "email": email,
          "dob": dob,
          "paymodeNo": paymodeNo,
          "paymentArray": [],
          "appointType": "Online",
          "regNo": regNo,
        }),
      );
      print('status ${response.statusCode}');
      print('body ${response.body}');
      if (response.statusCode == 200) {
        print('abcd');
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
    }
    BotToast.showText(text: StringResources.somethingIsWrong);
    return Left(AppError.unknownError);
  }
}
