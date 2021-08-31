import 'package:myhealthbd_app/main_app/api_client.dart';

class DeleteTemplateRepository{
  Future deleteList({var id}) async {
    try{
      var response= await ApiClient().deleteRequest('prescription-service-api/api/prescription-temp/delete?id=$id');
      print('response${response.statusCode}');
      if(response.statusCode==200){
        var body=response.body;
        return body;
      }else{
        print('response${response.statusCode}');
      }
    }catch(e){print(e);}
  }
}