import 'dart:convert';

import 'package:flutter/cupertino.dart';

VitalsSetupModel vitalsSetupModelFromJson(String str) =>
    VitalsSetupModel.fromJson(json.decode(str));

String vitalsSetupModelToJson(VitalsSetupModel data) =>
    json.encode(data.toJson());

class VitalsSetupModel {
  VitalsSetupModel({
    this.success,
    this.info,
    this.warning,
    this.message,
    this.valid,
    this.id,
    this.model,
    this.vitalsItems,
    this.obj,
  });

  bool success;
  bool info;
  bool warning;
  String message;
  bool valid;
  dynamic id;
  dynamic model;
  List<VitalsItem> vitalsItems;
  dynamic obj;

  factory VitalsSetupModel.fromJson(Map<String, dynamic> json) =>
      VitalsSetupModel(
        success: json["success"] == null ? null : json["success"],
        info: json["info"] == null ? null : json["info"],
        warning: json["warning"] == null ? null : json["warning"],
        message: json["message"] == null ? null : json["message"],
        valid: json["valid"] == null ? null : json["valid"],
        id: json["id"],
        model: json["model"],
        vitalsItems: json["items"] == null
            ? []
            : List<VitalsItem>.from(
                json["items"].map((x) => VitalsItem.fromJson(x))),
        obj: json["obj"],
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "info": info == null ? null : info,
        "warning": warning == null ? null : warning,
        "message": message == null ? null : message,
        "valid": valid == null ? null : valid,
        "id": id,
        "model": model,
        "items": vitalsItems == null
            ? []
            : List<dynamic>.from(vitalsItems.map((x) => x.toJson())),
        "obj": obj,
      };
}

class VitalsItem {
  VitalsItem({
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
  dynamic ssCreatedOn;
  dynamic ssCreateSession;
  dynamic ssModifier;
  dynamic ssModifiedOn;
  dynamic ssModifiedSession;
  int companyNo;
  int organizationNo;
  int id;
  String preDiagnosisVal;
  int preDiagnosisValType;
  dynamic preDiagnosisValLocal;
  dynamic preDiagnosisValShort;
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
  TextEditingController vitalsController = TextEditingController();

  factory VitalsItem.fromJson(Map<String, dynamic> json) => VitalsItem(
        ssCreator: json["ssCreator"] == null ? null : json["ssCreator"],
        ssCreatedOn: json["ssCreatedOn"],
        ssCreateSession: json["ssCreateSession"],
        ssModifier: json["ssModifier"],
        ssModifiedOn: json["ssModifiedOn"],
        ssModifiedSession: json["ssModifiedSession"],
        companyNo: json["companyNo"] == null ? null : json["companyNo"],
        organizationNo:
            json["organizationNo"] == null ? null : json["organizationNo"],
        id: json["id"] == null ? null : json["id"],
        preDiagnosisVal:
            json["preDiagnosisVal"] == null ? null : json["preDiagnosisVal"],
        preDiagnosisValType: json["preDiagnosisValType"] == null
            ? null
            : json["preDiagnosisValType"],
        preDiagnosisValLocal: json["preDiagnosisValLocal"],
        preDiagnosisValShort: json["preDiagnosisValShort"],
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
        doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
        activeStatus:
            json["activeStatus"] == null ? null : json["activeStatus"],
        idNotEqual: json["idNotEqual"],
        preDiagnosisValTypes: json["preDiagnosisValTypes"],
        deptNoNull: json["deptNoNull"] == null ? null : json["deptNoNull"],
      );

  Map<String, dynamic> toJson() => {
        "ssCreator": ssCreator == null ? null : ssCreator,
        "ssCreatedOn": ssCreatedOn,
        "ssCreateSession": ssCreateSession,
        "ssModifier": ssModifier,
        "ssModifiedOn": ssModifiedOn,
        "ssModifiedSession": ssModifiedSession,
        "companyNo": companyNo == null ? null : companyNo,
        "organizationNo": organizationNo == null ? null : organizationNo,
        "id": id == null ? null : id,
        "preDiagnosisVal": preDiagnosisVal == null ? null : preDiagnosisVal,
        "preDiagnosisValType":
            preDiagnosisValType == null ? null : preDiagnosisValType,
        "preDiagnosisValLocal": preDiagnosisValLocal,
        "preDiagnosisValShort": preDiagnosisValShort,
        "preDiagnosisValUnit":
            preDiagnosisValUnit == null ? null : preDiagnosisValUnit,
        "preDiagnosisValDefaultVal": preDiagnosisValDefaultVal,
        "orderSl": orderSl == null ? null : orderSl,
        "preDiagnosisValInputType":
            preDiagnosisValInputType == null ? null : preDiagnosisValInputType,
        "calculationMethod": calculationMethod,
        "departmentNo": departmentNo,
        "doctorNo": doctorNo == null ? null : doctorNo,
        "activeStatus": activeStatus == null ? null : activeStatus,
        "idNotEqual": idNotEqual,
        "preDiagnosisValTypes": preDiagnosisValTypes,
        "deptNoNull": deptNoNull == null ? null : deptNoNull,
      };
}
