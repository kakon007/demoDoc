import 'package:myhealthbd_app/doctor/features/prescription_module/models/favourite_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/pre_diagnosis_search_result_model.dart';
import 'package:myhealthbd_app/doctor/main_app/prescription_favourite_type.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';

class AdviceRepository {
  Future<FavouriteListModel> fetchFavouriteList({var accessToken}) async {
    try {
      var response = await ApiClient().postRequest(
          "prescription-service-api/api/favourites/list",
          {"favouriteType": PrescriptionFavouriteType.advice.toString()});
      print(response.statusCode);
      if (response.statusCode == 200) {
        var body = response.body;
        FavouriteListModel data = favouriteListModelFromJson(body);
        return data;
      } else {
        return FavouriteListModel();
      }
    } catch (e) {
      return FavouriteListModel();
    }
  }

  Future<List<String>> fetchSearchList(String q) async {
    try {
      var response = await ApiClient()
          .postRequest("prescription-service-api/api/pre-diagnosis/list", {
        "preDiagnosisVal": q,
        "preDiagnosisValType": PrescriptionFavouriteType.advice.toString()
      });
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
