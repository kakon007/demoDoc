// To parse this JSON data, do
//
//     final patientTypeModel = patientTypeModelFromJson(jsonString);

import 'dart:convert';

PatientTypeModel patientTypeModelFromJson(String str) => PatientTypeModel.fromJson(json.decode(str));

String patientTypeModelToJson(PatientTypeModel data) => json.encode(data.toJson());

class PatientTypeModel {
  PatientTypeModel({
    this.success,
    this.info,
    this.warning,
    this.message,
    this.valid,
    this.id,
    this.model,
    this.patientItem,
    this.obj,
  });

  bool success;
  bool info;
  bool warning;
  String message;
  bool valid;
  dynamic id;
  dynamic model;
  List<PatientItem> patientItem;
  dynamic obj;

  factory PatientTypeModel.fromJson(Map<String, dynamic> json) => PatientTypeModel(
    success: json["success"],
    info: json["info"],
    warning: json["warning"],
    message: json["message"],
    valid: json["valid"],
    id: json["id"],
    model: json["model"],
    patientItem: List<PatientItem>.from(json["items"].map((x) => PatientItem.fromJson(x))),
    obj: json["obj"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "info": info,
    "warning": warning,
    "message": message,
    "valid": valid,
    "id": id,
    "model": model,
    "items": List<dynamic>.from(patientItem.map((x) => x.toJson())),
    "obj": obj,
  };
}

class PatientItem {
  PatientItem({
    this.patientTypeNo,
    this.patientTypeName,
  });

  String patientTypeNo;
  String patientTypeName;

  factory PatientItem.fromJson(Map<String, dynamic> json) => PatientItem(
    patientTypeNo: json["patientTypeNo"],
    patientTypeName: json["patientTypeName"],
  );

  Map<String, dynamic> toJson() => {
    "patientTypeNo": patientTypeNo,
    "patientTypeName": patientTypeName,
  };
}
