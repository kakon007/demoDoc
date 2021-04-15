
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/features/my_health/models/prescription_list_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
class PrescriptionRepository{
  // Future<PrescriptionListModel> fetchPrescriptionList() async {
  //   var url =
  //       "https://qa.myhealthbd.com:9096/diagnostic-api/api/pat-investigation-report/patient-prescription-list?draw=1&columns%5B0%5D%5Bdata%5D=consultationId&columns%5B0%5D%5Bname%5D=consultationId&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=prescriptionDateTime&columns%5B1%5D%5Bname%5D=prescriptionDateTime&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=doctorName&columns%5B2%5D%5Bname%5D=doctorName&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=companyName&columns%5B3%5D%5Bname%5D=companyName&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=&columns%5B4%5D%5Bname%5D=&columns%5B4%5D%5Bsearchable%5D=true&columns%5B4%5D%5Borderable%5D=true&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=desc&start=0&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&_=1617439318994";
  //   // print('Token: '+ signInData.accessToken);
  //   var client = http.Client();
  //   var response = await client.get(url,headers: {'Authorization': 'Bearer ${widget.accessToken}',});
  //   if (response.statusCode == 200) {
  //     print('Response: '+ response.body.toString());
  //     // Map<String, dynamic> jsonMap = json.decode(response.body);
  //     PrescriptionListModel data1 = prescriptionListModelFromJson(response.body) ;
  //
  //     setState(() {
  //       data1.obj.data.forEach((elemant) {
  //         dataList2.add(elemant);
  //       });
  //     });
  //
  //     // setState(() {
  //     //   dataList2=data1.obj.data.first.phoneMobile;
  //     // });
  //
  //     // print('Data:: ' + data.items[5].companyName);
  //     // print('DataList2:: ' + dataList2.first.consultationId);
  //     print('Data:::: '+ data1.toJson().toString());
  //     print('Data1234312:::: '+ dataList2.toString());
  //     return data1;
  //   }else {
  //     return null;
  //   }
  // }


  Future<Either<AppError,PrescriptioM>> fetchPrescriptionList(String accessToken) async {
      var url =
          "https://qa.myhealthbd.com:9096/diagnostic-api/api/pat-investigation-report/patient-prescription-list?draw=1&columns%5B0%5D%5Bdata%5D=consultationId&columns%5B0%5D%5Bname%5D=consultationId&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=prescriptionDateTime&columns%5B1%5D%5Bname%5D=prescriptionDateTime&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=doctorName&columns%5B2%5D%5Bname%5D=doctorName&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=companyName&columns%5B3%5D%5Bname%5D=companyName&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=&columns%5B4%5D%5Bname%5D=&columns%5B4%5D%5Bsearchable%5D=true&columns%5B4%5D%5Borderable%5D=true&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=desc&start=0&length=10&search%5Bvalue%5D=&search%5Bregex%5D=false&_=1617439318994";
    // List<Item> dataList = new List<Item>();

    try{
      var client = http.Client();
      var response = await client.get(url,headers: {'Authorization': 'Bearer $accessToken',});
      if (response.statusCode == 200) {
        // Map<String, dynamic> jsonMap = json.decode(response.body);
        //data = jsonMap["items"];
        // HospitalListModel data =hospitalListModelFromJson(response.body) ;
        // var mapData = json.decode(utf8.decode(response.bodyBytes));
        // var hospitalList = fromJson(mapData);

        PrescriptionListModel data = prescriptionListModelFromJson(response.body) ;
        // data.items.forEach((elemant) {
        //   dataList.add(elemant);
        // });

        // data.items.forEach((elemant) {
        //   dataList.add(elemant);
        // });
        //
        print('Dataaaaaaa:: ' + data.obj.data.first.consultationId);
        // return data;

        return Right(
            PrescriptioM(
              dataListofPrescription: data.obj.data,
            )

        );
        //print(data[0]['companySlogan']);
      }else {
        BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    }on SocketException catch (e){
      //logger.e(e);
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    }catch (e) {
      //logger.e(e);
      BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.unknownError);
    }

  }

}

class PrescriptioM{
  List<Datum> dataListofPrescription=List<Datum>();
  PrescriptioM({this.dataListofPrescription});

}