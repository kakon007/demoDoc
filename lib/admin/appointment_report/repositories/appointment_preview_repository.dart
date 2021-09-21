
import 'package:myhealthbd_app/admin/appointment_report/models/appointment_preview_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';


class AppointmentPreviewRepository{
  Future<List<Item>> fetchPreviewData({var fromDate,var toDate,int companyNo,int ogNo,int shiftNo,int doctorNo}) async {
    try{
      var response=await ApiClient().postRequest('diagnostic-api/api/opd-appointment-report/report-list', {
        "fromDate":"$fromDate",
        "toDate":"$toDate",
        "printFormate":"PDF",
        "doctorNo":doctorNo,
        "companyNo":companyNo,
        "ogNo":ogNo,
        "shiftNo":shiftNo
      });
      print('docs ${response.statusCode}');
      if(response.statusCode==200){
        print('constwe ${response.body}');
        AppointmentPreviewModel data=appointmentPreviewModelFromJson(response.body);
        var list=data.items;
        return list;
      }else{
        print(response.reasonPhrase);
      }
    }catch(e){
      print(e);
    }
  }
}