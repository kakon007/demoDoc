import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/features/appointments/models/patient__fee.dart';
import 'package:myhealthbd_app/features/appointments/repositories/available_slots_repository.dart';
import 'package:myhealthbd_app/features/auth/model/sign_in_model.dart';
import 'package:myhealthbd_app/features/auth/model/sign_out_model.dart';
import 'package:myhealthbd_app/features/auth/model/sign_up_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';

class AuthRepository{

  Future<Either<AppError, SignInModel>>   fetchFee(String user, String pass ) async {
    String username = 'telemedCareIdPassword';
    String password = 'secret';
    String basicAuth = 'Basic ' +
        base64Encode(
            utf8.encode('$username:$password'));
    String url =
        "${Urls.buildUrl}auth-api/oauth/token?username=$user&password=$pass&grant_type=password";
    var response = await http.post(url,
        headers: <String, String>{
          'authorization': basicAuth
        });
      if (response.statusCode == 200) {
        print(response.body);
        SignInModel data = signInModelFromJson(response.body);
        return Right(SignInModel(
          accessToken: data.accessToken.toString(),
        ));
      } else {
        // BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    }

  Future<Either<AppError, SignOutModel>>   fetchSignOutInfo(String accessToken) async {
    String url =
        "${Urls.buildUrl}auth-api/oauth/token/logout";
    var response = await http.delete(url,headers: {'Authorization': 'Bearer $accessToken',});
    //print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      SignOutModel data = signOutModelFromJson(response.body);
      return Right(SignOutModel(
        message: data.message.toString(),
      ));
    } else {
      // BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.serverError);
    }
  }
  Future<dynamic>   fetchSignUpInfo(String name, String email,String mobile, String address, String selectedGender,String formatDate2) async {
    String salutation;
    if(selectedGender=="Male"){
      selectedGender="M";
      salutation= "Mr.";
    }
    if(selectedGender=="Female"){
      selectedGender="F";
      salutation= "Mrs.";
    }
    print(name);
    print(email);
    print(mobile);
    print(address);
    print(selectedGender);
    print(formatDate2);
    var request = http.MultipartRequest('POST', Uri.parse('https://qa.myhealthbd.com:9096/online-appointment-api/fapi/registration/create-with-image'));
    request.fields.addAll({
      'reqobj': json.encode({"opdReg":{"salutation":salutation,"fname":name,"lname":"","dob":formatDate2,"gender":selectedGender,"phoneMobile":mobile,"email":email,"address":address,"companyNo":"1","organizationNo":"1"},"opdRegOthers":{ }})

    });
    // request.fields.addAll({
    //   'reqobj': '{\n   "opdReg":{\n      "id":"",\n      "personalId":"",\n      "salutation":"MR.",\n      "fname":"Rafi",\n      "lname":"",\n      "ageYy":31,\n      "ageDd":0,\n      "ageMm":0,\n      "dob":"1990-04-18T09:28:04.050Z",\n      "gender":"M",\n      "maritalStatus":"M",\n      "phoneMobile":"01844222356",\n      "email":"mr@rafi.com",\n      "address":"Bashundhra,R/A",\n      "fatherName":"Md. Ishak",\n      "motherName":"Halima Khatun",\n      "nationalId":"014788852369",\n      "religion":"ISLAM",\n      "bloodGroup":"O+",\n      "spouseName":"Rubina Hoque",\n      "passportNo":"111222333",\n      "hospitalNumber":"",\n      "regDate":"",\n      "patTypeNo":"1",\n      "regPoint":"1",\n      "ssCreator":"",\n      "ssCreatedOn":"",\n      "ssCreateSession":"",\n      "patientPhoto":null,\n      "file":{  },\n      "companyNo":"1",\n      "organizationNo":"1"\n   },\n   "opdRegOthers":{ }\n}\n'
    // });
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = response.stream.bytesToString();
      SignUpModel data = signUpModelFromJson(await body);
      return body;
    //   SignUpModel data = signUpModelFromJson( await response.stream.toString());
    //   return Right(SignUpInfoModel(
    //     username: data.obj.userId,
    //     password: data.obj.password
    //   ));
    // } else {
    //   return Left(AppError.serverError);
     }
  }
}
class SignUpInfoModel{
  String username;
  String password;
  SignUpInfoModel({this.username, this.password});
}