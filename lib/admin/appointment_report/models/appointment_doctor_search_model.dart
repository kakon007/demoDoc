// To parse this JSON data, do
//
//     final appointmentDoctorSearchtModel = appointmentDoctorSearchtModelFromJson(jsonString);

import 'dart:convert';

AppointmentDoctorSearchtModel appointmentDoctorSearchtModelFromJson(String str) => AppointmentDoctorSearchtModel.fromJson(json.decode(str));

String appointmentDoctorSearchtModelToJson(AppointmentDoctorSearchtModel data) => json.encode(data.toJson());

class AppointmentDoctorSearchtModel {
  AppointmentDoctorSearchtModel({
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
  List<DocItem> items;
  dynamic obj;

  factory AppointmentDoctorSearchtModel.fromJson(Map<String, dynamic> json) => AppointmentDoctorSearchtModel(
    success: json["success"] == null ? null : json["success"],
    info: json["info"] == null ? null : json["info"],
    warning: json["warning"] == null ? null : json["warning"],
    message: json["message"] == null ? null : json["message"],
    valid: json["valid"] == null ? null : json["valid"],
    id: json["id"],
    model: json["model"],
    items: json["items"] == null ? null : List<DocItem>.from(json["items"].map((x) => DocItem.fromJson(x))),
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
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
    "obj": obj,
  };
}

class DocItem {
  DocItem({
    this.firstName,
    this.lName,
    this.qualification,
    this.address,
    this.doctorId,
    this.chamberAddress1,
    this.chamberAddress2,
    this.doctorSignature,
    this.doctorNo,
  });

  String firstName;
  dynamic lName;
  String qualification;
  String address;
  String doctorId;
  String chamberAddress1;
  String chamberAddress2;
  String doctorSignature;
  int doctorNo;

  factory DocItem.fromJson(Map<String, dynamic> json) => DocItem(
    firstName: json["firstName"] == null ? null : json["firstName"],
    lName: json["lName"],
    qualification: json["qualification"] == null ? null : json["qualification"],
    address: json["address"] == null ? null : json["address"],
    doctorId: json["doctorId"] == null ? null : json["doctorId"],
    chamberAddress1: json["chamberAddress1"] == null ? null : json["chamberAddress1"],
    chamberAddress2: json["chamberAddress2"] == null ? null : json["chamberAddress2"],
    doctorSignature: json["doctorSignature"] == null ? null : json["doctorSignature"],
    doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName == null ? null : firstName,
    "lName": lName,
    "qualification": qualification == null ? null : qualification,
    "address": address == null ? null : address,
    "doctorId": doctorId == null ? null : doctorId,
    "chamberAddress1": chamberAddress1 == null ? null : chamberAddress1,
    "chamberAddress2": chamberAddress2 == null ? null : chamberAddress2,
    "doctorSignature": doctorSignature == null ? null : doctorSignature,
    "doctorNo": doctorNo == null ? null : doctorNo,
  };
}
