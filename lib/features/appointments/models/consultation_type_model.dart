// To parse this JSON data, do
//
//     final consultTypeModel = consultTypeModelFromJson(jsonString);

import 'dart:convert';

ConsultTypeModel consultTypeModelFromJson(String str) => ConsultTypeModel.fromJson(json.decode(str));

String consultTypeModelToJson(ConsultTypeModel data) => json.encode(data.toJson());

class ConsultTypeModel {
  ConsultTypeModel({
    this.success,
    this.info,
    this.warning,
    this.message,
    this.valid,
    this.id,
    this.model,
    this.consultType,
    this.obj,
  });

  bool success;
  bool info;
  bool warning;
  String message;
  bool valid;
  dynamic id;
  dynamic model;
  List<ConsultType> consultType;
  dynamic obj;

  factory ConsultTypeModel.fromJson(Map<String, dynamic> json) => ConsultTypeModel(
    success: json["success"],
    info: json["info"],
    warning: json["warning"],
    message: json["message"],
    valid: json["valid"],
    id: json["id"],
    model: json["model"],
    consultType: List<ConsultType>.from(json["items"].map((x) => ConsultType.fromJson(x))),
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
    "items": List<dynamic>.from(consultType.map((x) => x.toJson())),
    "obj": obj,
  };
}

class ConsultType {
  ConsultType({
    this.no,
    this.name,
  });

  String no;
  String name;

  factory ConsultType.fromJson(Map<String, dynamic> json) => ConsultType(
    no: json["no"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "no": no,
    "name": name,
  };
}
