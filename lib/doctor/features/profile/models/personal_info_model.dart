// To parse this JSON data, do
//
//     final personalInfoModel = personalInfoModelFromJson(jsonString);

import 'dart:convert';

PersonalInfoModel personalInfoModelFromJson(String str) => PersonalInfoModel.fromJson(json.decode(str));

String personalInfoModelToJson(PersonalInfoModel data) => json.encode(data.toJson());

class PersonalInfoModel {
  PersonalInfoModel({
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
  PersonalInfoData obj;

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) => PersonalInfoModel(
    success: json["success"],
    info: json["info"],
    warning: json["warning"],
    message: json["message"],
    valid: json["valid"],
    id: json["id"],
    model: json["model"],
    items: json["items"],
    obj: PersonalInfoData.fromJson(json["obj"]),
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

class PersonalInfoData {
  PersonalInfoData({
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
    this.salutation,
    this.firstName,
    this.doctorName,
    this.fatherName,
    this.motherName,
    this.spouseName,
    this.gender,
    this.maritalStatus,
    this.dob,
    this.buNo,
    this.joinDate,
    this.jobTitleNo,
    this.activeStatus,
    this.bloodGroup,
    this.religion,
    this.phoneHome,
    this.phoneMobile,
    this.altMobileNo,
    this.phoneOffice,
    this.nationalId,
    this.drivingLcNo,
    this.placeOfBirth,
    this.height,
    this.heightUnit,
    this.weight,
    this.weightUnit,
    this.blackListFlag,
    this.vipFlag,
    this.athleticFlag,
    this.concealFlag,
    this.bdmcRegNo,
    this.bdmcRegDate,
    this.description,
    this.nationality,
    this.emailPersonal,
    this.emailOfficial,
    this.ssNo,
    this.faxNo,
    this.cardNo,
    this.address,
    this.preAddress,
    this.preVillage,
    this.preUnion,
    this.prePoffice,
    this.preThana,
    this.preDistrict,
    this.preDivision,
    this.preProvince,
    this.preCountry,
    this.perAddress,
    this.perVillage,
    this.perUnion,
    this.perPoffice,
    this.perThana,
    this.perDistrict,
    this.perDivision,
    this.perProvince,
    this.perCountry,
    this.specialityNo,
    this.offDayRemarks,
    this.doctorSignature,
    this.chamberAddress1,
    this.chamberAddress2,
    this.chamberAddress3,
    this.qualification,
    this.docDegree,
    this.remarks,
    this.docDgtlSing,
    this.consultationFee,
    this.onlineDoctorFlag,
    this.photo,
    this.doctorNoList,
    this.buNoList,
    this.doctorsNo,
    this.allPresciptionDoctorFlag,
    this.likeDocName,
    this.specializationName,
    this.passportNo,
    this.lname,
    this.tinNo,
    this.mname,
  });

  int ssCreator;
  dynamic ssCreatedOn;
  dynamic ssCreateSession;
  int ssModifier;
  String ssModifiedOn;
  int ssModifiedSession;
  int companyNo;
  int organizationNo;
  int doctorNo;
  String doctorId;
  dynamic salutation;
  String firstName;
  String doctorName;
  dynamic fatherName;
  dynamic motherName;
  dynamic spouseName;
  String gender;
  String maritalStatus;
  String dob;
  int buNo;
  String joinDate;
  int jobTitleNo;
  int activeStatus;
  dynamic bloodGroup;
  dynamic religion;
  dynamic phoneHome;
  String phoneMobile;
  dynamic altMobileNo;
  dynamic phoneOffice;
  dynamic nationalId;
  dynamic drivingLcNo;
  dynamic placeOfBirth;
  dynamic height;
  dynamic heightUnit;
  dynamic weight;
  dynamic weightUnit;
  int blackListFlag;
  int vipFlag;
  int athleticFlag;
  int concealFlag;
  String bdmcRegNo;
  String bdmcRegDate;
  dynamic description;
  String nationality;
  dynamic emailPersonal;
  dynamic emailOfficial;
  dynamic ssNo;
  dynamic faxNo;
  dynamic cardNo;
  dynamic address;
  dynamic preAddress;
  dynamic preVillage;
  dynamic preUnion;
  dynamic prePoffice;
  dynamic preThana;
  dynamic preDistrict;
  dynamic preDivision;
  dynamic preProvince;
  dynamic preCountry;
  dynamic perAddress;
  dynamic perVillage;
  dynamic perUnion;
  dynamic perPoffice;
  dynamic perThana;
  dynamic perDistrict;
  dynamic perDivision;
  dynamic perProvince;
  dynamic perCountry;
  int specialityNo;
  dynamic offDayRemarks;
  String doctorSignature;
  dynamic chamberAddress1;
  dynamic chamberAddress2;
  dynamic chamberAddress3;
  dynamic qualification;
  String docDegree;
  dynamic remarks;
  String docDgtlSing;
  int consultationFee;
  int onlineDoctorFlag;
  dynamic photo;
  dynamic doctorNoList;
  dynamic buNoList;
  dynamic doctorsNo;
  int allPresciptionDoctorFlag;
  dynamic likeDocName;
  dynamic specializationName;
  dynamic passportNo;
  dynamic lname;
  dynamic tinNo;
  dynamic mname;

  factory PersonalInfoData.fromJson(Map<String, dynamic> json) => PersonalInfoData(
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
    salutation: json["salutation"],
    firstName: json["firstName"],
    doctorName: json["doctorName"],
    fatherName: json["fatherName"],
    motherName: json["motherName"],
    spouseName: json["spouseName"],
    gender: json["gender"],
    maritalStatus: json["maritalStatus"],
    dob: json["dob"],
    buNo: json["buNo"],
    joinDate: json["joinDate"],
    jobTitleNo: json["jobTitleNo"],
    activeStatus: json["activeStatus"],
    bloodGroup: json["bloodGroup"],
    religion: json["religion"],
    phoneHome: json["phoneHome"],
    phoneMobile: json["phoneMobile"],
    altMobileNo: json["altMobileNo"],
    phoneOffice: json["phoneOffice"],
    nationalId: json["nationalId"],
    drivingLcNo: json["drivingLcNo"],
    placeOfBirth: json["placeOfBirth"],
    height: json["height"],
    heightUnit: json["heightUnit"],
    weight: json["weight"],
    weightUnit: json["weightUnit"],
    blackListFlag: json["blackListFlag"],
    vipFlag: json["vipFlag"],
    athleticFlag: json["athleticFlag"],
    concealFlag: json["concealFlag"],
    bdmcRegNo: json["bdmcRegNo"],
    bdmcRegDate: json["bdmcRegDate"],
    description: json["description"],
    nationality: json["nationality"],
    emailPersonal: json["emailPersonal"],
    emailOfficial: json["emailOfficial"],
    ssNo: json["ssNo"],
    faxNo: json["faxNo"],
    cardNo: json["cardNo"],
    address: json["address"],
    preAddress: json["preAddress"],
    preVillage: json["preVillage"],
    preUnion: json["preUnion"],
    prePoffice: json["prePoffice"],
    preThana: json["preThana"],
    preDistrict: json["preDistrict"],
    preDivision: json["preDivision"],
    preProvince: json["preProvince"],
    preCountry: json["preCountry"],
    perAddress: json["perAddress"],
    perVillage: json["perVillage"],
    perUnion: json["perUnion"],
    perPoffice: json["perPoffice"],
    perThana: json["perThana"],
    perDistrict: json["perDistrict"],
    perDivision: json["perDivision"],
    perProvince: json["perProvince"],
    perCountry: json["perCountry"],
    specialityNo: json["specialityNo"],
    offDayRemarks: json["offDayRemarks"],
    doctorSignature: json["doctorSignature"],
    chamberAddress1: json["chamberAddress1"],
    chamberAddress2: json["chamberAddress2"],
    chamberAddress3: json["chamberAddress3"],
    qualification: json["qualification"],
    docDegree: json["docDegree"],
    remarks: json["remarks"],
    docDgtlSing: json["docDgtlSing"],
    consultationFee: json["consultationFee"],
    onlineDoctorFlag: json["onlineDoctorFlag"],
    photo: json["photo"],
    doctorNoList: json["doctorNoList"],
    buNoList: json["buNoList"],
    doctorsNo: json["doctorsNo"],
    allPresciptionDoctorFlag: json["allPresciptionDoctorFlag"],
    likeDocName: json["likeDocName"],
    specializationName: json["specializationName"],
    passportNo: json["passportNo"],
    lname: json["lname"],
    tinNo: json["tinNo"],
    mname: json["mname"],
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
    "salutation": salutation,
    "firstName": firstName,
    "doctorName": doctorName,
    "fatherName": fatherName,
    "motherName": motherName,
    "spouseName": spouseName,
    "gender": gender,
    "maritalStatus": maritalStatus,
    "dob": dob,
    "buNo": buNo,
    "joinDate": joinDate,
    "jobTitleNo": jobTitleNo,
    "activeStatus": activeStatus,
    "bloodGroup": bloodGroup,
    "religion": religion,
    "phoneHome": phoneHome,
    "phoneMobile": phoneMobile,
    "altMobileNo": altMobileNo,
    "phoneOffice": phoneOffice,
    "nationalId": nationalId,
    "drivingLcNo": drivingLcNo,
    "placeOfBirth": placeOfBirth,
    "height": height,
    "heightUnit": heightUnit,
    "weight": weight,
    "weightUnit": weightUnit,
    "blackListFlag": blackListFlag,
    "vipFlag": vipFlag,
    "athleticFlag": athleticFlag,
    "concealFlag": concealFlag,
    "bdmcRegNo": bdmcRegNo,
    "bdmcRegDate": bdmcRegDate,
    "description": description,
    "nationality": nationality,
    "emailPersonal": emailPersonal,
    "emailOfficial": emailOfficial,
    "ssNo": ssNo,
    "faxNo": faxNo,
    "cardNo": cardNo,
    "address": address,
    "preAddress": preAddress,
    "preVillage": preVillage,
    "preUnion": preUnion,
    "prePoffice": prePoffice,
    "preThana": preThana,
    "preDistrict": preDistrict,
    "preDivision": preDivision,
    "preProvince": preProvince,
    "preCountry": preCountry,
    "perAddress": perAddress,
    "perVillage": perVillage,
    "perUnion": perUnion,
    "perPoffice": perPoffice,
    "perThana": perThana,
    "perDistrict": perDistrict,
    "perDivision": perDivision,
    "perProvince": perProvince,
    "perCountry": perCountry,
    "specialityNo": specialityNo,
    "offDayRemarks": offDayRemarks,
    "doctorSignature": doctorSignature,
    "chamberAddress1": chamberAddress1,
    "chamberAddress2": chamberAddress2,
    "chamberAddress3": chamberAddress3,
    "qualification": qualification,
    "docDegree": docDegree,
    "remarks": remarks,
    "docDgtlSing": docDgtlSing,
    "consultationFee": consultationFee,
    "onlineDoctorFlag": onlineDoctorFlag,
    "photo": photo,
    "doctorNoList": doctorNoList,
    "buNoList": buNoList,
    "doctorsNo": doctorsNo,
    "allPresciptionDoctorFlag": allPresciptionDoctorFlag,
    "likeDocName": likeDocName,
    "specializationName": specializationName,
    "passportNo": passportNo,
    "lname": lname,
    "tinNo": tinNo,
    "mname": mname,
  };
}