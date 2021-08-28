import 'package:myhealthbd_app/doctor/features/prescription_module/models/investigation_finding_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/pre_diagnosis_search_result_model.dart';
import 'package:myhealthbd_app/doctor/main_app/prescription_favourite_type.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';

class InvestigationFindingRepository {
  Future<List<String>> fetchSearchList({String q, String favoriteType}) async {
    try {
      var response = await ApiClient().postRequest(
          "prescription-service-api/api/investigation/list",
          {"invesName": q, "preDiagnosisValType": favoriteType});
      print(response.body);
      if (response.statusCode == 200) {
        var body = response.body;
        InvestigationFindingModel data =
        investigationFindingModelFromJson(body);
        return data.items.map((e) => e.itemName).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
