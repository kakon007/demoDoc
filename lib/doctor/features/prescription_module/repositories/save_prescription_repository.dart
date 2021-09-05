import 'dart:convert';

import 'package:myhealthbd_app/doctor/features/prescription_module/models/prescription_save_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';

class SavePrescriptionRepository {
  Future postPrescription(PrescriptionSaveModel prescriptionSaveModel) async {
    var body = prescriptionSaveModel.toJson();
    print(json.encode(body));
    var response = await ApiClient()
        .postRequest('prescription-service-api/api/prescription/create', body);
    print("${response.statusCode}");
    print("${response.body}");
    if (response.statusCode == 200) {
      var body = response.body;
      return body;
    }
  }
}
