import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/common_prescription_search_items_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/get_template_data_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/get_template_data_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/prescription_template_repository.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/prescription_template_model.dart';

class GetTamplateDataViewModel extends ChangeNotifier {
  Obj _prescriptionTamplateList;
  AppError _appError;
  bool _isFetchingData = false;
  bool _hasMoreData = false;
  get logger => null;
  List<CommonPrescriptionSearchItems> investigationSelectedItems = [];
  List<String> clinicalHistorySelectedItems = [];
  List<String> pastIllnessSelectedItems = [];
  List<String> chiefComplaintSelectedItems = [];
  List<String> diseaseSelectedItems = [];

  List<String> provisionalDiagnosisSelectedItems = [];
  List<String> adviceSelectedItems = [];
  Future<bool> getData({var templateId}) async {
    investigationSelectedItems.clear();
    provisionalDiagnosisSelectedItems.clear();
    adviceSelectedItems.clear();

    print('Enterer');
    _isFetchingData = true;
    var res = await GetTemplateDataRepository()
        .fetchTemplateData(templateId: templateId);
    notifyListeners();
    res.fold((l) {
      _appError = l;
      _isFetchingData = false;
      print('falsew:: ');
      notifyListeners();
      return false;
    }, (r) {
      _isFetchingData = false;
      r.dataList.investigationList.forEach((element) {
        if (investigationSelectedItems.contains(element.preDiagnosisVal)) {
          print('already added');
        } else {
          investigationSelectedItems.add(CommonPrescriptionSearchItems(
              itemName: element.preDiagnosisVal,
              itemTypeNo: element.preDiagnosisValType,
              itemNo: element.preDiagnosisValType));
        }
        print('shakil ${investigationSelectedItems.length}');
      });
//clinical History
      r.dataList.clinicalHistory3List.forEach((element) {
        if (clinicalHistorySelectedItems.contains(element.preDiagnosisVal)) {
          print('already added');
        } else {
          clinicalHistorySelectedItems.add(element.preDiagnosisVal);
        }
        print('shakil ${clinicalHistorySelectedItems.length}');
      });
//pastillness
      r.dataList.clinicalHistory2List.forEach((element) {
        if (pastIllnessSelectedItems.contains(element.preDiagnosisVal)) {
          print('already added');
        } else {
          pastIllnessSelectedItems.add(element.preDiagnosisVal);
        }
      });

      _prescriptionTamplateList = r.dataList;
      r.dataList.chiefComplainList.forEach((element) {
        if (chiefComplaintSelectedItems.contains(element.preDiagnosisVal)) {
          print('already added');
        } else {
          chiefComplaintSelectedItems.add(element.preDiagnosisVal);
        }
      });
      r.dataList.diseaseList.forEach((element) {
        if (diseaseSelectedItems.contains(element.preDiagnosisVal)) {
          print('already added');
        } else {
          diseaseSelectedItems.add(element.preDiagnosisVal);
          print('monir ${diseaseSelectedItems.length}');
        }
      });
      _prescriptionTamplateList = r.dataList;
      r.dataList.diagnosisList.forEach((element) {
        print('aaaaaaa');
        if(provisionalDiagnosisSelectedItems.contains(element.preDiagnosisVal)){
          print('already added');
        }
        else{
          provisionalDiagnosisSelectedItems.add(element.preDiagnosisVal);
        }
        print('shakil ${provisionalDiagnosisSelectedItems.length}');
      });
      r.dataList.adviceList.forEach((element) {
        print('aaaaaaa');
        if(adviceSelectedItems.contains(element.preDiagnosisVal)){
          print('already added');
        }
        else{
          adviceSelectedItems.add(element.preDiagnosisVal);
        }
        print('shakil ${provisionalDiagnosisSelectedItems.length}');
      });
      _prescriptionTamplateList=r.dataList;
      notifyListeners();
      return true;
    });
  }

  AppError get appError => _appError;
  bool get isFetchingData => _isFetchingData;
  Obj get prescriptionTamplateListData => _prescriptionTamplateList;
}
