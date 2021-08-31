import 'package:myhealthbd_app/doctor/features/prescription_module/models/medication_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';

class MedicationRepository {
  Future<MedicationModel> fetchMedicationList({var accessToken}) async {
    try {
      var response = await ApiClient().postRequest(
          "prescription-service-api/api/pre-diagnosis/pres-medicine-initial-data",
          {
            "followUpDate": "2021-08-05T11:34:43.090Z",
            "selected": 0,
            "inReportSerial": 0,
            "isDeleted": 0
          });
      print("Goole map Zahid${response.statusCode}");
      if (response.statusCode == 200) {
        var body = response.body;
        MedicationModel data = medicationModelFromJson(body);
        return data;
      } else {
        return MedicationModel();
      }
    } catch (e) {
      return MedicationModel();
    }
  }
}
