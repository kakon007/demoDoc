import 'dart:convert';

ReferredDoctorModel referredDoctorModelFromJson(String str) =>
    ReferredDoctorModel.fromJson(json.decode(str));

String referredDoctorModelToJson(ReferredDoctorModel data) =>
    json.encode(data.toJson());

class ReferredDoctorModel {
  ReferredDoctorModel({
    this.items,
  });

  List<ReferredDoctorItem> items;

  factory ReferredDoctorModel.fromJson(Map<String, dynamic> json) =>
      ReferredDoctorModel(
        items: List<ReferredDoctorItem>.from(
            json["items"].map((x) => ReferredDoctorItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class ReferredDoctorItem {
  ReferredDoctorItem({
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.organizationNo,
    this.doctorNo,
    this.doctorId,
    this.firstName,
    this.doctorName,
    this.buNo,
    this.joinDate,
    this.jobTitleNo,
    this.activeStatus,
    this.bdmcRegNo,
    this.bdmcRegDate,
    this.onlineDoctorFlag,
    this.allPresciptionDoctorFlag,
  });

  int ssCreator;
  String ssCreatedOn;
  int ssCreateSession;
  int ssModifier;
  String ssModifiedOn;
  int ssModifiedSession;
  int companyNo;
  int organizationNo;
  int doctorNo;
  String doctorId;
  String firstName;
  String doctorName;
  int buNo;
  String joinDate;
  int jobTitleNo;
  int activeStatus;
  String bdmcRegNo;
  String bdmcRegDate;
  int onlineDoctorFlag;
  int allPresciptionDoctorFlag;

  factory ReferredDoctorItem.fromJson(Map<String, dynamic> json) =>
      ReferredDoctorItem(
        ssCreator: json["ssCreator"],
        ssCreatedOn: json["ssCreatedOn"],
        ssCreateSession: json["ssCreateSession"],
        ssModifier: json["ssModifier"],
        ssModifiedOn: json["ssModifiedOn"],
        ssModifiedSession: json["ssModifiedSession"],
        companyNo: json["companyNo"],
        organizationNo: json["organizationNo"],
        doctorNo: json["doctorNo"],
        doctorId: json["doctorId"],
        firstName: json["firstName"],
        doctorName: json["doctorName"],
        buNo: json["buNo"],
        joinDate: json["joinDate"],
        jobTitleNo: json["jobTitleNo"],
        activeStatus: json["activeStatus"],
        bdmcRegNo: json["bdmcRegNo"],
        bdmcRegDate: json["bdmcRegDate"],
        onlineDoctorFlag: json["onlineDoctorFlag"],
        allPresciptionDoctorFlag: json["allPresciptionDoctorFlag"],
      );

  Map<String, dynamic> toJson() => {
        "ssCreator": ssCreator,
        "ssCreatedOn": ssCreatedOn,
        "ssCreateSession": ssCreateSession,
        "ssModifier": ssModifier,
        "ssModifiedOn": ssModifiedOn,
        "ssModifiedSession": ssModifiedSession,
        "companyNo": companyNo,
        "organizationNo": organizationNo,
        "doctorNo": doctorNo,
        "doctorId": doctorId,
        "firstName": firstName,
        "doctorName": doctorName,
        "buNo": buNo,
        "joinDate": joinDate,
        "jobTitleNo": jobTitleNo,
        "activeStatus": activeStatus,
        "bdmcRegNo": bdmcRegNo,
        "bdmcRegDate": bdmcRegDate,
        "onlineDoctorFlag": onlineDoctorFlag,
        "allPresciptionDoctorFlag": allPresciptionDoctorFlag,
      };
}
