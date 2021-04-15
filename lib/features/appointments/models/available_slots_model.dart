// To parse this JSON data, do
//
//     final availableSlotModel = availableSlotModelFromJson(jsonString);

import 'dart:convert';

AvailableSlotModel availableSlotModelFromJson(String str) => AvailableSlotModel.fromJson(json.decode(str));

String availableSlotModelToJson(AvailableSlotModel data) => json.encode(data.toJson());

class AvailableSlotModel {
  AvailableSlotModel({
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
  dynamic model;
  List<Items> items;
  dynamic obj;

  factory AvailableSlotModel.fromJson(Map<String, dynamic> json) => AvailableSlotModel(
    success: json["success"],
    info: json["info"],
    warning: json["warning"],
    message: json["message"],
    valid: json["valid"],
    id: json["id"],
    model: json["model"],
    items: List<Items>.from(json["items"].map((x) => Items.fromJson(x))),
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

class Items {
  Items({
    this.slotNo,
    this.doctorNo,
    this.doctorName,
    this.appointDate,
    this.shiftdtlNo,
    this.shift,
    this.slotSl,
    this.startTime,
    this.endTime,
    this.durationMin,
    this.extraSlot,
    this.slotSplited,
    this.ssCreator,
    this.ssCreatedOn,
    this.remarks,
    this.appointStatus,
    this.companyNo,
    this.ogNo,
  });

  int slotNo;
  int doctorNo;
  DoctorName doctorName;
  DateTime appointDate;
  int shiftdtlNo;
  Shift shift;
  int slotSl;
  String startTime;
  String endTime;
  int durationMin;
  int extraSlot;
  int slotSplited;
  int ssCreator;
  DateTime ssCreatedOn;
  dynamic remarks;
  int appointStatus;
  int companyNo;
  int ogNo;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    slotNo: json["slotNo"],
    doctorNo: json["doctorNo"],
    doctorName: doctorNameValues.map[json["doctorName"]],
    appointDate: DateTime.parse(json["appointDate"]),
    shiftdtlNo: json["shiftdtlNo"],
    shift: shiftValues.map[json["shift"]],
    slotSl: json["slotSl"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    durationMin: json["durationMin"],
    extraSlot: json["extraSlot"],
    slotSplited: json["slotSplited"],
    ssCreator: json["ssCreator"],
    ssCreatedOn: DateTime.parse(json["ssCreatedOn"]),
    remarks: json["remarks"],
    appointStatus: json["appointStatus"],
    companyNo: json["companyNo"],
    ogNo: json["ogNo"],
  );

  Map<String, dynamic> toJson() => {
    "slotNo": slotNo,
    "doctorNo": doctorNo,
    "doctorName": doctorNameValues.reverse[doctorName],
    "appointDate": "${appointDate.year.toString().padLeft(4, '0')}-${appointDate.month.toString().padLeft(2, '0')}-${appointDate.day.toString().padLeft(2, '0')}",
    "shiftdtlNo": shiftdtlNo,
    "shift": shiftValues.reverse[shift],
    "slotSl": slotSl,
    "startTime": startTime,
    "endTime": endTime,
    "durationMin": durationMin,
    "extraSlot": extraSlot,
    "slotSplited": slotSplited,
    "ssCreator": ssCreator,
    "ssCreatedOn": "${ssCreatedOn.year.toString().padLeft(4, '0')}-${ssCreatedOn.month.toString().padLeft(2, '0')}-${ssCreatedOn.day.toString().padLeft(2, '0')}",
    "remarks": remarks,
    "appointStatus": appointStatus,
    "companyNo": companyNo,
    "ogNo": ogNo,
  };
}

enum DoctorName { ASSOC_PROF_DR_MAHMUD_RAHIM }

final doctorNameValues = EnumValues({
  "Assoc. Prof. Dr. Mahmud Rahim": DoctorName.ASSOC_PROF_DR_MAHMUD_RAHIM
});

enum Shift { MORNING, EVENING }

final shiftValues = EnumValues({
  "Evening": Shift.EVENING,
  "Morning": Shift.MORNING
});

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
