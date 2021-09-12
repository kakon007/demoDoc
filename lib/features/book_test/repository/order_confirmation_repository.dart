import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/prescription_template_save_data_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/book_test/model/order_comfiramation_model.dart';
import 'package:myhealthbd_app/features/book_test/view_model/order_confirm_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/family_members_view_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';
import 'package:myhealthbd_app/main_app/home.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class OrderConfirmationRepository {
  Future fetchBookConfirmationType(
      OrderConfirmationModel orderConfirmationModel) async {
    // try {
    //print("Save template json ${jsonEncode(prescriptionTemplateSaveModel)}");
    BotToast.showLoading();
    var response = await ApiClient().postRequest(
        'online-appointment-api/fapi/diagnostic-item-booking/create-booking',
        orderConfirmationModel.toJson());
    print("${response.statusCode}");
    print("${response.body}");
    if (response.statusCode == 200) {
      var body = response.body;
      var cartVM = Provider.of<OrderConfirmViewModel>(appNavigator.context, listen: false);
      cartVM.selectedMemberType = null;
      var familyVm =
      Provider.of<FamilyMembersListViewModel>(appNavigator.context, listen: false);
      familyVm.memberDetail(
          -1, false, "", "", "", "", "", "", "", "", "");
     cartVM.memberList = false;
      cartVM.selectedMemberType=null;
      BotToast.showText(text: 'Order successfully placed');
      Navigator.of(appNavigator.context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  HomeScreen(
                  )));
      BotToast.closeAllLoading();
      return body;
    }else{
      BotToast.closeAllLoading();
    }
  }
}
