// To parse this JSON data, do
//
//     final zoomApiModel = zoomApiModelFromJson(jsonString);

import 'dart:convert';

ZoomApiModel zoomApiModelFromJson(String str) => ZoomApiModel.fromJson(json.decode(str));

String zoomApiModelToJson(ZoomApiModel data) => json.encode(data.toJson());

class ZoomApiModel {
  ZoomApiModel({
    this.items,
    this.obj,
  });

  List<ZoomAPI> items;
  dynamic obj;

  factory ZoomApiModel.fromJson(Map<String, dynamic> json) => ZoomApiModel(
    items: json["items"] == null ? null : List<ZoomAPI>.from(json["items"].map((x) => ZoomAPI.fromJson(x))),
    obj: json["obj"],
  );

  Map<String, dynamic> toJson() => {
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
    "obj": obj,
  };
}

class ZoomAPI {
  ZoomAPI({
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.organizationNo,
    this.id,
    this.doctorNo,
    this.consultationNo,
    this.consultationId,
    this.meetingNumber,
    this.meetingPassword,
    this.meetingCreatedAt,
    this.joinUrl,
    this.hostId,
    this.duration,
    this.startTime,
    this.startUrl,
    this.timezone,
    this.uuid,
  });

  int ssCreator;
  SsEdOn ssCreatedOn;
  int ssCreateSession;
  int ssModifier;
  SsEdOn ssModifiedOn;
  int ssModifiedSession;
  int companyNo;
  int organizationNo;
  int id;
  int doctorNo;
  int consultationNo;
  ConsultationId consultationId;
  int meetingNumber;
  MeetingPassword meetingPassword;
  DateTime meetingCreatedAt;
  String joinUrl;
  HostId hostId;
  dynamic duration;
  DateTime startTime;
  String startUrl;
  dynamic timezone;
  Uuid uuid;

  factory ZoomAPI.fromJson(Map<String, dynamic> json) => ZoomAPI(
    ssCreator: json["ssCreator"] == null ? null : json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"] == null ? null : ssEdOnValues.map[json["ssCreatedOn"]],
    ssCreateSession: json["ssCreateSession"] == null ? null : json["ssCreateSession"],
    ssModifier: json["ssModifier"] == null ? null : json["ssModifier"],
    ssModifiedOn: json["ssModifiedOn"] == null ? null : ssEdOnValues.map[json["ssModifiedOn"]],
    ssModifiedSession: json["ssModifiedSession"] == null ? null : json["ssModifiedSession"],
    companyNo: json["companyNo"] == null ? null : json["companyNo"],
    organizationNo: json["organizationNo"] == null ? null : json["organizationNo"],
    id: json["id"] == null ? null : json["id"],
    doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
    consultationNo: json["consultationNo"] == null ? null : json["consultationNo"],
    consultationId: json["consultationId"] == null ? null : consultationIdValues.map[json["consultationId"]],
    meetingNumber: json["meetingNumber"] == null ? null : json["meetingNumber"],
    meetingPassword: json["meetingPassword"] == null ? null : meetingPasswordValues.map[json["meetingPassword"]],
    meetingCreatedAt: json["meetingCreatedAt"] == null ? null : DateTime.parse(json["meetingCreatedAt"]),
    joinUrl: json["joinUrl"] == null ? null : json["joinUrl"],
    hostId: json["hostId"] == null ? null : hostIdValues.map[json["hostId"]],
    duration: json["duration"],
    startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
    startUrl: json["startUrl"] == null ? null : json["startUrl"],
    timezone: json["timezone"],
    uuid: json["uuid"] == null ? null : uuidValues.map[json["uuid"]],
  );

  Map<String, dynamic> toJson() => {
    "ssCreator": ssCreator == null ? null : ssCreator,
    "ssCreatedOn": ssCreatedOn == null ? null : ssEdOnValues.reverse[ssCreatedOn],
    "ssCreateSession": ssCreateSession == null ? null : ssCreateSession,
    "ssModifier": ssModifier == null ? null : ssModifier,
    "ssModifiedOn": ssModifiedOn == null ? null : ssEdOnValues.reverse[ssModifiedOn],
    "ssModifiedSession": ssModifiedSession == null ? null : ssModifiedSession,
    "companyNo": companyNo == null ? null : companyNo,
    "organizationNo": organizationNo == null ? null : organizationNo,
    "id": id == null ? null : id,
    "doctorNo": doctorNo == null ? null : doctorNo,
    "consultationNo": consultationNo == null ? null : consultationNo,
    "consultationId": consultationId == null ? null : consultationIdValues.reverse[consultationId],
    "meetingNumber": meetingNumber == null ? null : meetingNumber,
    "meetingPassword": meetingPassword == null ? null : meetingPasswordValues.reverse[meetingPassword],
    "meetingCreatedAt": meetingCreatedAt == null ? null : meetingCreatedAt.toIso8601String(),
    "joinUrl": joinUrl == null ? null : joinUrl,
    "hostId": hostId == null ? null : hostIdValues.reverse[hostId],
    "duration": duration,
    "startTime": startTime == null ? null : startTime.toIso8601String(),
    "startUrl": startUrl == null ? null : startUrl,
    "timezone": timezone,
    "uuid": uuid == null ? null : uuidValues.reverse[uuid],
  };
}

enum ConsultationId { C22105012749 }

final consultationIdValues = EnumValues({
  "C22105012749": ConsultationId.C22105012749
});

enum HostId { THE_089_BL_OQK_SU_SZ_F_ZQ_G_YI_ZE_A }

final hostIdValues = EnumValues({
  "089BlOQKSuSzFZq_gYiZeA": HostId.THE_089_BL_OQK_SU_SZ_F_ZQ_G_YI_ZE_A
});

enum MeetingPassword { MASUD_123 }

final meetingPasswordValues = EnumValues({
  "masud@123": MeetingPassword.MASUD_123
});

enum SsEdOn { THE_20210510_T03_34030000000 }

final ssEdOnValues = EnumValues({
  "2021-05-10T03:34:03.000+0000": SsEdOn.THE_20210510_T03_34030000000
});

enum Uuid { THE_33_X_W_ZER_SQYR_WW_WGGD1_DPG }

final uuidValues = EnumValues({
  "33xW+zerSqyrWwWGGD1Dpg==": Uuid.THE_33_X_W_ZER_SQYR_WW_WGGD1_DPG
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
