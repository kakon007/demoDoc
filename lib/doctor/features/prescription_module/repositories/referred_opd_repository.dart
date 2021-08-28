import 'package:myhealthbd_app/doctor/features/prescription_module/models/pre_diagnosis_search_result_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/referred_opd_model.dart';
import 'package:myhealthbd_app/doctor/main_app/prescription_favourite_type.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';

class ReferredOPDSearchRepository {
  Future<List<String>> fetchSearchList() async {
    try {
      var response =
          await ApiClient().getRequest("auth-api/api/employee/dept/list");
      print(response.statusCode);
      if (response.statusCode == 200) {
        var body = response.body;
        ReferredOpdModel data = referredOpdModelFromJson(body);
        return data.items.map((e) => e.buName).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
