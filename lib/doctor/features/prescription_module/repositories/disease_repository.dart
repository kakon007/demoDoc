import 'package:myhealthbd_app/doctor/features/prescription_module/models/favourite_model.dart';
import 'package:myhealthbd_app/doctor/main_app/prescription_favourite_type.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';

class DiseaseRepository {
  Future<FavouriteListModel> fetchFavouriteList({var accessToken}) async {
    try {
      var response = await ApiClient().postRequest(
          "prescription-service-api/api/favourites/list",
          {"favouriteType": PrescriptionFavouriteType.disease.toString()});
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
}
