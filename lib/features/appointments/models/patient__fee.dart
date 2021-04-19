// To parse this JSON data, do
//
//     final patientFee = patientFeeFromJson(jsonString);

import 'dart:convert';

PatientFee patientFeeFromJson(String str) => PatientFee.fromJson(json.decode(str));

String patientFeeToJson(PatientFee data) => json.encode(data.toJson());

class PatientFee {
  PatientFee({
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
  dynamic message;
  bool valid;
  dynamic id;
  dynamic model;
  dynamic items;
  int obj;

  factory PatientFee.fromJson(Map<String, dynamic> json) => PatientFee(
    success: json["success"],
    info: json["info"],
    warning: json["warning"],
    message: json["message"],
    valid: json["valid"],
    id: json["id"],
    model: json["model"],
    items: json["items"],
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
    "items": items,
    "obj": obj,
  };
}
