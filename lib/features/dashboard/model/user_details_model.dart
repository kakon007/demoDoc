// To parse this JSON data, do
//
//     final findHospitalNumberModel = findHospitalNumberModelFromJson(jsonString);

import 'dart:convert';

FindHospitalNumberModel findHospitalNumberModelFromJson(String str) => FindHospitalNumberModel.fromJson(json.decode(str));

String findHospitalNumberModelToJson(FindHospitalNumberModel data) => json.encode(data.toJson());

class FindHospitalNumberModel {
  FindHospitalNumberModel({
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

  factory FindHospitalNumberModel.fromJson(Map<String, dynamic> json) => FindHospitalNumberModel(
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
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.organizationNo,
    this.id,
    this.hospitalNumber,
    this.regDate,
    this.salutation,
    this.fname,
    this.mname,
    this.lname,
    this.patientName,
    this.gender,
    this.genderData,
    this.maritalStatus,
    this.ageDd,
    this.ageMm,
    this.ageYy,
    this.age,
    this.dob,
    this.bloodGroup,
    this.religion,
    this.phoneMobile,
    this.altMobile,
    this.phoneTnt,
    this.email,
    this.address,
    this.presentAddress,
    this.preVillage,
    this.preUnion,
    this.prePoffice,
    this.preThana,
    this.preDistrict,
    this.preDivision,
    this.preProvince,
    this.preCountry,
    this.permanertAddress,
    this.perVillage,
    this.perUnion,
    this.perPoffice,
    this.perThana,
    this.perDistrict,
    this.perDivision,
    this.perProvince,
    this.perCountry,
    this.fatherName,
    this.motherName,
    this.spouseName,
    this.passportNo,
    this.nationality,
    this.nationalId,
    this.drivinglcNo,
    this.tinNo,
    this.ssNo,
    this.faxNo,
    this.interest,
    this.placeOfBirth,
    this.contactPersonName,
    this.contactAddress,
    this.contactRelation,
    this.contactPhone,
    this.contactMobile,
    this.contactEmail,
    this.foreignResidentFlag,
    this.vissaDetails,
    this.nativeHospital,
    this.nativeHn,
    this.nativeDoctor,
    this.nativeDocemail,
    this.patientStatus,
    this.heightCm,
    this.weightKg,
    this.occupationName,
    this.registrationPoint,
    this.ivfFlag,
    this.ivfPartner,
    this.ivfExpireDate,
    this.blackListPatient,
    this.insuranceFlag,
    this.athleticFlag,
    this.johndoeFlag,
    this.vipPatient,
    this.concealDemographyFlag,
    this.marriageDate,
    this.deathFlag,
    this.deathDeclareBy,
    this.deathDeclareTime,
    this.causeOfDeath,
    this.causeDisability,
    this.patientPhoto,
    this.photo,
    this.likeHospitalNumber,
    this.notEqualId,
    this.userNo,
    this.fromDate,
    this.toDate,
    this.mstatusData,
    this.deathTime,
  });

  int ssCreator;
  String ssCreatedOn;
  int ssCreateSession;
  int ssModifier;
  String ssModifiedOn;
  int ssModifiedSession;
  int companyNo;
  int organizationNo;
  int id;
  String hospitalNumber;
  String regDate;
  String salutation;
  String fname;
  dynamic mname;
  dynamic lname;
  String patientName;
  String gender;
  dynamic genderData;
  dynamic maritalStatus;
  int ageDd;
  int ageMm;
  int ageYy;
  String age;
  String dob;
  dynamic bloodGroup;
  dynamic religion;
  String phoneMobile;
  dynamic altMobile;
  dynamic phoneTnt;
  dynamic email;
  String address;
  dynamic presentAddress;
  dynamic preVillage;
  dynamic preUnion;
  dynamic prePoffice;
  dynamic preThana;
  dynamic preDistrict;
  dynamic preDivision;
  dynamic preProvince;
  dynamic preCountry;
  dynamic permanertAddress;
  dynamic perVillage;
  dynamic perUnion;
  dynamic perPoffice;
  dynamic perThana;
  dynamic perDistrict;
  dynamic perDivision;
  dynamic perProvince;
  dynamic perCountry;
  dynamic fatherName;
  dynamic motherName;
  dynamic spouseName;
  dynamic passportNo;
  dynamic nationality;
  dynamic nationalId;
  dynamic drivinglcNo;
  dynamic tinNo;
  dynamic ssNo;
  dynamic faxNo;
  dynamic interest;
  dynamic placeOfBirth;
  dynamic contactPersonName;
  dynamic contactAddress;
  dynamic contactRelation;
  dynamic contactPhone;
  dynamic contactMobile;
  dynamic contactEmail;
  dynamic foreignResidentFlag;
  dynamic vissaDetails;
  dynamic nativeHospital;
  dynamic nativeHn;
  dynamic nativeDoctor;
  dynamic nativeDocemail;
  dynamic patientStatus;
  dynamic heightCm;
  dynamic weightKg;
  dynamic occupationName;
  dynamic registrationPoint;
  dynamic ivfFlag;
  dynamic ivfPartner;
  dynamic ivfExpireDate;
  dynamic blackListPatient;
  dynamic insuranceFlag;
  dynamic athleticFlag;
  dynamic johndoeFlag;
  dynamic vipPatient;
  dynamic concealDemographyFlag;
  dynamic marriageDate;
  dynamic deathFlag;
  dynamic deathDeclareBy;
  dynamic deathDeclareTime;
  dynamic causeOfDeath;
  dynamic causeDisability;
  dynamic patientPhoto;
  dynamic photo;
  dynamic likeHospitalNumber;
  dynamic notEqualId;
  dynamic userNo;
  dynamic fromDate;
  dynamic toDate;
  dynamic mstatusData;
  dynamic deathTime;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    ssCreator: json["ssCreator"],
    ssCreatedOn: json["ssCreatedOn"],
    ssCreateSession: json["ssCreateSession"],
    ssModifier: json["ssModifier"],
    ssModifiedOn: json["ssModifiedOn"],
    ssModifiedSession: json["ssModifiedSession"],
    companyNo: json["companyNo"],
    organizationNo: json["organizationNo"],
    id: json["id"],
    hospitalNumber: json["hospitalNumber"],
    regDate: json["regDate"],
    salutation: json["salutation"],
    fname: json["fname"],
    mname: json["mname"],
    lname: json["lname"],
    patientName: json["patientName"],
    gender: json["gender"],
    genderData: json["genderData"],
    maritalStatus: json["maritalStatus"],
    ageDd: json["ageDd"],
    ageMm: json["ageMm"],
    ageYy: json["ageYy"],
    age: json["age"],
    dob: json["dob"],
    bloodGroup: json["bloodGroup"],
    religion: json["religion"],
    phoneMobile: json["phoneMobile"],
    altMobile: json["altMobile"],
    phoneTnt: json["phoneTnt"],
    email: json["email"],
    address: json["address"],
    presentAddress: json["presentAddress"],
    preVillage: json["preVillage"],
    preUnion: json["preUnion"],
    prePoffice: json["prePoffice"],
    preThana: json["preThana"],
    preDistrict: json["preDistrict"],
    preDivision: json["preDivision"],
    preProvince: json["preProvince"],
    preCountry: json["preCountry"],
    permanertAddress: json["permanertAddress"],
    perVillage: json["perVillage"],
    perUnion: json["perUnion"],
    perPoffice: json["perPoffice"],
    perThana: json["perThana"],
    perDistrict: json["perDistrict"],
    perDivision: json["perDivision"],
    perProvince: json["perProvince"],
    perCountry: json["perCountry"],
    fatherName: json["fatherName"],
    motherName: json["motherName"],
    spouseName: json["spouseName"],
    passportNo: json["passportNo"],
    nationality: json["nationality"],
    nationalId: json["nationalId"],
    drivinglcNo: json["drivinglcNo"],
    tinNo: json["tinNo"],
    ssNo: json["ssNo"],
    faxNo: json["faxNo"],
    interest: json["interest"],
    placeOfBirth: json["placeOfBirth"],
    contactPersonName: json["contactPersonName"],
    contactAddress: json["contactAddress"],
    contactRelation: json["contactRelation"],
    contactPhone: json["contactPhone"],
    contactMobile: json["contactMobile"],
    contactEmail: json["contactEmail"],
    foreignResidentFlag: json["foreignResidentFlag"],
    vissaDetails: json["vissaDetails"],
    nativeHospital: json["nativeHospital"],
    nativeHn: json["nativeHn"],
    nativeDoctor: json["nativeDoctor"],
    nativeDocemail: json["nativeDocemail"],
    patientStatus: json["patientStatus"],
    heightCm: json["heightCm"],
    weightKg: json["weightKg"],
    occupationName: json["occupationName"],
    registrationPoint: json["registrationPoint"],
    ivfFlag: json["ivfFlag"],
    ivfPartner: json["ivfPartner"],
    ivfExpireDate: json["ivfExpireDate"],
    blackListPatient: json["blackListPatient"],
    insuranceFlag: json["insuranceFlag"],
    athleticFlag: json["athleticFlag"],
    johndoeFlag: json["johndoeFlag"],
    vipPatient: json["vipPatient"],
    concealDemographyFlag: json["concealDemographyFlag"],
    marriageDate: json["marriageDate"],
    deathFlag: json["deathFlag"],
    deathDeclareBy: json["deathDeclareBy"],
    deathDeclareTime: json["deathDeclareTime"],
    causeOfDeath: json["causeOfDeath"],
    causeDisability: json["causeDisability"],
    patientPhoto: json["patientPhoto"],
    photo: json["photo"],
    likeHospitalNumber: json["likeHospitalNumber"],
    notEqualId: json["notEqualId"],
    userNo: json["userNo"],
    fromDate: json["fromDate"],
    toDate: json["toDate"],
    mstatusData: json["mstatusData"],
    deathTime: json["deathTime"],
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
    "id": id,
    "hospitalNumber": hospitalNumber,
    "regDate": regDate,
    "salutation": salutation,
    "fname": fname,
    "mname": mname,
    "lname": lname,
    "patientName": patientName,
    "gender": gender,
    "genderData": genderData,
    "maritalStatus": maritalStatus,
    "ageDd": ageDd,
    "ageMm": ageMm,
    "ageYy": ageYy,
    "age": age,
    "dob": dob,
    "bloodGroup": bloodGroup,
    "religion": religion,
    "phoneMobile": phoneMobile,
    "altMobile": altMobile,
    "phoneTnt": phoneTnt,
    "email": email,
    "address": address,
    "presentAddress": presentAddress,
    "preVillage": preVillage,
    "preUnion": preUnion,
    "prePoffice": prePoffice,
    "preThana": preThana,
    "preDistrict": preDistrict,
    "preDivision": preDivision,
    "preProvince": preProvince,
    "preCountry": preCountry,
    "permanertAddress": permanertAddress,
    "perVillage": perVillage,
    "perUnion": perUnion,
    "perPoffice": perPoffice,
    "perThana": perThana,
    "perDistrict": perDistrict,
    "perDivision": perDivision,
    "perProvince": perProvince,
    "perCountry": perCountry,
    "fatherName": fatherName,
    "motherName": motherName,
    "spouseName": spouseName,
    "passportNo": passportNo,
    "nationality": nationality,
    "nationalId": nationalId,
    "drivinglcNo": drivinglcNo,
    "tinNo": tinNo,
    "ssNo": ssNo,
    "faxNo": faxNo,
    "interest": interest,
    "placeOfBirth": placeOfBirth,
    "contactPersonName": contactPersonName,
    "contactAddress": contactAddress,
    "contactRelation": contactRelation,
    "contactPhone": contactPhone,
    "contactMobile": contactMobile,
    "contactEmail": contactEmail,
    "foreignResidentFlag": foreignResidentFlag,
    "vissaDetails": vissaDetails,
    "nativeHospital": nativeHospital,
    "nativeHn": nativeHn,
    "nativeDoctor": nativeDoctor,
    "nativeDocemail": nativeDocemail,
    "patientStatus": patientStatus,
    "heightCm": heightCm,
    "weightKg": weightKg,
    "occupationName": occupationName,
    "registrationPoint": registrationPoint,
    "ivfFlag": ivfFlag,
    "ivfPartner": ivfPartner,
    "ivfExpireDate": ivfExpireDate,
    "blackListPatient": blackListPatient,
    "insuranceFlag": insuranceFlag,
    "athleticFlag": athleticFlag,
    "johndoeFlag": johndoeFlag,
    "vipPatient": vipPatient,
    "concealDemographyFlag": concealDemographyFlag,
    "marriageDate": marriageDate,
    "deathFlag": deathFlag,
    "deathDeclareBy": deathDeclareBy,
    "deathDeclareTime": deathDeclareTime,
    "causeOfDeath": causeOfDeath,
    "causeDisability": causeDisability,
    "patientPhoto": patientPhoto,
    "photo": photo,
    "likeHospitalNumber": likeHospitalNumber,
    "notEqualId": notEqualId,
    "userNo": userNo,
    "fromDate": fromDate,
    "toDate": toDate,
    "mstatusData": mstatusData,
    "deathTime": deathTime,
  };
}
