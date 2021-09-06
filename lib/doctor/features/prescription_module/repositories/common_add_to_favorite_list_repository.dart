import 'package:myhealthbd_app/doctor/features/prescription_module/models/favourite_model.dart';
import 'package:myhealthbd_app/doctor/main_app/prescription_favourite_type.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';

class CommonAddToFavoriteListRepository {
  Future addToFavouriteList({String favoriteVal, String favoriteType}) async {
    try {
      await ApiClient().postRequest(
          "prescription-service-api/api/favourites/create",
          {"favouriteVal": favoriteVal, "favouriteType": favoriteType});
      // print(response.statusCode);
      // if (response.statusCode == 200) {
      //   var body = response.body;
      //   FavouriteListModel data = favouriteListModelFromJson(body);
      //   return data;
      // } else {
      //   return FavouriteListModel();
      // }
    } catch (e) {}
  }

  Future addToMedicineFavouriteList(
      {String favoriteType,
      String brandName,
      String genericName,
      String route,
      String dose,
      String duration,
      String durationType,
      String instructions,
        String quantity,
        String continueMedi,
      }) async {
    try {
     var response= await ApiClient()
          .postRequest("prescription-service-api/api/favourites/create", {
        "favouriteType": favoriteType,
        "brandName": brandName,
        "route": route,
        "genericName": genericName,
        "favMedDtlList": [
          {
            "dosage": dose,
            "duration":duration,
            "durationMu": durationType,
            "durationComment":instructions,
            //"itemQty": quantity,
            "medicineComment": instructions,
            //"inReportSerial": 0,
            //"continueFlag": continueMedi
          }
        ]
      });
       print(response.body);
      // if (response.statusCode == 200) {
      //   var body = response.body;
      //   FavouriteListModel data = favouriteListModelFromJson(body);
      //   return data;
      // } else {
      //   return FavouriteListModel();
      // }
    } catch (e) {}
  }
}
