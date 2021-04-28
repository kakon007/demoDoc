// To parse this JSON data, do
//
//     final bookAppointmentModel = bookAppointmentModelFromJson(jsonString);

import 'dart:convert';

BookAppointmentModel bookAppointmentModelFromJson(String str) => BookAppointmentModel.fromJson(json.decode(str));

String bookAppointmentModelToJson(BookAppointmentModel data) => json.encode(data.toJson());

class BookAppointmentModel {
  BookAppointmentModel({
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
  dynamic items;
  Obj obj;

  factory BookAppointmentModel.fromJson(Map<String, dynamic> json) => BookAppointmentModel(
    success: json["success"],
    info: json["info"],
    warning: json["warning"],
    message: json["message"],
    valid: json["valid"],
    id: json["id"],
    model: json["model"],
    items: json["items"],
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
    "items": items,
    "obj": obj.toJson(),
  };
}

class Obj {
  Obj({
    this.slotSl,
    this.err,
    this.startTime,
    this.endTime,
    this.slotNo,
    this.appointmentNo,
    this.appointId,
  });

  int slotSl;
  String err;
  String startTime;
  String endTime;
  int slotNo;
  dynamic appointmentNo;
  String appointId;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    slotSl: json["slotSl"],
    err: json["err"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    slotNo: json["slotNo"],
    appointmentNo: json["appointmentNo"],
    appointId: json["appointID"],
  );

  Map<String, dynamic> toJson() => {
    "slotSl": slotSl,
    "err": err,
    "startTime": startTime,
    "endTime": endTime,
    "slotNo": slotNo,
    "appointmentNo": appointmentNo,
    "appointID": appointId,
  };
}
