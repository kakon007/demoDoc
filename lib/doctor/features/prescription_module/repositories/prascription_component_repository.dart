import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/prascription_component_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';

class PrescriptionComponentRepository {
  Future<PrescriptionComponentModel> fetchPrescriptionComponentModel(
      {var accessToken}) async {
    try {
      var response = await ApiClient().postRequest(
          "prescription-service-api/api/user-preferences/findPreferenceData",
          {});
      print("AkramKhan${response.statusCode}");
      print("hhh${response.body}");
      if (response.statusCode == 200) {
        var body = response.body;
        PrescriptionComponentModel data =
            prescriptionComponentModelFromJson(body);
        return data;
      } else {
        return PrescriptionComponentModel();
      }
    } catch (e) {
      return PrescriptionComponentModel();
    }
  }
}
