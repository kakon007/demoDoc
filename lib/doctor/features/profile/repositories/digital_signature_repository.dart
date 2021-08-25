import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/doctor/features/profile/models/designation_model.dart';
import 'package:myhealthbd_app/doctor/features/profile/models/digital_signature_model.dart';
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

class DigitalSignatureRepository {
  Future<Either<AppError, DigitalSignatureModel>>
      fetchDigitalSignature() async {
    var doctorNo =
        Provider.of<UserImageViewModel>(appNavigator.context, listen: false)
            .details
            .doctorNo;
    var response = await ApiClient().getRequest(
      "auth-api/api/doctor/getSignature?doctorNo=$doctorNo",
    );
    print('jahid ${response.body}');
    try {
      if (response.statusCode == 200) {
        DigitalSignatureModel data =
            digitalSignatureModelFromJson(response.body);
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

  Future uploadDigitalSignature() async {
    var doctorNo =
        Provider.of<UserImageViewModel>(appNavigator.context, listen: false)
            .details
            .doctorNo
            .toString();
    var headers = {
      'Authorization':
          'Bearer ${Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).accessToken}'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${Urls.baseUrl}auth-api/api/doctor/add-signature'));
    request.fields.addAll({'doctoreNo': doctorNo});
    request.files.add(await http.MultipartFile.fromPath('file',
        DigitalSignatureViewModel.read(appNavigator.context).imageFile.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    try {
      if (response.statusCode == 200) {
        return response.statusCode.toString();
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(response.reasonPhrase);
    }

    // var response = await ApiClient().postRequestWithFormData(
    //   "auth-api/api/doctor/add-signature", file, "attachment", data);
    // var body = await response.stream.bytesToString();
    // print('jahid $body}');
    // try {
    //   if (response.statusCode == 200) {
    //     DigitalSignatureModel data = digitalSignatureModelFromJson(response.body);
    //     return Right(data);
    //   } else {
    //     BotToast.showText(text: StringResources.somethingIsWrong);
    //     return Left(AppError.serverError);
    //   }
    // } on SocketException catch (e) {
    //   BotToast.showText(text: StringResources.unableToReachServerMessage);
    //   return Left(AppError.networkError);
    // } catch (e) {
    //   return Left(AppError.unknownError);
    // }
  }
}
