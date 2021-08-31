import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/get_template_data_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class GetTemplateDataRepository{
  Future<Either<AppError, TemDataModel>> fetchTemplateData({var templateId}) async {
    try{
      var response= await ApiClient().postRequest("prescription-service-api/api/prescription/getTemplateDataById?templateId=$templateId",null);
      print("template data ${response.statusCode}");
      if(response.statusCode==200){
         var body=response.body;
         GetTemplateDataModel data=getTemplateDataModelFromJson(body);

         return Right(
             TemDataModel(
                 dataList: data.obj
             ));
      }else{
        return Left(AppError.serverError);
      }
    }catch(e){
      print(e);
     //return GetTemplateDataModel();
    }
  }
}

class TemDataModel{
  Obj dataList=Obj();
  TemDataModel({this.dataList});
}