
// To parse this JSON data, do
//
//     final autoSlotGenerateModel = autoSlotGenerateModelFromJson(jsonString);

import 'dart:convert';

AutoSlotGenerateModel autoSlotGenerateModelFromJson(String str) => AutoSlotGenerateModel.fromJson(json.decode(str));

String autoSlotGenerateModelToJson(AutoSlotGenerateModel data) => json.encode(data.toJson());

class AutoSlotGenerateModel {
  AutoSlotGenerateModel({
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
  dynamic obj;

  factory AutoSlotGenerateModel.fromJson(Map<String, dynamic> json) => AutoSlotGenerateModel(
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
