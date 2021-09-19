import 'package:myhealthbd_app/admin/appointment_report/models/initial_list_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';


class InitialListRepository{
  Future<InitialListModel> fetchIinitialCompanyListData() async {
    try{
      var response=await ApiClient().getRequest('auth-api/api/org/list');
      print('dkabir ${response.statusCode}');
      if(response.statusCode==200){
        print('constwe ${response.body}');
        InitialListModel data=initialListModelFromJson(response.body);
        return data;
      }else{
        print(response.reasonPhrase);
      }
    }catch(e){
      print(e);
    }
  }
}
