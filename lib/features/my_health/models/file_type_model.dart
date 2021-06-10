// To parse this JSON data, do
//
//     final fileTypeListModel = fileTypeListModelFromJson(jsonString);

import 'dart:convert';

FileTypeListModel fileTypeListModelFromJson(String str) => FileTypeListModel.fromJson(json.decode(str));

String fileTypeListModelToJson(FileTypeListModel data) => json.encode(data.toJson());

class FileTypeListModel {
  FileTypeListModel({
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

  factory FileTypeListModel.fromJson(Map<String, dynamic> json) => FileTypeListModel(
    success: json["success"],
    info: json["info"],
    warning: json["warning"],
    message: json["message"],
    valid: json["valid"],
    id: json["id"],
    model: json["model"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
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
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "obj": obj,
  };
}

class Item {
  Item({
    this.typeNo,
    this.typeName,
  });

  int typeNo;
  String typeName;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    typeNo: json["typeNo"],
    typeName: json["typeName"],
  );

  Map<String, dynamic> toJson() => {
    "typeNo": typeNo,
    "typeName": typeName,
  };
}
