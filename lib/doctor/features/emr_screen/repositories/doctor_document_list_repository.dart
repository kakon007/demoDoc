import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/doctor/features/emr_screen/models/doctor_documentation_list_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
class DoctorDocumentationListRepository{
  Future<Either<AppError, DocumentationM>> fetchDocList(
      {var regNo,var doctorNo,int startIndex,var searchValue}) async {
    print("searchValueDD $searchValue");
    var url = searchValue == null || searchValue.isEmpty?
    'prescription-service-api/api/file-shared/gridList?columns%5B0%5D%5Bdata%5D=attachmentName&columns%5B0%5D%5Bname%5D=attachmentName&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B1%5D%5Bdata%5D=description&columns%5B1%5D%5Bname%5D&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=reportDate&columns%5B2%5D%5Bname%5D&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=asc&start=$startIndex&length=10&search%5Bvalue%5D&search%5Bregex%5D=false&regNo=$regNo&doctorNo=$doctorNo&_=1630235880106'
:     'prescription-service-api/api/file-shared/gridList?columns%5B0%5D%5Bdata%5D=attachmentName&columns%5B0%5D%5Bname%5D=attachmentName&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B1%5D%5Bdata%5D=description&columns%5B1%5D%5Bname%5D&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=reportDate&columns%5B2%5D%5Bname%5D&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=asc&start=$startIndex&length=10&search%5Bvalue%5D=$searchValue&search%5Bregex%5D=false&regNo=$regNo&doctorNo=$doctorNo&_=1630235880106';

    try{
      var response= await ApiClient().getRequest(url);

      print('responseNo ${response.statusCode}');
      if (response.statusCode == 200) {
        var body=response.body;
        DoctorDocumentationListModel data=doctorDocumentationListModelFromJson(body);
        print('body: ${body}');
        return Right(DocumentationM(
            dataFromDocumentList: data.obj.data,
            totalCount: data.obj.recordsTotal
        ));
      }
      else {
        print(response.reasonPhrase);
        return Left(AppError.serverError);
      }
    }on SocketException catch (e) {
      print("FromprescriptionTemplateRepo:::" + e.toString());
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    } catch(e){
      print(e);
      return Left(AppError.unknownError);
    }
  }
}

class DocumentationM{
  List<Datum> dataFromDocumentList=List<Datum>();
  int totalCount;
  DocumentationM({this.dataFromDocumentList,this.totalCount});
}