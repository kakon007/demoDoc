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

  int activeStatus;
  int foreignTraveler;
  String salutation;
  String gender;
  String firstName;
  DateTime dob;
  int ageYy;
  int ageMm;
  int ageDd;
  String mobileNo;
  String address;
  DateTime preferredSamCollDate;
  DateTime expectedRepDeliDate;
  List<DiagItemBookingDtlList> diagItemBookingDtlList;
  String patientName;
  int companyNo;
  int organizationNo;

  factory OrderConfirmationModel.fromJson(Map<String, dynamic> json) =>
      OrderConfirmationModel(
        activeStatus: json["activeStatus"],
        foreignTraveler: json["foreignTraveler"],
        salutation: json["salutation"],
        gender: json["gender"],
        firstName: json["firstName"],
        dob: DateTime.parse(json["dob"]),
        ageYy: json["ageYy"],
        ageMm: json["ageMm"],
        ageDd: json["ageDd"],
        mobileNo: json["mobileNo"],
        address: json["address"],
        preferredSamCollDate: DateTime.parse(json["preferredSamCollDate"]),
        expectedRepDeliDate: DateTime.parse(json["expectedRepDeliDate"]),
        diagItemBookingDtlList: List<DiagItemBookingDtlList>.from(
            json["diagItemBookingDtlList"]
                .map((x) => DiagItemBookingDtlList.fromJson(x))),
        patientName: json["patientName"],
        companyNo: json["companyNo"],
        organizationNo: json["organizationNo"],
      );

  Map<String, dynamic> toJson() => {
        "activeStatus": activeStatus,
        "foreignTraveler": foreignTraveler,
        "salutation": salutation,
        "gender": gender,
        "firstName": firstName,
        "dob": dob.toIso8601String(),
        "ageYy": ageYy,
        "ageMm": ageMm,
        "ageDd": ageDd,
        "mobileNo": mobileNo,
        "address": address,
        "preferredSamCollDate": preferredSamCollDate.toIso8601String(),
        "expectedRepDeliDate": expectedRepDeliDate.toIso8601String(),
        "diagItemBookingDtlList":
            List<dynamic>.from(diagItemBookingDtlList.map((x) => x.toJson())),
        "patientName": patientName,
        "companyNo": companyNo,
        "organizationNo": organizationNo,
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

  int itemNo;
  String itemId;
  String itemName;
  int itemTypeNo;
  String itemTypeName;
  int buNo;
  String buName;
  int salesPrice;
  dynamic purchasePrice;

  factory DiagItemBookingDtlList.fromJson(Map<String, dynamic> json) =>
      DiagItemBookingDtlList(
        itemNo: json["itemNo"],
        itemId: json["itemId"],
        itemName: json["itemName"],
        itemTypeNo: json["itemTypeNo"],
        itemTypeName: json["itemTypeName"],
        buNo: json["buNo"],
        buName: json["buName"],
        salesPrice: json["salesPrice"],
        purchasePrice: json["purchasePrice"],
      );

  Map<String, dynamic> toJson() => {
        "itemNo": itemNo,
        "itemId": itemId,
        "itemName": itemName,
        "itemTypeNo": itemTypeNo,
        "itemTypeName": itemTypeName,
        "buNo": buNo,
        "buName": buName,
        "salesPrice": salesPrice,
        "purchasePrice": purchasePrice,
      };
}
