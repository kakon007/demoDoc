// To parse this JSON data, do
//
//     final appointmentPreviousModel = appointmentPreviousModelFromJson(jsonString);

import 'dart:convert';

AppointmentPreviousModel appointmentPreviousModelFromJson(String str) => AppointmentPreviousModel.fromJson(json.decode(str));

String appointmentPreviousModelToJson(AppointmentPreviousModel data) => json.encode(data.toJson());

class AppointmentPreviousModel {
  AppointmentPreviousModel({
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
  Obj obj;

  factory AppointmentPreviousModel.fromJson(Map<String, dynamic> json) => AppointmentPreviousModel(
    success: json["success"],
    info: json["info"],
    warning: json["warning"],
    message: json["message"],
    valid: json["valid"],
    id: json["id"],
    model: json["model"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
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
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "obj": obj.toJson(),
  };
}

class Item {
  Item({
    this.appointNo,
    this.appointId,
    this.appointDate,
    this.doctorNo,
    this.doctorName,
    this.doctorImage,
    this.specialtyNo,
    this.doctorSpecialtyName,
    this.shiftNo,
    this.consultTypeNo,
    this.consultTypeName,
    this.slotSl,
    this.startTime,
    this.endTime,
    this.regNo,
    this.regId,
    this.patientName,
    this.companyName,
    this.companyAlias,
    this.prescriptionNo,
    this.consultationNo,
    this.consultationId,
    this.status,
    this.companyNo,
    this.organizationNo,
    this.statusArr,
    this.photo,
  });

  int appointNo;
  String appointId;
  String appointDate;
  int doctorNo;
  String doctorName;
  DoctorImage doctorImage;
  int specialtyNo;
  String doctorSpecialtyName;
  int shiftNo;
  int consultTypeNo;
  String consultTypeName;
  int slotSl;
  String startTime;
  String endTime;
  int regNo;
  RegId regId;
  String patientName;
  String companyName;
  CompanyAlias companyAlias;
  int prescriptionNo;
  int consultationNo;
  String consultationId;
  int status;
  int companyNo;
  int organizationNo;
  dynamic statusArr;
  String photo;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    appointNo: json["appointNo"],
    appointId: json["appointId"],
    appointDate: json["appointDate"],
    doctorNo: json["doctorNo"],
    doctorName: json["doctorName"],
    doctorImage: json["doctorImage"] == null ? null : doctorImageValues.map[json["doctorImage"]],
    specialtyNo: json["specialtyNo"] == null ? null : json["specialtyNo"],
    doctorSpecialtyName: json["doctorSpecialtyName"] == null ? null : json["doctorSpecialtyName"],
    shiftNo: json["shiftNo"],
    consultTypeNo: json["consultTypeNo"],
    consultTypeName: json["consultTypeName"],
    slotSl: json["slotSl"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    regNo: json["regNo"],
    regId: regIdValues.map[json["regId"]],
    patientName: json["patientName"],
    companyName: json["companyName"],
    companyAlias: companyAliasValues.map[json["companyAlias"]],
    prescriptionNo: json["prescriptionNo"],
    consultationNo: json["consultationNo"],
    consultationId: json["consultationId"],
    status: json["status"],
    companyNo: json["companyNo"] == null ? null : json["companyNo"],
    organizationNo: json["organizationNo"] == null ? null : json["organizationNo"],
    statusArr: json["statusArr"],
    photo: json["photo"] == null ? null : json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "appointNo": appointNo,
    "appointId": appointId,
    "appointDate": appointDate,
    "doctorNo": doctorNo,
    "doctorName": doctorNameValues.reverse[doctorName],
    "doctorImage": doctorImage == null ? null : doctorImageValues.reverse[doctorImage],
    "specialtyNo": specialtyNo == null ? null : specialtyNo,
    "doctorSpecialtyName": doctorSpecialtyName == null ? null : doctorSpecialtyNameValues.reverse[doctorSpecialtyName],
    "shiftNo": shiftNo,
    "consultTypeNo": consultTypeNo,
    "consultTypeName": consultTypeNameValues.reverse[consultTypeName],
    "slotSl": slotSl,
    "startTime": startTime,
    "endTime": endTime,
    "regNo": regNo,
    "regId": regIdValues.reverse[regId],
    "patientName": patientName,
    "companyName": companyNameValues.reverse[companyName],
    "companyAlias": companyAliasValues.reverse[companyAlias],
    "prescriptionNo": prescriptionNo,
    "consultationNo": consultationNo,
    "consultationId": consultationId,
    "status": status,
    "companyNo": companyNo == null ? null : companyNo,
    "organizationNo": organizationNo == null ? null : organizationNo,
    "statusArr": statusArr,
    "photo": photo == null ? null : photo,
  };
}

enum CompanyAlias { LSD2, DDC, RSH, AHC }

final companyAliasValues = EnumValues({
  "AHC": CompanyAlias.AHC,
  "DDC": CompanyAlias.DDC,
  "LSD2": CompanyAlias.LSD2,
  "RSH": CompanyAlias.RSH
});

enum CompanyName { LAB_SCIENCE_DIAGNOSTIC_02, DHANMONDI_DENTAL_CENTER, RUSHMONO_SPECIALIZED_HOSPITAL, AALOK_HEALTHCARE_LTD_BRANCH_MIRPUR_10 }

final companyNameValues = EnumValues({
  "Aalok Healthcare Ltd (Branch Mirpur 10) ": CompanyName.AALOK_HEALTHCARE_LTD_BRANCH_MIRPUR_10,
  "Dhanmondi Dental Center": CompanyName.DHANMONDI_DENTAL_CENTER,
  "Lab Science Diagnostic 02": CompanyName.LAB_SCIENCE_DIAGNOSTIC_02,
  "Rushmono Specialized Hospital": CompanyName.RUSHMONO_SPECIALIZED_HOSPITAL
});

enum ConsultTypeName { REPORT_CHECK, NEW_PATIENT, THE_1_ST_FOLLOW_UP, CONSULT_TYPE_NAME_NEW_PATIENT }

final consultTypeNameValues = EnumValues({
  "NEW PATIENT": ConsultTypeName.CONSULT_TYPE_NAME_NEW_PATIENT,
  "New Patient": ConsultTypeName.NEW_PATIENT,
  "Report check": ConsultTypeName.REPORT_CHECK,
  "1st Follow Up": ConsultTypeName.THE_1_ST_FOLLOW_UP
});

enum DoctorImage { ZIA1_69_JPG, MI01_710_JPG, AALOKMAIN03_22_JPG }

final doctorImageValues = EnumValues({
  "AALOKMAIN03_2_2.jpg": DoctorImage.AALOKMAIN03_22_JPG,
  "MI01_7_10.jpg": DoctorImage.MI01_710_JPG,
  "ZIA1_6_9.jpg": DoctorImage.ZIA1_69_JPG
});

enum DoctorName { DR_ZIA_UDDIN_ARMAN, DR_MAHFUZUL_ISLAM, DR_SHEREEN_YOUSUF, ASSOC_PROF_DR_MAHMUD_RAHIM }

final doctorNameValues = EnumValues({
  "Assoc. Prof. Dr. Mahmud Rahim": DoctorName.ASSOC_PROF_DR_MAHMUD_RAHIM,
  "Dr. Mahfuzul Islam": DoctorName.DR_MAHFUZUL_ISLAM,
  "Dr. Shereen Yousuf": DoctorName.DR_SHEREEN_YOUSUF,
  "Dr. Zia Uddin Arman": DoctorName.DR_ZIA_UDDIN_ARMAN
});

enum DoctorSpecialtyName { DENTAL_SURGEON, GYNAECOLOGIST, MEDICINE }

final doctorSpecialtyNameValues = EnumValues({
  "Dental Surgeon": DoctorSpecialtyName.DENTAL_SURGEON,
  "Gynaecologist": DoctorSpecialtyName.GYNAECOLOGIST,
  "Medicine": DoctorSpecialtyName.MEDICINE
});

enum RegId { MH22012014368 }

final regIdValues = EnumValues({
  "MH22012014368": RegId.MH22012014368
});

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
  List<Item> data;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    draw: json["draw"],
    recordsFiltered: json["recordsFiltered"],
    recordsTotal: json["recordsTotal"]==null?0:int.parse(json["recordsTotal"]?.toString()??"0"),
    data: List<Item>.from(json["data"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "draw": draw,
    "recordsFiltered": recordsFiltered,
    "recordsTotal": recordsTotal,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
