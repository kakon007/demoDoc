import 'package:myhealthbd_app/doctor/features/prescription_module/models/prescription_template_save_data_model.dart';
import 'package:myhealthbd_app/features/book_test/view/widgets/order_comfiramation_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';

class OrderConfirmationRepository {
  Future fetchFileType(OrderConfirmationModel orderConfirmationModel) async {
    // try {
    //print("Save template json ${jsonEncode(prescriptionTemplateSaveModel)}");
    var response = await ApiClient().postRequest(
        'online-appointment-api/fapi/diagnostic-item-booking/create-booking',
        orderConfirmationModel.toJson());
    print("${response.statusCode}");
    print("${response.body}");
    if (response.statusCode == 200) {
      var body = response.body;
      return body;
    }
    // else {
    //   print(response.reasonPhrase);
    // }
    // } catch (e) {
    //   print(e);
    // }
  }
}
