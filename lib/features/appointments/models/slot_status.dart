// To parse this JSON data, do
//
//     final slotStatusModel = slotStatusModelFromJson(jsonString);

import 'dart:convert';

SlotStatusModel slotStatusModelFromJson(String str) => SlotStatusModel.fromJson(json.decode(str));

String slotStatusModelToJson(SlotStatusModel data) => json.encode(data.toJson());

class SlotStatusModel {
  SlotStatusModel({
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
  Model model;
  dynamic items;
  dynamic obj;

  factory SlotStatusModel.fromJson(Map<String, dynamic> json) => SlotStatusModel(
    success: json["success"],
    info: json["info"],
    warning: json["warning"],
    message: json["message"],
    valid: json["valid"],
    id: json["id"],
    model: Model.fromJson(json["model"]),
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
    "model": model.toJson(),
    "items": items,
    "obj": obj,
  };
}

class Model {
  Model({
    this.actionFlag,
    this.status,
  });

  String actionFlag;
  String status;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    actionFlag: json["actionFlag"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "actionFlag": actionFlag,
    "status": status,
  };
}
