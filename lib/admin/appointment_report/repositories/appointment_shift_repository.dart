import 'package:myhealthbd_app/admin/appointment_report/models/appointment_shift_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';


class ShiftListRepository{
  Future<AppointmentShiftListModel> fetchShiftListData({int ogNo,int companyno}) async {
    try{
      var response=await ApiClient().getRequest('diagnostic-api/api/opd-consultation/shift-list-new?ogNo=$ogNo&companyNo=$companyno');
      print('dkabir3 ${response.statusCode}');
      print('dkabir3 $ogNo');
      print('dkabir3 $companyno');
      if(response.statusCode==200){
        print('constwe ${response.body}');
        AppointmentShiftListModel data=appointmentShiftListModelFromJson(response.body);
        return data;
      }else{
        print(response.reasonPhrase);
      }
    }catch(e){
      print(e);
    }
  }
}