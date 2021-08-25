import 'package:myhealthbd_app/doctor/features/prescription_module/models/pre_diagnosis_search_result_model.dart';
import 'package:myhealthbd_app/doctor/main_app/prescription_favourite_type.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';

class PreDiagnosisSearchRepository {
  Future<List<String>> fetchSearchList({String q, String favoriteType}) async {
    try {
      var response = await ApiClient().postRequest(
          "prescription-service-api/api/pre-diagnosis/list",
          {"preDiagnosisVal": q, "preDiagnosisValType": favoriteType});
      print(response.statusCode);
      if (response.statusCode == 200) {
        var body = response.body;
        PreDiagnosisSearchResultModel data =
            preDiagnosisSearchResultModelFromJson(body);
        return data.items.map((e) => e.preDiagnosisVal).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
