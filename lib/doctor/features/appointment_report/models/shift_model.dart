// To parse this JSON data, do
//
//     final shiftListModel = shiftListModelFromJson(jsonString);

import 'dart:convert';

ShiftListModel shiftListModelFromJson(String str) => ShiftListModel.fromJson(json.decode(str));

String shiftListModelToJson(ShiftListModel data) => json.encode(data.toJson());

class ShiftListModel {
  ShiftListModel({
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
  List<Item> items;
  dynamic obj;

  factory ShiftListModel.fromJson(Map<String, dynamic> json) => ShiftListModel(
    success: json["success"] == null ? null : json["success"],
    info: json["info"] == null ? null : json["info"],
    warning: json["warning"] == null ? null : json["warning"],
    message: json["message"] == null ? null : json["message"],
    valid: json["valid"] == null ? null : json["valid"],
    id: json["id"],
    model: json["model"],
    items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
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

class Item {
  Item({
    this.shiftTime,
    this.shiftName,
    this.shiftOutsec,
    this.shiftInsec,
    this.shiftNo,
  });

  String shiftTime;
  String shiftName;
  String shiftOutsec;
  String shiftInsec;
  int shiftNo;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    shiftTime: json["shiftTime"] == null ? null : json["shiftTime"],
    shiftName: json["shiftName"] == null ? null : json["shiftName"],
    shiftOutsec: json["shiftOutsec"] == null ? null : json["shiftOutsec"],
    shiftInsec: json["shiftInsec"] == null ? null : json["shiftInsec"],
    shiftNo: json["shiftNo"] == null ? null : json["shiftNo"],
  );

  Map<String, dynamic> toJson() => {
    "shiftTime": shiftTime == null ? null : shiftTime,
    "shiftName": shiftName == null ? null : shiftName,
    "shiftOutsec": shiftOutsec == null ? null : shiftOutsec,
    "shiftInsec": shiftInsec == null ? null : shiftInsec,
    "shiftNo": shiftNo == null ? null : shiftNo,
  };
}
