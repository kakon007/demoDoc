import 'package:myhealthbd_app/doctor/features/prescription_module/models/vitals_set_up_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';

class VitalsListSetupListRepository {
  Future<VitalsSetupModel> fetchVitalsSetupList() async {
    try {
      var response = await ApiClient().getRequest(
          "prescription-service-api/api/pre-diagnosis/find-vital-list");
      print("favouriteType ${response.body}");
      if (response.statusCode == 200) {
        var body = response.body;
        VitalsSetupModel data = vitalsSetupModelFromJson(body);
        return data;
      } else {
        return VitalsSetupModel();
      }
    } catch (e) {
      return VitalsSetupModel();
    }
  }
}
