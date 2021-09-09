// To parse this JSON data, do
//
//     final orderConfirmationModel = orderConfirmationModelFromJson(jsonString);

import 'dart:convert';

OrderConfirmationModel orderConfirmationModelFromJson(String str) =>
    OrderConfirmationModel.fromJson(json.decode(str));

String orderConfirmationModelToJson(OrderConfirmationModel data) =>
    json.encode(data.toJson());

class OrderConfirmationModel {
  OrderConfirmationModel({
    this.activeStatus,
    this.foreignTraveler,
    this.salutation,
    this.gender,
    this.firstName,
    this.dob,
    this.ageYy,
    this.ageMm,
    this.ageDd,
    this.mobileNo,
    this.address,
    this.preferredSamCollDate,
    this.expectedRepDeliDate,
    this.diagItemBookingDtlList,
    this.patientName,
    this.companyNo,
    this.organizationNo,
  });

  String activeStatus;
  String foreignTraveler;
  String salutation;
  String gender;
  String firstName;
  DateTime dob;
  String ageYy;
  String ageMm;
  String ageDd;
  String mobileNo;
  String address;
  DateTime preferredSamCollDate;
  DateTime expectedRepDeliDate;
  List<DiagItemBookingDtlList> diagItemBookingDtlList;
  String patientName;
  String companyNo;
  String organizationNo;

  factory OrderConfirmationModel.fromJson(Map<String, dynamic> json) =>
      OrderConfirmationModel(
        activeStatus:
            json["activeStatus"] == null ? null : json["activeStatus"],
        foreignTraveler:
            json["foreignTraveler"] == null ? null : json["foreignTraveler"],
        salutation: json["salutation"] == null ? null : json["salutation"],
        gender: json["gender"] == null ? null : json["gender"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        ageYy: json["ageYy"] == null ? null : json["ageYy"],
        ageMm: json["ageMm"] == null ? null : json["ageMm"],
        ageDd: json["ageDd"] == null ? null : json["ageDd"],
        mobileNo: json["mobileNo"] == null ? null : json["mobileNo"],
        address: json["address"] == null ? null : json["address"],
        preferredSamCollDate: json["preferredSamCollDate"] == null
            ? null
            : DateTime.parse(json["preferredSamCollDate"]),
        expectedRepDeliDate: json["expectedRepDeliDate"] == null
            ? null
            : DateTime.parse(json["expectedRepDeliDate"]),
        diagItemBookingDtlList: json["diagItemBookingDtlList"] == null
            ? []
            : List<DiagItemBookingDtlList>.from(json["diagItemBookingDtlList"]
                .map((x) => DiagItemBookingDtlList.fromJson(x))),
        patientName: json["patientName"] == null ? null : json["patientName"],
        companyNo: json["companyNo"] == null ? null : json["companyNo"],
        organizationNo:
            json["organizationNo"] == null ? null : json["organizationNo"],
      );

  Map<String, dynamic> toJson() => {
        "activeStatus": activeStatus == null ? null : activeStatus,
        "foreignTraveler": foreignTraveler == null ? null : foreignTraveler,
        "salutation": salutation == null ? null : salutation,
        "gender": gender == null ? null : gender,
        "firstName": firstName == null ? null : firstName,
        "dob": dob == null ? null : dob.toIso8601String(),
        "ageYy": ageYy == null ? null : ageYy,
        "ageMm": ageMm == null ? null : ageMm,
        "ageDd": ageDd == null ? null : ageDd,
        "mobileNo": mobileNo == null ? null : mobileNo,
        "address": address == null ? null : address,
        "preferredSamCollDate": preferredSamCollDate == null
            ? null
            : preferredSamCollDate.toIso8601String(),
        "expectedRepDeliDate": expectedRepDeliDate == null
            ? null
            : expectedRepDeliDate.toIso8601String(),
        "diagItemBookingDtlList": diagItemBookingDtlList == null
            ? []
            : List<dynamic>.from(diagItemBookingDtlList.map((x) => x.toJson())),
        "patientName": patientName == null ? null : patientName,
        "companyNo": companyNo == null ? null : companyNo,
        "organizationNo": organizationNo == null ? null : organizationNo,
      };
}

class DiagItemBookingDtlList {
  DiagItemBookingDtlList({
    this.itemNo,
    this.itemId,
    this.itemName,
    this.itemTypeNo,
    this.itemTypeName,
    this.buNo,
    this.buName,
    this.salesPrice,
    this.purchasePrice,
  });

  String itemNo;
  String itemId;
  String itemName;
  String itemTypeNo;
  String itemTypeName;
  String buNo;
  String buName;
  String salesPrice;
  String purchasePrice;

  factory DiagItemBookingDtlList.fromJson(Map<String, dynamic> json) =>
      DiagItemBookingDtlList(
        itemNo: json["itemNo"] == null ? null : json["itemNo"],
        itemId: json["itemId"] == null ? null : json["itemId"],
        itemName: json["itemName"] == null ? null : json["itemName"],
        itemTypeNo: json["itemTypeNo"] == null ? null : json["itemTypeNo"],
        itemTypeName:
            json["itemTypeName"] == null ? null : json["itemTypeName"],
        buNo: json["buNo"] == null ? null : json["buNo"],
        buName: json["buName"] == null ? null : json["buName"],
        salesPrice: json["salesPrice"] == null ? null : json["salesPrice"],
        purchasePrice: json["purchasePrice"],
      );

  Map<String, dynamic> toJson() => {
        "itemNo": itemNo == null ? null : itemNo,
        "itemId": itemId == null ? null : itemId,
        "itemName": itemName == null ? null : itemName,
        "itemTypeNo": itemTypeNo == null ? null : itemTypeNo,
        "itemTypeName": itemTypeName == null ? null : itemTypeName,
        "buNo": buNo == null ? null : buNo,
        "buName": buName == null ? null : buName,
        "salesPrice": salesPrice == null ? null : salesPrice,
        "purchasePrice": purchasePrice,
      };
}
