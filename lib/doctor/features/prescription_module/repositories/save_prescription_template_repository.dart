import 'dart:convert';

import 'package:myhealthbd_app/doctor/features/prescription_module/models/prescription_template_save_data_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/get_template_data_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/prescription_template_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';
import 'package:provider/provider.dart';

class SavePrescripTionTemplateRepository {
  Future fetchFileType(
      PrescriptionTemplateSaveModel prescriptionTemplateSaveModel) async {
    // try {
    //print("Save template json ${jsonEncode(prescriptionTemplateSaveModel)}");
    var response = await ApiClient().postRequest(
        'prescription-service-api/api/prescription-temp/create',
        prescriptionTemplateSaveModel.toJson());
    print("${response.statusCode}");
    print("${response.body}");
    if (response.statusCode == 200) {
      await Provider.of<PrescriptionTamplateViewModel>(appNavigator.context, listen: false).getData();
      var body = response.body;
      // GetTamplateDataViewModel.read(
      //     appNavigator.context).getData();
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
// class SavePrescripTionTemplateRepository {
//   Future fetchFileType(
//       {var followUpDate,
//       var templateName,
//       var adviceListpreDiagnosisVal,
//       int doctorNo,
//       int invesitemTypeNo,
//       var invesitemName,
//       var invespreDiagnosisVal,
//       int invesreferenceId,
//       var diagnosispreDiagnosisVal,
//       var chieffollowUpDate,
//       var chiefpreDiagnosisVal,
//       var clinicalHistory2ListpreDiagnosisVal,
//       var middleValue,
//       var clinicalHistory3ListpreDiagnosisVal,
//       var treatmentListpreDiagnosisVal,
//       var notepreDiagnosisVal,
//       var genericName,
//       var brandName,
//       var route,
//       var medicineStat}) async {
//     try {
//       var response = await ApiClient().postRequest(
//           'prescription-service-api/api/prescription-temp/create', {
//         "prescriptionTemp": {
//           "activeStatus": 1,
//           "templateName": "$templateName",
//           "departmentNo": null
//         },
//         "adviceList": [
//           {
//             "followUpDate": "$followUpDate",
//             "selected": 0,
//             "inReportSerial": 0,
//             "isDeleted": 0,
//             "referenceId": null,
//             "preDiagnosisVal": "$adviceListpreDiagnosisVal",
//             "preDiagnosisValType": 8,
//             "doctorNo": doctorNo,
//             "duration": null,
//             "durationMu": null,
//             "continueFlag": null,
//             "findingsClob": null
//           }
//         ],
//         "medicineList": [],
//         "investigationList": [
//           {
//             "activeStatus": 1,
//             "inReportSerial": 0,
//             "isDeleted": 0,
//             "itemTypeNo": invesitemTypeNo,
//             "itemName": "$invesitemName",
//             "preDiagnosisVal": "$invespreDiagnosisVal",
//             "preDiagnosisValType": 1,
//             "referenceId": invesreferenceId
//           }
//         ],
//         "diagnosisList": [
//           {
//             "followUpDate": "$followUpDate",
//             "selected": 0,
//             "inReportSerial": 0,
//             "isDeleted": 0,
//             "referenceId": null,
//             "preDiagnosisVal": "$diagnosispreDiagnosisVal ",
//             "preDiagnosisValType": 6,
//             "doctorNo": doctorNo,
//             "duration": null,
//             "durationMu": null,
//             "continueFlag": null,
//             "findingsClob": null
//           }
//         ],
//         "diseaseList": [],
//         "chiefComplainList": [
//           {
//             "followUpDate": "$chieffollowUpDate",
//             "selected": 0,
//             "inReportSerial": 0,
//             "isDeleted": 0,
//             "referenceId": null,
//             "preDiagnosisVal": "$chiefpreDiagnosisVal",
//             "preDiagnosisValType": 7,
//             "doctorNo": doctorNo,
//             "duration": null,
//             "durationMu": null,
//             "continueFlag": null,
//             "findingsClob": null
//           }
//         ],
//         "clinicalHistory2List": [
//           {
//             "followUpDate": "$followUpDate",
//             "selected": 0,
//             "inReportSerial": 0,
//             "isDeleted": 0,
//             "referenceId": null,
//             "preDiagnosisVal": "$clinicalHistory2ListpreDiagnosisVal",
//             "preDiagnosisValType": 9,
//             "doctorNo": doctorNo,
//             "duration": null,
//             "durationMu": null,
//             "continueFlag": null,
//             "findingsClob": null
//           }
//         ],
//         "dentalFindingsList": [],
//         "eyeFindingsList": [
//           {"middleValue": "$middleValue"},
//           {"middleValue": "$middleValue"}
//         ],
//         "dentalTreatment": null,
//         "clinicalHistory3List": [
//           {
//             "followUpDate": "$followUpDate",
//             "selected": 0,
//             "inReportSerial": 0,
//             "isDeleted": 0,
//             "referenceId": null,
//             "preDiagnosisVal": "$clinicalHistory3ListpreDiagnosisVal",
//             "preDiagnosisValType": 32,
//             "doctorNo": doctorNo,
//             "duration": null,
//             "durationMu": null,
//             "continueFlag": null,
//             "findingsClob": null
//           }
//         ],
//         "treatmentList": [
//           {
//             "followUpDate": "$followUpDate",
//             "selected": 0,
//             "inReportSerial": 0,
//             "isDeleted": 0,
//             "referenceId": null,
//             "preDiagnosisVal": "$treatmentListpreDiagnosisVal",
//             "preDiagnosisValType": 35,
//             "doctorNo": doctorNo,
//             "duration": null,
//             "durationMu": null,
//             "continueFlag": null,
//             "findingsClob": null
//           }
//         ],
//         "eyeAddPowerList": [],
//         "eyeIPD": null,
//         "eyeRemarks": null,
//         "eyeGlassTypeList": [],
//         "eyeGlassUsageTypeList": [],
//         "physicalTherapyList": [],
//         "therapeuticExerciseList": [],
//         "orthosisList": [],
//         "dietAdviceList": [],
//         "note": {
//           "followUpDate": "$followUpDate",
//           "selected": 0,
//           "inReportSerial": 0,
//           "isDeleted": 0,
//           "preDiagnosisValType": 48,
//           "preDiagnosisVal": "$notepreDiagnosisVal"
//         },
//         "disposalList": [],
//         "medicationList": [
//           {
//             "presMedDtlList": [],
//             "genericName": "$genericName",
//             "brandName": "$brandName",
//             "form": null,
//             "formName": null,
//             "itemNo": 3000241,
//             "strength": null,
//             "route": "$route",
//             "preDiagnosisValType": 4,
//             "medicineStat": "$medicineStat",
//             "inReportSerial": 1
//           }
//         ]
//       });
//       if (response.statusCode == 200) {
//         var body = response.body;
//         return body;
//       } else {
//         print(response.reasonPhrase);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }
