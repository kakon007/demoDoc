// To parse this JSON data, do
//
//     final emrPrescriptionListModel = emrPrescriptionListModelFromJson(jsonString);

import 'dart:convert';

EmrPrescriptionListModel emrPrescriptionListModelFromJson(String str) => EmrPrescriptionListModel.fromJson(json.decode(str));

String emrPrescriptionListModelToJson(EmrPrescriptionListModel data) => json.encode(data.toJson());

class EmrPrescriptionListModel {
  EmrPrescriptionListModel({
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

  factory EmrPrescriptionListModel.fromJson(Map<String, dynamic> json) => EmrPrescriptionListModel(
    success: json["success"] == null ? null : json["success"],
    info: json["info"] == null ? null : json["info"],
    warning: json["warning"] == null ? null : json["warning"],
    message: json["message"] == null ? null : json["message"],
    valid: json["valid"] == null ? null : json["valid"],
    id: json["id"],
    model: json["model"],
    items: json["items"],
    obj: json["obj"] == null ? null : Obj.fromJson(json["obj"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "info": info == null ? null : info,
    "warning": warning == null ? null : warning,
    "message": message == null ? null : message,
    "valid": valid == null ? null : valid,
    "id": id,
    "model": model,
    "items": items,
    "obj": obj == null ? null : obj.toJson(),
  };
}

class Obj {
  Obj({
    this.draw,
    this.recordsFiltered,
    this.recordsTotal,
    this.data,
  });

  String draw;
  String recordsFiltered;
  int recordsTotal;
  List<dynamic> data;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    draw: json["draw"] == null ? null : json["draw"],
    recordsFiltered: json["recordsFiltered"] == null ? null : json["recordsFiltered"],
    recordsTotal: json["recordsTotal"]==null?0:int.parse(json["recordsTotal"]?.toString()??"0"),
    data: json["data"] == null ? null : List<dynamic>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "draw": draw == null ? null : draw,
    "recordsFiltered": recordsFiltered == null ? null : recordsFiltered,
    "recordsTotal": recordsTotal == null ? null : recordsTotal,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x)),
  };
}
