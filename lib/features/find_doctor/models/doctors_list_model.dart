
import 'dart:convert';

DoctorsGridModel doctorsGridModelFromJson(String str) =>
    DoctorsGridModel.fromJson(json.decode(str));

String doctorsGridModelToJson(DoctorsGridModel data) =>
    json.encode(data.toJson());

class DoctorsGridModel {
  DoctorsGridModel({
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

  factory DoctorsGridModel.fromJson(Map<String, dynamic> json) =>
      DoctorsGridModel(
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
    this.draw,
    this.recordsFiltered,
    this.recordsTotal,
    this.data,
  });

  String draw;
  String recordsFiltered;
  int recordsTotal;
  List<Datum> data;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
        draw: json["draw"],
        recordsFiltered: json["recordsFiltered"],
        recordsTotal: json["recordsTotal"] == null
            ? 0
            : int.parse(json["recordsTotal"]?.toString() ?? "0"),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "draw": draw,
        "recordsFiltered": recordsFiltered,
        "recordsTotal": recordsTotal,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.doctorNo,
    this.doctorId,
    this.doctorName,
    this.jobtitleNo,
    this.jobtitle,
    this.docDegree,
    this.specializationNo,
    this.specializationName,
    this.gender,
    this.activeStat,
    this.chamber,
    this.doctorPhoto,
    this.companyNo,
    this.ogNo,
    this.consultationFee,
    this.buNo,
    this.buName,
    this.onlineDoctorFlag,
    this.specList,
    this.buList,
    this.photo,
  });

  int id;
  int doctorNo;
  String doctorId;
  String doctorName;
  int jobtitleNo;
  String jobtitle;
  String docDegree;
  int specializationNo;
  String specializationName;
  String gender;
  int activeStat;
  String chamber;
  String doctorPhoto;
  int companyNo;
  int ogNo;
  int consultationFee;
  int buNo;
  String buName;
  int onlineDoctorFlag;
  dynamic specList;
  dynamic buList;
  String photo;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        doctorNo: json["doctorNo"],
        doctorId: json["doctorId"],
        doctorName: json["doctorName"],
        jobtitleNo: json["jobtitleNo"] == null ? null : json["jobtitleNo"],
        jobtitle: json["jobtitle"] == null ? null : json["jobtitle"],
        docDegree: json["docDegree"] == null ? null : json["docDegree"],
        specializationNo: json["specializationNo"],
        specializationName: json["specializationName"],
        gender: json["gender"],
        activeStat: json["activeStat"],
        chamber: json["chamber"] == null ? null : json["chamber"],
        doctorPhoto: json["doctorPhoto"] == null ? null : json["doctorPhoto"],
        companyNo: json["companyNo"],
        ogNo: json["ogNo"],
        consultationFee: json["consultationFee"],
        buNo: json["buNo"],
        buName: json["buName"] == null ? null : json["buName"],
        onlineDoctorFlag: json["onlineDoctorFlag"],
        specList: json["specList"],
        buList: json["buList"],
        photo: json["photo"] == null ? null : json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctorNo": doctorNo,
        "doctorId": doctorId,
        "doctorName": doctorName,
        "jobtitleNo": jobtitleNo == null ? null : jobtitleNo,
        "jobtitle": jobtitle == null ? null : jobtitle,
        "docDegree": docDegree == null ? null : docDegree,
        "specializationNo": specializationNo,
        "specializationName": specializationName,
        "gender": gender,
        "activeStat": activeStat,
        "chamber": chamber == null ? null : chamber,
        "doctorPhoto": doctorPhoto == null ? null : doctorPhoto,
        "companyNo": companyNo,
        "ogNo": ogNo,
        "consultationFee": consultationFee,
        "buNo": buNo,
        "buName": buName == null ? null : buName,
        "onlineDoctorFlag": onlineDoctorFlag,
        "specList": specList,
        "buList": buList,
        "photo": photo == null ? null : photo,
      };
}
