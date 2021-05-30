// To parse this JSON data, do
//
//     final memberDeleteModel = memberDeleteModelFromJson(jsonString);

import 'dart:convert';

MemberDeleteModel memberDeleteModelFromJson(String str) => MemberDeleteModel.fromJson(json.decode(str));

String memberDeleteModelToJson(MemberDeleteModel data) => json.encode(data.toJson());

class MemberDeleteModel {
  MemberDeleteModel({
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

  factory MemberDeleteModel.fromJson(Map<String, dynamic> json) => MemberDeleteModel(
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
