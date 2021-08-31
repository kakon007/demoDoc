import 'dart:convert';

MedicationModel medicationModelFromJson(String str) =>
    MedicationModel.fromJson(json.decode(str));

String medicationModelToJson(MedicationModel data) =>
    json.encode(data.toJson());

class MedicationModel {
  MedicationModel({
    this.success,
    this.info,
    this.warning,
    this.message,
    this.valid,
    this.id,
    this.model,
    this.items,
    this.obj,
  });

  bool success;
  bool info;
  bool warning;
  String message;
  bool valid;
  dynamic id;
  dynamic model;
  List<MedicationItem> items;
  Obj obj;

  factory MedicationModel.fromJson(Map<String, dynamic> json) =>
      MedicationModel(
        success: json["success"],
        info: json["info"],
        warning: json["warning"],
        message: json["message"],
        valid: json["valid"],
        id: json["id"],
        model: json["model"],
        items: List<MedicationItem>.from(
            json["items"].map((x) => MedicationItem.fromJson(x))),
        obj: Obj.fromJson(json["obj"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "info": info,
        "warning": warning,
        "message": message,
        "valid": valid,
        "id": id,
        "model": model,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "obj": obj.toJson(),
      };
}

class MedicationItem {
  MedicationItem({
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.organizationNo,
    this.id,
    this.preDiagnosisVal,
    this.preDiagnosisValType,
    this.preDiagnosisValLocal,
    this.preDiagnosisValShort,
    this.preDiagnosisValUnit,
    this.preDiagnosisValDefaultVal,
    this.orderSl,
    this.preDiagnosisValInputType,
    this.calculationMethod,
    this.departmentNo,
    this.doctorNo,
    this.activeStatus,
    this.idNotEqual,
    this.preDiagnosisValTypes,
    this.deptNoNull,
  });

  int ssCreator;
  String ssCreatedOn;
  int ssCreateSession;
  int ssModifier;
  String ssModifiedOn;
  int ssModifiedSession;
  int companyNo;
  int organizationNo;
  int id;
  String preDiagnosisVal;
  int preDiagnosisValType;
  dynamic preDiagnosisValLocal;
  String preDiagnosisValShort;
  String preDiagnosisValUnit;
  dynamic preDiagnosisValDefaultVal;
  int orderSl;
  int preDiagnosisValInputType;
  dynamic calculationMethod;
  dynamic departmentNo;
  int doctorNo;
  int activeStatus;
  dynamic idNotEqual;
  dynamic preDiagnosisValTypes;
  bool deptNoNull;

  factory MedicationItem.fromJson(Map<String, dynamic> json) => MedicationItem(
        ssCreator: json["ssCreator"],
        ssCreatedOn: json["ssCreatedOn"] == null ? null : json["ssCreatedOn"],
        ssCreateSession:
            json["ssCreateSession"] == null ? null : json["ssCreateSession"],
        ssModifier: json["ssModifier"] == null ? null : json["ssModifier"],
        ssModifiedOn:
            json["ssModifiedOn"] == null ? null : json["ssModifiedOn"],
        ssModifiedSession: json["ssModifiedSession"] == null
            ? null
            : json["ssModifiedSession"],
        companyNo: json["companyNo"],
        organizationNo: json["organizationNo"],
        id: json["id"],
        preDiagnosisVal: json["preDiagnosisVal"],
        preDiagnosisValType: json["preDiagnosisValType"],
        preDiagnosisValLocal: json["preDiagnosisValLocal"],
        preDiagnosisValShort: json["preDiagnosisValShort"] == null
            ? null
            : json["preDiagnosisValShort"],
        preDiagnosisValUnit: json["preDiagnosisValUnit"] == null
            ? null
            : json["preDiagnosisValUnit"],
        preDiagnosisValDefaultVal: json["preDiagnosisValDefaultVal"],
        orderSl: json["orderSl"] == null ? null : json["orderSl"],
        preDiagnosisValInputType: json["preDiagnosisValInputType"] == null
            ? null
            : json["preDiagnosisValInputType"],
        calculationMethod: json["calculationMethod"],
        departmentNo: json["departmentNo"],
        doctorNo: json["doctorNo"],
        activeStatus: json["activeStatus"],
        idNotEqual: json["idNotEqual"],
        preDiagnosisValTypes: json["preDiagnosisValTypes"],
        deptNoNull: json["deptNoNull"],
      );

  Map<String, dynamic> toJson() => {
        "ssCreator": ssCreator,
        "ssCreatedOn": ssCreatedOn == null ? null : ssCreatedOn,
        "ssCreateSession": ssCreateSession == null ? null : ssCreateSession,
        "ssModifier": ssModifier == null ? null : ssModifier,
        "ssModifiedOn": ssModifiedOn == null ? null : ssModifiedOn,
        "ssModifiedSession":
            ssModifiedSession == null ? null : ssModifiedSession,
        "companyNo": companyNo,
        "organizationNo": organizationNo,
        "id": id,
        "preDiagnosisVal": preDiagnosisVal,
        "preDiagnosisValType": preDiagnosisValType,
        "preDiagnosisValLocal": preDiagnosisValLocal,
        "preDiagnosisValShort":
            preDiagnosisValShort == null ? null : preDiagnosisValShort,
        "preDiagnosisValUnit":
            preDiagnosisValUnit == null ? null : preDiagnosisValUnit,
        "preDiagnosisValDefaultVal": preDiagnosisValDefaultVal,
        "orderSl": orderSl == null ? null : orderSl,
        "preDiagnosisValInputType":
            preDiagnosisValInputType == null ? null : preDiagnosisValInputType,
        "calculationMethod": calculationMethod,
        "departmentNo": departmentNo,
        "doctorNo": doctorNo,
        "activeStatus": activeStatus,
        "idNotEqual": idNotEqual,
        "preDiagnosisValTypes": preDiagnosisValTypes,
        "deptNoNull": deptNoNull,
      };
}

class Obj {
  Obj({
    this.durationMuList,
    this.doseList,
    this.routeList,
    this.durationList,
    this.relationWithMealList,
  });

  List<MedicationItem> durationMuList;
  List<MedicationItem> doseList;
  List<MedicationItem> routeList;
  List<MedicationItem> durationList;
  List<MedicationItem> relationWithMealList;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
        durationMuList: List<MedicationItem>.from(
            json["durationMuList"].map((x) => MedicationItem.fromJson(x))),
        doseList: List<MedicationItem>.from(
            json["doseaseList"].map((x) => MedicationItem.fromJson(x))),
        routeList: List<MedicationItem>.from(
            json["routeList"].map((x) => MedicationItem.fromJson(x))),
        durationList: List<MedicationItem>.from(
            json["durationList"].map((x) => MedicationItem.fromJson(x))),
        relationWithMealList: List<MedicationItem>.from(
            json["relationWithMealList"]
                .map((x) => MedicationItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "durationMuList":
            List<dynamic>.from(durationMuList.map((x) => x.toJson())),
        "doseaseList": List<dynamic>.from(doseList.map((x) => x.toJson())),
        "routeList": List<dynamic>.from(routeList.map((x) => x.toJson())),
        "durationList": List<dynamic>.from(durationList.map((x) => x.toJson())),
        "relationWithMealList":
            List<dynamic>.from(relationWithMealList.map((x) => x.toJson())),
      };
}
