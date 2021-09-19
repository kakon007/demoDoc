import 'package:myhealthbd_app/admin/appointment_report/models/appointment_company_list.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';


class ApppointmentCompanyListRepository{
  Future<AppointmentListModel> fetchApppointmentCompanyListData(
      {int ogNo}) async {
    try{
      var response=await ApiClient().getRequest('auth-api/api/company/list?ogNo=$ogNo');
      print('dkabir ${response.statusCode}');
      if(response.statusCode==200){
        print('constwe ${response.body}');
        AppointmentListModel data=appointmentListModelFromJson(response.body);
        return data;
      }else{
        print(response.reasonPhrase);
      }
    }catch(e){
      print(e);
    }
  }
}