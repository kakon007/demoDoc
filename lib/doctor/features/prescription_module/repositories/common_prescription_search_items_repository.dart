import 'package:myhealthbd_app/doctor/features/prescription_module/models/common_prescription_search_items_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';

class CommonPrescriptionSearchItemsRepository {
  Future<List<String>> fetchSearchList({String q, int parItemTypeNo}) async {
    try {
      var response = await ApiClient().postRequest(
          "prescription-service-api/api/prescription/search-items",
          {"parItemTypeNo": parItemTypeNo, "itemName": q});
      print(response.statusCode);
      if (response.statusCode == 200) {
        var body = response.body;
        CommonPrescriptionSearchItemsModel data =
            commonPrescriptionSearchItemsModelFromJson(body);

        return data.items.map((e) => e.itemName).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
