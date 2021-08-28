import 'package:myhealthbd_app/doctor/features/prescription_module/models/pre_diagnosis_search_result_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/referred_doctor_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/referred_opd_model.dart';
import 'package:myhealthbd_app/doctor/main_app/prescription_favourite_type.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';

class ReferredDoctorSearchRepository {
  Future<List<String>> fetchSearchList() async {
    try {
      var response = await ApiClient().getRequest(
          "prescription-service-api/api/prescription/findOpdDoctor");
      print(response.statusCode);
      if (response.statusCode == 200) {
        var body = response.body;
        ReferredDoctorModel data = referredDoctorModelFromJson(body);
        return data.items.map((e) => e.doctorName).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
