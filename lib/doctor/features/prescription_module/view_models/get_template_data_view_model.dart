import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/common_prescription_search_items_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/get_template_data_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/prescription_template_save_data_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/get_template_data_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/prescription_template_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/save_prescription_template_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/medication_widget.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/models/prescription_template_model.dart';
import 'package:provider/provider.dart';

class GetTamplateDataViewModel extends ChangeNotifier {
  static GetTamplateDataViewModel read(BuildContext context) =>
      context.read<GetTamplateDataViewModel>();
  static GetTamplateDataViewModel watch(BuildContext context) =>
      context.watch<GetTamplateDataViewModel>();
  Obj _prescriptionTamplateList;
  AppError _appError;
  bool _isFetchingData = false;
  bool _hasMoreData = false;
  get logger => null;
  String templateName = '';
  List<CommonPrescriptionSearchItems> investigationSelectedItems = [];
  List<String> clinicalHistorySelectedItems = [];
  List<String> pastIllnessSelectedItems = [];
  List<String> chiefComplaintSelectedItems = [];
  List<String> diseaseSelectedItems = [];
  List<String> provisionalDiagnosisSelectedItems = [];
  List<String> adviceSelectedItems = [];
  List<AddMultiDose> multiDose = [];
  List<MultiDose> multiDoseItemList = [];
  List<MedicineList> medicineList = [];
  Future<bool> getData({var templateId}) async {
    investigationSelectedItems.clear();
    provisionalDiagnosisSelectedItems.clear();
    adviceSelectedItems.clear();
    chiefComplaintSelectedItems.clear();
    pastIllnessSelectedItems.clear();
    diseaseSelectedItems.clear();
    clinicalHistorySelectedItems.clear();
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
      //investigation
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

      //Chief Complaints
      r.dataList.chiefComplainList.forEach((element) {
        if (chiefComplaintSelectedItems.contains(element.preDiagnosisVal)) {
          print('already added');
        } else {
          chiefComplaintSelectedItems.add(element.preDiagnosisVal);
        }
      });

      //diseaseList
      r.dataList.diseaseList.forEach((element) {
        if (diseaseSelectedItems.contains(element.preDiagnosisVal)) {
          print('already added');
        } else {
          diseaseSelectedItems.add(element.preDiagnosisVal);
          print('monir ${diseaseSelectedItems.length}');
        }
      });
      //Diagnosis
      r.dataList.diagnosisList.forEach((element) {
        print('aaaaaaa');
        if (provisionalDiagnosisSelectedItems
            .contains(element.preDiagnosisVal)) {
          print('already added');
        } else {
          provisionalDiagnosisSelectedItems.add(element.preDiagnosisVal);
        }
        print('shakil ${provisionalDiagnosisSelectedItems.length}');
      });
      //Advice
      r.dataList.adviceList.forEach((element) {
        print('aaaaaaa');
        if (adviceSelectedItems.contains(element.preDiagnosisVal)) {
          print('already added');
        } else {
          adviceSelectedItems.add(element.preDiagnosisVal);
        }
        print('shakil ${provisionalDiagnosisSelectedItems.length}');
      });
      //mediaction
      r.dataList.medicationList.forEach((element) {
        print('aaaaaaa');
        if (medicineList.contains(element.brandName)) {
          print('already added');
        } else {
          medicineList.add(MedicineList(
            brandName: element.brandName,
            genericName: element.genericName,
            duration: element.presMedDtlList.first.duration,
            dose: element.presMedDtlList.first.dosage,
            instruction: element.presMedDtlList.first.medicineComment,
            durationType: element.presMedDtlList.first.durationMu,
            multiDoseList: [],
          ));
        }
        print('shakil ${provisionalDiagnosisSelectedItems.length}');
      });
      _prescriptionTamplateList = r.dataList;
      notifyListeners();
      return true;
    });
  }

  setPrescriptionData() {
    var prescriptionData = PrescriptionTemplateSaveModel(
      prescriptionTemp:
          PrescriptionTempData(templateName: templateName, activeStatus: 1),
      adviceList: adviceSelectedItems
          .map((e) =>
              AdviceListElement(preDiagnosisVal: e, preDiagnosisValType: 8))
          .toList(),
      chiefComplainList: chiefComplaintSelectedItems
          .map((e) =>
              AdviceListElement(preDiagnosisVal: e, preDiagnosisValType: 7))
          .toList(),
      diseaseList: diseaseSelectedItems
          .map((e) =>
              AdviceListElement(preDiagnosisVal: e, preDiagnosisValType: 24))
          .toList(),
      clinicalHistory3List: clinicalHistorySelectedItems
          .map((e) =>
              AdviceListElement(preDiagnosisVal: e, preDiagnosisValType: 32))
          .toList(),
      clinicalHistory2List: pastIllnessSelectedItems
          .map((e) =>
              AdviceListElement(preDiagnosisVal: e, preDiagnosisValType: 9))
          .toList(),
      diagnosisList: provisionalDiagnosisSelectedItems
          .map((e) =>
              AdviceListElement(preDiagnosisVal: e, preDiagnosisValType: 6))
          .toList(),
      investigationList: investigationSelectedItems
          .map((e) => InvestigationList(
                preDiagnosisVal: e.itemName,
                preDiagnosisValType: 1,
                itemTypeNo: e.itemTypeNo,
              ))
          .toList(),
      medicationList: medicineList
          .map((e) => MedicationList2(
                genericName: e.genericName,
                brandName: e.genericName,
                preDiagnosisValType: 4,
                route: e.route,
                presMedDtlList: medicineList
                    .map((e2) => PresMedDtlList2(
                          duration: e2.duration,
                          dosage: e2.dose,
                          durationMu: e2.durationType,
                          medicineComment: e2.instruction,
                        ))
                    .toList(),
              ))
          .toList(),
    );
    SavePrescripTionTemplateRepository().fetchFileType(prescriptionData);
  }

  AppError get appError => _appError;
  bool get isFetchingData => _isFetchingData;
  Obj get prescriptionTamplateListData => _prescriptionTamplateList;
}
