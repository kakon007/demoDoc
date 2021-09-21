import 'package:myhealthbd_app/admin/appointment_report/models/appointment_doctor_search_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';


class AppointmentDoctorSearchRepository{
  Future<AppointmentDoctorSearchtModel> fetchDoctorSearchData({String q,int companyNo,int ogNo,}) async {
    try{
      var response=await ApiClient().postRequest('diagnostic-api/api/consultation-collection/doctor-search', {
        "doctorSearch":"d",
        "companyNo":companyNo,
        "ogNo":ogNo
      });
      print('docs ${response.statusCode}');
      if(response.statusCode==200){
        print('constwe ${response.body}');
        AppointmentDoctorSearchtModel data=appointmentDoctorSearchtModelFromJson(response.body);
        return data;
      }else{
        print(response.reasonPhrase);
      }
    }catch(e){
      print(e);
    }
  }
}