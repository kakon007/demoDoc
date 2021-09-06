import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/prescription_save_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';

import '../../../doctor_home_screen.dart';

class SavePrescriptionRepository {
  Future postPrescription(PrescriptionSaveModel prescriptionSaveModel) async {
    BotToast.showLoading();
    var body = prescriptionSaveModel.toJson();
    print(json.encode(body));
    var response = await ApiClient()
        .postRequest('prescription-service-api/api/prescription/create', body);
    print("${response.statusCode}");
    print("${response.body}");
    if (response.statusCode == 200) {
      var body = response.body;
      if(response.statusCode==200){
        BotToast.closeAllLoading();
        Navigator.of(appNavigator.context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => DoctorHomeScreen(
                  index: 1,
                )),
                (Route<dynamic> route) => false);
      }
      else{
        BotToast.closeAllLoading();
        return body;
      }

    }
  }
}
