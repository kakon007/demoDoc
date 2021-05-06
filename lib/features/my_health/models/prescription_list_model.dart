// // To parse this JSON data, do
// //
// //     final prescriptionListModel = prescriptionListModelFromJson(jsonString);
//
// import 'dart:convert';
//
// PrescriptionListModel prescriptionListModelFromJson(String str) => PrescriptionListModel.fromJson(json.decode(str));
//
// String prescriptionListModelToJson(PrescriptionListModel data) => json.encode(data.toJson());
//
// class PrescriptionListModel {
//   PrescriptionListModel({
//     this.success,
//     this.info,
//     this.warning,
//     this.message,
//     this.valid,
//     this.id,
//     this.model,
//     this.items,
//     this.obj,
//   });
//
//   bool success;
//   bool info;
//   bool warning;
//   String message;
//   bool valid;
//   dynamic id;
//   dynamic model;
//   dynamic items;
//   Obj obj;
//
//   factory PrescriptionListModel.fromJson(Map<String, dynamic> json) => PrescriptionListModel(
//     success: json["success"] == null ? null : json["success"],
//     info: json["info"] == null ? null : json["info"],
//     warning: json["warning"] == null ? null : json["warning"],
//     message: json["message"] == null ? null : json["message"],
//     valid: json["valid"] == null ? null : json["valid"],
//     id: json["id"],
//     model: json["model"],
//     items: json["items"],
//     obj: json["obj"] == null ? null : Obj.fromJson(json["obj"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success == null ? null : success,
//     "info": info == null ? null : info,
//     "warning": warning == null ? null : warning,
//     "message": message == null ? null : message,
//     "valid": valid == null ? null : valid,
//     "id": id,
//     "model": model,
//     "items": items,
//     "obj": obj == null ? null : obj.toJson(),
//   };
// }
//
// class Obj {
//   Obj({
//     this.draw,
//     this.recordsFiltered,
//     this.recordsTotal,
//     this.data,
//   });
//
//   String draw;
//   String recordsFiltered;
//   String recordsTotal;
//   List<Datum> data;
//
//   factory Obj.fromJson(Map<String, dynamic> json) => Obj(
//     draw: json["draw"] == null ? null : json["draw"],
//     recordsFiltered: json["recordsFiltered"] == null ? null : json["recordsFiltered"],
//     recordsTotal: json["recordsTotal"] == null ? null : json["recordsTotal"],
//     data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "draw": draw == null ? null : draw,
//     "recordsFiltered": recordsFiltered == null ? null : recordsFiltered,
//     "recordsTotal": recordsTotal == null ? null : recordsTotal,
//     "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
//   };
// }
//
// class Datum {
//   Datum({
//     this.id,
//     this.appointId,
//     this.registrationNo,
//     this.hospitalId,
//     this.patientName,
//     this.phoneMobile,
//     this.dateOfBirth,
//     this.age,
//     this.ageYy,
//     this.ageMm,
//     this.ageDd,
//     this.gender,
//     this.consultTypeNo,
//     this.consultTypeDesc,
//     this.bloodGroup,
//     this.peAddr1,
//     this.doctorNo,
//     this.doctorId,
//     this.doctorName,
//     this.docDegree,
//     this.appointDate,
//     this.shiftdtlNo,
//     this.startTime,
//     this.endTime,
//     this.slotSl,
//     this.consultationNo,
//     this.consultationId,
//     this.consDate,
//     this.consultationFee,
//     this.consultationIn,
//     this.consultationOut,
//     this.consTime,
//     this.departmentNo,
//     this.departmentName,
//     this.consultationConfirmBy,
//     this.consultationConfirmTime,
//     this.prescriptionNo,
//     this.prescriptionDateTime,
//     this.isPatientIn,
//     this.isPatientOut,
//     this.isFeesPaid,
//     this.ogNo,
//     this.ogName,
//     this.companyNo,
//     this.companyName,
//     this.consultationNoNotNull,
//     this.fromDate,
//     this.toDate,
//     this.appointFilter,
//     this.waitingFilter,
//     this.doneFilter,
//     this.consultTypeNoList,
//     this.mstatus,
//   });
//
//   int id;
//   String appointId;
//   int registrationNo;
//   String hospitalId;
//   String patientName;
//   String phoneMobile;
//   String dateOfBirth;
//   String age;
//   int ageYy;
//   int ageMm;
//   int ageDd;
//   dynamic gender;
//   int consultTypeNo;
//   String consultTypeDesc;
//   dynamic bloodGroup;
//   String peAddr1;
//   int doctorNo;
//   String doctorId;
//   String doctorName;
//   String docDegree;
//   String appointDate;
//   int shiftdtlNo;
//   String startTime;
//   String endTime;
//   int slotSl;
//   int consultationNo;
//   String consultationId;
//   String consDate;
//   int consultationFee;
//   int consultationIn;
//   int consultationOut;
//   String consTime;
//   int departmentNo;
//   String departmentName;
//   String consultationConfirmBy;
//   String consultationConfirmTime;
//   int prescriptionNo;
//   String prescriptionDateTime;
//   int isPatientIn;
//   int isPatientOut;
//   String isFeesPaid;
//   int ogNo;
//   String ogName;
//   int companyNo;
//   String companyName;
//   bool consultationNoNotNull;
//   dynamic fromDate;
//   dynamic toDate;
//   bool appointFilter;
//   bool waitingFilter;
//   bool doneFilter;
//   dynamic consultTypeNoList;
//   dynamic mstatus;
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     id: json["id"] == null ? null : json["id"],
//     appointId: json["appointId"] == null ? null : json["appointId"],
//     registrationNo: json["registrationNo"] == null ? null : json["registrationNo"],
//     hospitalId: json["hospitalId"] == null ? null : json["hospitalId"],
//     patientName: json["patientName"] == null ? null : json["patientName"],
//     phoneMobile: json["phoneMobile"] == null ? null : json["phoneMobile"],
//     dateOfBirth: json["dateOfBirth"] == null ? null : json["dateOfBirth"],
//     age: json["age"] == null ? null : json["age"],
//     ageYy: json["ageYy"] == null ? null : json["ageYy"],
//     ageMm: json["ageMm"] == null ? null : json["ageMm"],
//     ageDd: json["ageDd"] == null ? null : json["ageDd"],
//     gender: json["gender"],
//     consultTypeNo: json["consultTypeNo"] == null ? null : json["consultTypeNo"],
//     consultTypeDesc: json["consultTypeDesc"] == null ? null : json["consultTypeDesc"],
//     bloodGroup: json["bloodGroup"],
//     peAddr1: json["peAddr1"] == null ? null : json["peAddr1"],
//     doctorNo: json["doctorNo"] == null ? null : json["doctorNo"],
//     doctorId: json["doctorId"] == null ? null : json["doctorId"],
//     doctorName: json["doctorName"] == null ? null : json["doctorName"],
//     docDegree: json["docDegree"] == null ? null : json["docDegree"],
//     appointDate: json["appointDate"] == null ? null : json["appointDate"],
//     shiftdtlNo: json["shiftdtlNo"] == null ? null : json["shiftdtlNo"],
//     startTime: json["startTime"] == null ? null : json["startTime"],
//     endTime: json["endTime"] == null ? null : json["endTime"],
//     slotSl: json["slotSl"] == null ? null : json["slotSl"],
//     consultationNo: json["consultationNo"] == null ? null : json["consultationNo"],
//     consultationId: json["consultationId"] == null ? null : json["consultationId"],
//     consDate: json["consDate"] == null ? null : json["consDate"],
//     consultationFee: json["consultationFee"] == null ? null : json["consultationFee"],
//     consultationIn: json["consultationIn"] == null ? null : json["consultationIn"],
//     consultationOut: json["consultationOut"] == null ? null : json["consultationOut"],
//     consTime: json["consTime"] == null ? null : json["consTime"],
//     departmentNo: json["departmentNo"] == null ? null : json["departmentNo"],
//     departmentName: json["departmentName"] == null ? null : json["departmentName"],
//     consultationConfirmBy: json["consultationConfirmBy"] == null ? null : json["consultationConfirmBy"],
//     consultationConfirmTime: json["consultationConfirmTime"] == null ? null : json["consultationConfirmTime"],
//     prescriptionNo: json["prescriptionNo"] == null ? null : json["prescriptionNo"],
//     prescriptionDateTime: json["prescriptionDateTime"] == null ? null : json["prescriptionDateTime"],
//     isPatientIn: json["isPatientIn"] == null ? null : json["isPatientIn"],
//     isPatientOut: json["isPatientOut"] == null ? null : json["isPatientOut"],
//     isFeesPaid: json["isFeesPaid"] == null ? null : json["isFeesPaid"],
//     ogNo: json["ogNo"] == null ? null : json["ogNo"],
//     ogName: json["ogName"] == null ? null : json["ogName"],
//     companyNo: json["companyNo"] == null ? null : json["companyNo"],
//     companyName: json["companyName"] == null ? null : json["companyName"],
//     consultationNoNotNull: json["consultationNoNotNull"] == null ? null : json["consultationNoNotNull"],
//     fromDate: json["fromDate"],
//     toDate: json["toDate"],
//     appointFilter: json["appointFilter"] == null ? null : json["appointFilter"],
//     waitingFilter: json["waitingFilter"] == null ? null : json["waitingFilter"],
//     doneFilter: json["doneFilter"] == null ? null : json["doneFilter"],
//     consultTypeNoList: json["consultTypeNoList"],
//     mstatus: json["mstatus"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "appointId": appointId == null ? null : appointId,
//     "registrationNo": registrationNo == null ? null : registrationNo,
//     "hospitalId": hospitalId == null ? null : hospitalId,
//     "patientName": patientName == null ? null : patientName,
//     "phoneMobile": phoneMobile == null ? null : phoneMobile,
//     "dateOfBirth": dateOfBirth == null ? null : dateOfBirth,
//     "age": age == null ? null : age,
//     "ageYy": ageYy == null ? null : ageYy,
//     "ageMm": ageMm == null ? null : ageMm,
//     "ageDd": ageDd == null ? null : ageDd,
//     "gender": gender,
//     "consultTypeNo": consultTypeNo == null ? null : consultTypeNo,
//     "consultTypeDesc": consultTypeDesc == null ? null : consultTypeDesc,
//     "bloodGroup": bloodGroup,
//     "peAddr1": peAddr1 == null ? null : peAddr1,
//     "doctorNo": doctorNo == null ? null : doctorNo,
//     "doctorId": doctorId == null ? null : doctorId,
//     "doctorName": doctorName == null ? null : doctorName,
//     "docDegree": docDegree == null ? null : docDegree,
//     "appointDate": appointDate == null ? null : appointDate,
//     "shiftdtlNo": shiftdtlNo == null ? null : shiftdtlNo,
//     "startTime": startTime == null ? null : startTime,
//     "endTime": endTime == null ? null : endTime,
//     "slotSl": slotSl == null ? null : slotSl,
//     "consultationNo": consultationNo == null ? null : consultationNo,
//     "consultationId": consultationId == null ? null : consultationId,
//     "consDate": consDate == null ? null : consDate,
//     "consultationFee": consultationFee == null ? null : consultationFee,
//     "consultationIn": consultationIn == null ? null : consultationIn,
//     "consultationOut": consultationOut == null ? null : consultationOut,
//     "consTime": consTime == null ? null : consTime,
//     "departmentNo": departmentNo == null ? null : departmentNo,
//     "departmentName": departmentName == null ? null : departmentName,
//     "consultationConfirmBy": consultationConfirmBy == null ? null : consultationConfirmBy,
//     "consultationConfirmTime": consultationConfirmTime == null ? null : consultationConfirmTime,
//     "prescriptionNo": prescriptionNo == null ? null : prescriptionNo,
//     "prescriptionDateTime": prescriptionDateTime == null ? null : prescriptionDateTime,
//     "isPatientIn": isPatientIn == null ? null : isPatientIn,
//     "isPatientOut": isPatientOut == null ? null : isPatientOut,
//     "isFeesPaid": isFeesPaid == null ? null : isFeesPaid,
//     "ogNo": ogNo == null ? null : ogNo,
//     "ogName": ogName == null ? null : ogName,
//     "companyNo": companyNo == null ? null : companyNo,
//     "companyName": companyName == null ? null : companyName,
//     "consultationNoNotNull": consultationNoNotNull == null ? null : consultationNoNotNull,
//     "fromDate": fromDate,
//     "toDate": toDate,
//     "appointFilter": appointFilter == null ? null : appointFilter,
//     "waitingFilter": waitingFilter == null ? null : waitingFilter,
//     "doneFilter": doneFilter == null ? null : doneFilter,
//     "consultTypeNoList": consultTypeNoList,
//     "mstatus": mstatus,
//   };
// }






















// To parse this JSON data, do
//
//     final prescriptionListModel = prescriptionListModelFromJson(jsonString);

import 'dart:convert';

PrescriptionListModel prescriptionListModelFromJson(String str) => PrescriptionListModel.fromJson(json.decode(str));

String prescriptionListModelToJson(PrescriptionListModel data) => json.encode(data.toJson());

class PrescriptionListModel {
  PrescriptionListModel({
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

  factory PrescriptionListModel.fromJson(Map<String, dynamic> json) => PrescriptionListModel(
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
    recordsTotal: json["recordsTotal"]==null?0:int.parse(json["recordsTotal"]?.toString()??"0"),
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
    this.appointId,
    this.registrationNo,
    this.hospitalId,
    this.patientName,
    this.phoneMobile,
    this.dateOfBirth,
    this.age,
    this.ageYy,
    this.ageMm,
    this.ageDd,
    this.gender,
    this.consultTypeNo,
    this.consultTypeDesc,
    this.bloodGroup,
    this.peAddr1,
    this.doctorNo,
    this.doctorId,
    this.doctorName,
    this.docDegree,
    this.appointDate,
    this.shiftdtlNo,
    this.startTime,
    this.endTime,
    this.slotSl,
    this.consultationNo,
    this.consultationId,
    this.consDate,
    this.consultationFee,
    this.consultationIn,
    this.consultationOut,
    this.consTime,
    this.departmentNo,
    this.departmentName,
    this.consultationConfirmBy,
    this.consultationConfirmTime,
    this.prescriptionNo,
    this.prescriptionDateTime,
    this.isPatientIn,
    this.isPatientOut,
    this.isFeesPaid,
    this.ogNo,
    this.ogName,
    this.companyNo,
    this.companyName,
    this.consultationNoNotNull,
    this.fromDate,
    this.toDate,
    this.appointFilter,
    this.waitingFilter,
    this.doneFilter,
    this.consultTypeNoList,
    this.mstatus,
  });

  int id;
  String appointId;
  int registrationNo;
  String hospitalId;
  String patientName;
  String phoneMobile;
  String dateOfBirth;
  String age;
  int ageYy;
  int ageMm;
  int ageDd;
  dynamic gender;
  int consultTypeNo;
  String consultTypeDesc;
  dynamic bloodGroup;
  String peAddr1;
  int doctorNo;
  String doctorId;
  String doctorName;
  String docDegree;
  String appointDate;
  int shiftdtlNo;
  String startTime;
  String endTime;
  int slotSl;
  int consultationNo;
  String consultationId;
  String consDate;
  int consultationFee;
  int consultationIn;
  int consultationOut;
  String consTime;
  int departmentNo;
  String departmentName;
  String consultationConfirmBy;
  String consultationConfirmTime;
  int prescriptionNo;
  String prescriptionDateTime;
  int isPatientIn;
  int isPatientOut;
  String isFeesPaid;
  int ogNo;
  String ogName;
  int companyNo;
  String companyName;
  bool consultationNoNotNull;
  dynamic fromDate;
  dynamic toDate;
  bool appointFilter;
  bool waitingFilter;
  bool doneFilter;
  dynamic consultTypeNoList;
  dynamic mstatus;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    appointId: json["appointId"],
    registrationNo: json["registrationNo"],
    hospitalId: json["hospitalId"],
    patientName: json["patientName"],
    phoneMobile: json["phoneMobile"],
    dateOfBirth: json["dateOfBirth"],
    age: json["age"],
    ageYy: json["ageYy"],
    ageMm: json["ageMm"],
    ageDd: json["ageDd"],
    gender: json["gender"],
    consultTypeNo: json["consultTypeNo"],
    consultTypeDesc: json["consultTypeDesc"],
    bloodGroup: json["bloodGroup"],
    peAddr1: json["peAddr1"],
    doctorNo: json["doctorNo"],
    doctorId: json["doctorId"],
    doctorName: json["doctorName"],
    docDegree: json["docDegree"] == null ? null : json["docDegree"],
    appointDate: json["appointDate"],
    shiftdtlNo: json["shiftdtlNo"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    slotSl: json["slotSl"],
    consultationNo: json["consultationNo"],
    consultationId: json["consultationId"],
    consDate: json["consDate"],
    consultationFee: json["consultationFee"],
    consultationIn: json["consultationIn"],
    consultationOut: json["consultationOut"],
    consTime: json["consTime"],
    departmentNo: json["departmentNo"] == null ? null : json["departmentNo"],
    departmentName: json["departmentName"] == null ? null : json["departmentName"],
    consultationConfirmBy: json["consultationConfirmBy"],
    consultationConfirmTime: json["consultationConfirmTime"],
    prescriptionNo: json["prescriptionNo"] == null ? null : json["prescriptionNo"],
    prescriptionDateTime: json["prescriptionDateTime"] == null ? "" : json["prescriptionDateTime"],
    isPatientIn: json["isPatientIn"] == null ? null : json["isPatientIn"],
    isPatientOut: json["isPatientOut"] == null ? null : json["isPatientOut"],
    isFeesPaid: json["isFeesPaid"],
    ogNo: json["ogNo"],
    ogName: json["ogName"],
    companyNo: json["companyNo"],
    companyName: json["companyName"],
    consultationNoNotNull: json["consultationNoNotNull"],
    fromDate: json["fromDate"],
    toDate: json["toDate"],
    appointFilter: json["appointFilter"],
    waitingFilter: json["waitingFilter"],
    doneFilter: json["doneFilter"],
    consultTypeNoList: json["consultTypeNoList"],
    mstatus: json["mstatus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "appointId": appointId,
    "registrationNo": registrationNo,
    "hospitalId": hospitalId,
    "patientName": patientName,
    "phoneMobile": phoneMobile,
    "dateOfBirth": dateOfBirth,
    "age": age,
    "ageYy": ageYy,
    "ageMm": ageMm,
    "ageDd": ageDd,
    "gender": gender,
    "consultTypeNo": consultTypeNo,
    "consultTypeDesc": consultTypeDesc,
    "bloodGroup": bloodGroup,
    "peAddr1": peAddr1,
    "doctorNo": doctorNo,
    "doctorId": doctorId,
    "doctorName": doctorName,
    "docDegree": docDegree == null ? null : docDegree,
    "appointDate": appointDate,
    "shiftdtlNo": shiftdtlNo,
    "startTime": startTime,
    "endTime": endTime,
    "slotSl": slotSl,
    "consultationNo": consultationNo,
    "consultationId": consultationId,
    "consDate": consDate,
    "consultationFee": consultationFee,
    "consultationIn": consultationIn,
    "consultationOut": consultationOut,
    "consTime": consTime,
    "departmentNo": departmentNo == null ? null : departmentNo,
    "departmentName": departmentName == null ? null : departmentName,
    "consultationConfirmBy": consultationConfirmBy,
    "consultationConfirmTime": consultationConfirmTime,
    "prescriptionNo": prescriptionNo == null ? null : prescriptionNo,
    "prescriptionDateTime": prescriptionDateTime == null ? null : prescriptionDateTime,
    "isPatientIn": isPatientIn == null ? null : isPatientIn,
    "isPatientOut": isPatientOut == null ? null : isPatientOut,
    "isFeesPaid": isFeesPaid,
    "ogNo": ogNo,
    "ogName": ogName,
    "companyNo": companyNo,
    "companyName": companyName,
    "consultationNoNotNull": consultationNoNotNull,
    "fromDate": fromDate,
    "toDate": toDate,
    "appointFilter": appointFilter,
    "waitingFilter": waitingFilter,
    "doneFilter": doneFilter,
    "consultTypeNoList": consultTypeNoList,
    "mstatus": mstatus,
  };
}
