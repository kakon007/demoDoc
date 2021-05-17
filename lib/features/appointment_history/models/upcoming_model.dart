// To parse this JSON data, do
//
//     final appointmentUpcomingModel = appointmentUpcomingModelFromJson(jsonString);

import 'dart:convert';

AppointmentUpcomingModel appointmentUpcomingModelFromJson(String str) => AppointmentUpcomingModel.fromJson(json.decode(str));

String appointmentUpcomingModelToJson(AppointmentUpcomingModel data) => json.encode(data.toJson());

class AppointmentUpcomingModel {
  AppointmentUpcomingModel({
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

  factory AppointmentUpcomingModel.fromJson(Map<String, dynamic> json) => AppointmentUpcomingModel(
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
    this.statusArr,
    this.photo,
  });

  int appointNo;
  String appointId;
  String appointDate;
  int doctorNo;
  String doctorName;
  String doctorImage;
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
  PatientName patientName;
  String companyName;
  CompanyAlias companyAlias;
  dynamic prescriptionNo;
  int consultationNo;
  String consultationId;
  int status;
  dynamic statusArr;
  String photo;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    appointNo: json["appointNo"],
    appointId: json["appointId"],
    appointDate: json["appointDate"],
    doctorNo: json["doctorNo"],
    doctorName:json["doctorName"],
    doctorImage: json["doctorImage"] == null ? null : json["doctorImage"],
    specialtyNo: json["specialtyNo"],
    doctorSpecialtyName: json["doctorSpecialtyName"],
    shiftNo: json["shiftNo"],
    consultTypeNo: json["consultTypeNo"],
    consultTypeName: json["consultTypeName"],
    slotSl: json["slotSl"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    regNo: json["regNo"],
    regId: regIdValues.map[json["regId"]],
    patientName: patientNameValues.map[json["patientName"]],
    companyName: json["companyName"],
    companyAlias: companyAliasValues.map[json["companyAlias"]],
    prescriptionNo: json["prescriptionNo"],
    consultationNo: json["consultationNo"] == null ? null : json["consultationNo"],
    consultationId: json["consultationId"] == null ? null : json["consultationId"],
    status: json["status"],
    statusArr: json["statusArr"],
    photo: json["photo"] == null ? null : json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "appointNo": appointNo,
    "appointId": appointId,
    "appointDate": appointDate,
    "doctorNo": doctorNo,
    "doctorName": doctorNameValues.reverse[doctorName],
    "doctorImage": doctorImage == null ? null : doctorImage,
    "specialtyNo": specialtyNo,
    "doctorSpecialtyName": doctorSpecialtyNameValues.reverse[doctorSpecialtyName],
    "shiftNo": shiftNo,
    "consultTypeNo": consultTypeNo,
    "consultTypeName": consultTypeNameValues.reverse[consultTypeName],
    "slotSl": slotSl,
    "startTime": startTime,
    "endTime": endTime,
    "regNo": regNo,
    "regId": regIdValues.reverse[regId],
    "patientName": patientNameValues.reverse[patientName],
    "companyName": companyNameValues.reverse[companyName],
    "companyAlias": companyAliasValues.reverse[companyAlias],
    "prescriptionNo": prescriptionNo,
    "consultationNo": consultationNo == null ? null : consultationNo,
    "consultationId": consultationId == null ? null : consultationId,
    "status": status,
    "statusArr": statusArr,
    "photo": photo == null ? null : photo,
  };
}

enum CompanyAlias { DDC, RSH, NSS }

final companyAliasValues = EnumValues({
  "DDC": CompanyAlias.DDC,
  "NSS": CompanyAlias.NSS,
  "RSH": CompanyAlias.RSH
});

enum CompanyName { DHANMONDI_DENTAL_CENTER, RUSHMONO_SPECIALIZED_HOSPITAL, NIRAPAD_SHASTHO_SHEBA }

final companyNameValues = EnumValues({
  "Dhanmondi Dental Center": CompanyName.DHANMONDI_DENTAL_CENTER,
  "Nirapad Shastho Sheba": CompanyName.NIRAPAD_SHASTHO_SHEBA,
  "Rushmono Specialized Hospital": CompanyName.RUSHMONO_SPECIALIZED_HOSPITAL
});

enum ConsultTypeName { NEW_PATIENT, REPORT_CHECK }

final consultTypeNameValues = EnumValues({
  "New Patient": ConsultTypeName.NEW_PATIENT,
  "Report Check": ConsultTypeName.REPORT_CHECK
});

enum DoctorName { DR_MAHFUZUL_ISLAM, DR_SHEREEN_YOUSUF, DR_S_M_ABUL_FAYEZ }

final doctorNameValues = EnumValues({
  "Dr. Mahfuzul Islam": DoctorName.DR_MAHFUZUL_ISLAM,
  "Dr. Shereen Yousuf": DoctorName.DR_SHEREEN_YOUSUF,
  "Dr. S. M Abul Fayez": DoctorName.DR_S_M_ABUL_FAYEZ
});

enum DoctorSpecialtyName { DENTAL_SURGEON, GYNAECOLOGIST, CARDIOLOGIST }

final doctorSpecialtyNameValues = EnumValues({
  "Cardiologist": DoctorSpecialtyName.CARDIOLOGIST,
  "Dental Surgeon": DoctorSpecialtyName.DENTAL_SURGEON,
  "Gynaecologist": DoctorSpecialtyName.GYNAECOLOGIST
});

enum PatientName { MD_ZIA_UDDIN_ARMAN, ZIA_UDDIN_ARMAN, PATIENT_NAME_MD_ZIA_UDDIN_ARMAN, PATIENT_NAME_ZIA_UDDIN_ARMAN }

final patientNameValues = EnumValues({
  "MD. ZIA  UDDIN ARMAN ": PatientName.MD_ZIA_UDDIN_ARMAN,
  "MD. Zia  Uddin Arman ": PatientName.PATIENT_NAME_MD_ZIA_UDDIN_ARMAN,
  "Zia  Uddin Arman ": PatientName.PATIENT_NAME_ZIA_UDDIN_ARMAN,
  "ZIA  UDDIN ARMAN": PatientName.ZIA_UDDIN_ARMAN
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
