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
    this.address,
    this.ageDd,
    this.ageMm,
    this.ageYy,
    this.bloodGroup,
    this.companyNo,
    this.countryOfArrival,
    this.diagItemBookingDtlList,
    this.discountAmt,
    this.dob,
    this.email,
    this.expectedRepDeliDate,
    this.fatherName,
    this.fname,
    this.foreignTraveler,
    this.gender,
    this.hospitalNumber,
    this.lname,
    this.maritalStatus,
    this.motherName,
    this.nationalId,
    this.netTotalAmt,
    this.organizationNo,
    this.passportNo,
    this.patientName,
    this.phoneMobile,
    this.preferredSamCollDate,
    this.regNo,
    this.religion,
    this.salutation,
    this.spouseName,
    this.tentativeVisitDate,
    this.ticketNumber,
    this.totalAmt,
  });

  int activeStatus;
  String address;
  int ageDd;
  int ageMm;
  int ageYy;
  String bloodGroup;
  int companyNo;
  String countryOfArrival;
  List<DiagItemBookingDtlList> diagItemBookingDtlList;
  int discountAmt;
  String dob;
  String email;
  String expectedRepDeliDate;
  dynamic fatherName;
  String fname;
  int foreignTraveler;
  String gender;
  String hospitalNumber;
  dynamic lname;
  String maritalStatus;
  dynamic motherName;
  String nationalId;
  int netTotalAmt;
  int organizationNo;
  String passportNo;
  String patientName;
  String phoneMobile;
  String preferredSamCollDate;
  int regNo;
  String religion;
  String salutation;
  String spouseName;
  String tentativeVisitDate;
  String ticketNumber;
  int totalAmt;

  factory OrderConfirmationModel.fromJson(Map<String, dynamic> json) =>
      OrderConfirmationModel(
        activeStatus:
            json["activeStatus"] == null ? null : json["activeStatus"],
        address: json["address"] == null ? null : json["address"],
        ageDd: json["ageDd"] == null ? null : json["ageDd"],
        ageMm: json["ageMm"] == null ? null : json["ageMm"],
        ageYy: json["ageYy"] == null ? null : json["ageYy"],
        bloodGroup: json["bloodGroup"] == null ? null : json["bloodGroup"],
        companyNo: json["companyNo"] == null ? null : json["companyNo"],
        countryOfArrival:
            json["countryOfArrival"] == null ? null : json["countryOfArrival"],
        diagItemBookingDtlList: json["diagItemBookingDtlList"] == null
            ? []
            : List<DiagItemBookingDtlList>.from(json["diagItemBookingDtlList"]
                .map((x) => DiagItemBookingDtlList.fromJson(x))),
        discountAmt: json["discountAmt"] == null ? null : json["discountAmt"],
        dob: json["dob"] == null ? null : json["dob"],
        email: json["email"] == null ? null : json["email"],
        expectedRepDeliDate: json["expectedRepDeliDate"] == null
            ? null
            : json["expectedRepDeliDate"],
        fatherName: json["fatherName"],
        fname: json["fname"] == null ? null : json["fname"],
        foreignTraveler:
            json["foreignTraveler"] == null ? null : json["foreignTraveler"],
        gender: json["gender"] == null ? null : json["gender"],
        hospitalNumber:
            json["hospitalNumber"] == null ? null : json["hospitalNumber"],
        lname: json["lname"],
        maritalStatus:
            json["maritalStatus"] == null ? null : json["maritalStatus"],
        motherName: json["motherName"],
        nationalId: json["nationalId"] == null ? null : json["nationalId"],
        netTotalAmt: json["netTotalAmt"] == null ? null : json["netTotalAmt"],
        organizationNo:
            json["organizationNo"] == null ? null : json["organizationNo"],
        passportNo: json["passportNo"] == null ? null : json["passportNo"],
        patientName: json["patientName"] == null ? null : json["patientName"],
        phoneMobile: json["phoneMobile"] == null ? null : json["phoneMobile"],
        preferredSamCollDate: json["preferredSamCollDate"] == null
            ? null
            : json["preferredSamCollDate"],
        regNo: json["regNo"] == null ? null : json["regNo"],
        religion: json["religion"] == null ? null : json["religion"],
        salutation: json["salutation"] == null ? null : json["salutation"],
        spouseName: json["spouseName"] == null ? null : json["spouseName"],
        tentativeVisitDate: json["tentativeVisitDate"] == null
            ? null
            : json["tentativeVisitDate"],
        ticketNumber:
            json["ticketNumber"] == null ? null : json["ticketNumber"],
        totalAmt: json["totalAmt"] == null ? null : json["totalAmt"],
      );

  Map<String, dynamic> toJson() => {
        "activeStatus": activeStatus == null ? null : activeStatus,
        "address": address == null ? null : address,
        "ageDd": ageDd == null ? null : ageDd,
        "ageMm": ageMm == null ? null : ageMm,
        "ageYy": ageYy == null ? null : ageYy,
        "bloodGroup": bloodGroup == null ? null : bloodGroup,
        "companyNo": companyNo == null ? null : companyNo,
        "countryOfArrival": countryOfArrival == null ? null : countryOfArrival,
        "diagItemBookingDtlList": diagItemBookingDtlList == null
            ? []
            : List<dynamic>.from(diagItemBookingDtlList.map((x) => x.toJson())),
        "discountAmt": discountAmt == null ? null : discountAmt,
        "dob": dob == null ? null : dob,
        "email": email == null ? null : email,
        "expectedRepDeliDate":
            expectedRepDeliDate == null ? null : expectedRepDeliDate,
        "fatherName": fatherName,
        "fname": fname == null ? null : fname,
        "foreignTraveler": foreignTraveler == null ? null : foreignTraveler,
        "gender": gender == null ? null : gender,
        "hospitalNumber": hospitalNumber == null ? null : hospitalNumber,
        "lname": lname,
        "maritalStatus": maritalStatus == null ? null : maritalStatus,
        "motherName": motherName,
        "nationalId": nationalId == null ? null : nationalId,
        "netTotalAmt": netTotalAmt == null ? null : netTotalAmt,
        "organizationNo": organizationNo == null ? null : organizationNo,
        "passportNo": passportNo == null ? null : passportNo,
        "patientName": patientName == null ? null : patientName,
        "phoneMobile": phoneMobile == null ? null : phoneMobile,
        "preferredSamCollDate":
            preferredSamCollDate == null ? null : preferredSamCollDate,
        "regNo": regNo == null ? null : regNo,
        "religion": religion == null ? null : religion,
        "salutation": salutation == null ? null : salutation,
        "spouseName": spouseName == null ? null : spouseName,
        "tentativeVisitDate":
            tentativeVisitDate == null ? null : tentativeVisitDate,
        "ticketNumber": ticketNumber == null ? null : ticketNumber,
        "totalAmt": totalAmt == null ? null : totalAmt,
      };
}

class DiagItemBookingDtlList {
  DiagItemBookingDtlList({
    this.buName,
    this.buNo,
    this.companyName,
    this.discountAmt,
    this.discountPrice,
    this.itemId,
    this.itemName,
    this.itemNo,
    this.itemTypeName,
    this.itemTypeNo,
    this.maxDisPct,
    this.promoCode,
    this.purchasePrice,
    this.salesPrice,
  });

  String buName;
  int buNo;
  dynamic companyName;
  int discountAmt;
  int discountPrice;
  String itemId;
  String itemName;
  int itemNo;
  String itemTypeName;
  int itemTypeNo;
  int maxDisPct;
  dynamic promoCode;
  dynamic purchasePrice;
  int salesPrice;

  factory DiagItemBookingDtlList.fromJson(Map<String, dynamic> json) =>
      DiagItemBookingDtlList(
        buName: json["buName"] == null ? null : json["buName"],
        buNo: json["buNo"] == null ? null : json["buNo"],
        companyName: json["companyName"],
        discountAmt: json["discountAmt"] == null ? null : json["discountAmt"],
        discountPrice:
            json["discountPrice"] == null ? null : json["discountPrice"],
        itemId: json["itemId"] == null ? null : json["itemId"],
        itemName: json["itemName"] == null ? null : json["itemName"],
        itemNo: json["itemNo"] == null ? null : json["itemNo"],
        itemTypeName:
            json["itemTypeName"] == null ? null : json["itemTypeName"],
        itemTypeNo: json["itemTypeNo"] == null ? null : json["itemTypeNo"],
        maxDisPct: json["maxDisPct"] == null ? null : json["maxDisPct"],
        promoCode: json["promoCode"],
        purchasePrice: json["purchasePrice"],
        salesPrice: json["salesPrice"] == null ? null : json["salesPrice"],
      );

  Map<String, dynamic> toJson() => {
        "buName": buName == null ? null : buName,
        "buNo": buNo == null ? null : buNo,
        "companyName": companyName,
        "discountAmt": discountAmt == null ? null : discountAmt,
        "discountPrice": discountPrice == null ? null : discountPrice,
        "itemId": itemId == null ? null : itemId,
        "itemName": itemName == null ? null : itemName,
        "itemNo": itemNo == null ? null : itemNo,
        "itemTypeName": itemTypeName == null ? null : itemTypeName,
        "itemTypeNo": itemTypeNo == null ? null : itemTypeNo,
        "maxDisPct": maxDisPct == null ? null : maxDisPct,
        "promoCode": promoCode,
        "purchasePrice": purchasePrice,
        "salesPrice": salesPrice == null ? null : salesPrice,
      };
}

// // To parse this JSON data, do
// //
// //     final orderConfirmationModel = orderConfirmationModelFromJson(jsonString);
//
// import 'dart:convert';
//
// OrderConfirmationModel orderConfirmationModelFromJson(String str) =>
//     OrderConfirmationModel.fromJson(json.decode(str));
//
// String orderConfirmationModelToJson(OrderConfirmationModel data) =>
//     json.encode(data.toJson());
//
// class OrderConfirmationModel {
//   OrderConfirmationModel({
//     this.activeStatus,
//     this.foreignTraveler,
//     this.salutation,
//     this.gender,
//     this.firstName,
//     this.dob,
//     this.ageYy,
//     this.ageMm,
//     this.ageDd,
//     this.mobileNo,
//     this.address,
//     this.preferredSamCollDate,
//     this.expectedRepDeliDate,
//     this.diagItemBookingDtlList,
//     this.patientName,
//     this.companyNo,
//     this.organizationNo,
//   });
//
//   String activeStatus;
//   String foreignTraveler;
//   String salutation;
//   String gender;
//   String firstName;
//   DateTime dob;
//   String ageYy;
//   String ageMm;
//   String ageDd;
//   String mobileNo;
//   String address;
//   DateTime preferredSamCollDate;
//   DateTime expectedRepDeliDate;
//   List<DiagItemBookingDtlList> diagItemBookingDtlList;
//   String patientName;
//   String companyNo;
//   String organizationNo;
//
//   factory OrderConfirmationModel.fromJson(Map<String, dynamic> json) =>
//       OrderConfirmationModel(
//         activeStatus:
//             json["activeStatus"] == null ? null : json["activeStatus"],
//         foreignTraveler:
//             json["foreignTraveler"] == null ? null : json["foreignTraveler"],
//         salutation: json["salutation"] == null ? null : json["salutation"],
//         gender: json["gender"] == null ? null : json["gender"],
//         firstName: json["firstName"] == null ? null : json["firstName"],
//         dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
//         ageYy: json["ageYy"] == null ? null : json["ageYy"],
//         ageMm: json["ageMm"] == null ? null : json["ageMm"],
//         ageDd: json["ageDd"] == null ? null : json["ageDd"],
//         mobileNo: json["mobileNo"] == null ? null : json["mobileNo"],
//         address: json["address"] == null ? null : json["address"],
//         preferredSamCollDate: json["preferredSamCollDate"] == null
//             ? null
//             : DateTime.parse(json["preferredSamCollDate"]),
//         expectedRepDeliDate: json["expectedRepDeliDate"] == null
//             ? null
//             : DateTime.parse(json["expectedRepDeliDate"]),
//         diagItemBookingDtlList: json["diagItemBookingDtlList"] == null
//             ? []
//             : List<DiagItemBookingDtlList>.from(json["diagItemBookingDtlList"]
//                 .map((x) => DiagItemBookingDtlList.fromJson(x))),
//         patientName: json["patientName"] == null ? null : json["patientName"],
//         companyNo: json["companyNo"] == null ? null : json["companyNo"],
//         organizationNo:
//             json["organizationNo"] == null ? null : json["organizationNo"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "activeStatus": activeStatus == null ? null : activeStatus,
//         "foreignTraveler": foreignTraveler == null ? null : foreignTraveler,
//         "salutation": salutation == null ? null : salutation,
//         "gender": gender == null ? null : gender,
//         "firstName": firstName == null ? null : firstName,
//         "dob": dob == null ? null : dob.toIso8601String(),
//         "ageYy": ageYy == null ? null : ageYy,
//         "ageMm": ageMm == null ? null : ageMm,
//         "ageDd": ageDd == null ? null : ageDd,
//         "mobileNo": mobileNo == null ? null : mobileNo,
//         "address": address == null ? null : address,
//         "preferredSamCollDate": preferredSamCollDate == null
//             ? null
//             : preferredSamCollDate.toIso8601String(),
//         "expectedRepDeliDate": expectedRepDeliDate == null
//             ? null
//             : expectedRepDeliDate.toIso8601String(),
//         "diagItemBookingDtlList": diagItemBookingDtlList == null
//             ? []
//             : List<dynamic>.from(diagItemBookingDtlList.map((x) => x.toJson())),
//         "patientName": patientName == null ? null : patientName,
//         "companyNo": companyNo == null ? null : companyNo,
//         "organizationNo": organizationNo == null ? null : organizationNo,
//       };
// }
//
// class DiagItemBookingDtlList {
//   DiagItemBookingDtlList({
//     this.itemNo,
//     this.itemId,
//     this.itemName,
//     this.itemTypeNo,
//     this.itemTypeName,
//     this.buNo,
//     this.buName,
//     this.salesPrice,
//     this.purchasePrice,
//   });
//
//   String itemNo;
//   String itemId;
//   String itemName;
//   String itemTypeNo;
//   String itemTypeName;
//   String buNo;
//   String buName;
//   String salesPrice;
//   String purchasePrice;
//
//   factory DiagItemBookingDtlList.fromJson(Map<String, dynamic> json) =>
//       DiagItemBookingDtlList(
//         itemNo: json["itemNo"] == null ? null : json["itemNo"],
//         itemId: json["itemId"] == null ? null : json["itemId"],
//         itemName: json["itemName"] == null ? null : json["itemName"],
//         itemTypeNo: json["itemTypeNo"] == null ? null : json["itemTypeNo"],
//         itemTypeName:
//             json["itemTypeName"] == null ? null : json["itemTypeName"],
//         buNo: json["buNo"] == null ? null : json["buNo"],
//         buName: json["buName"] == null ? null : json["buName"],
//         salesPrice: json["salesPrice"] == null ? null : json["salesPrice"],
//         purchasePrice: json["purchasePrice"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "itemNo": itemNo == null ? null : itemNo,
//         "itemId": itemId == null ? null : itemId,
//         "itemName": itemName == null ? null : itemName,
//         "itemTypeNo": itemTypeNo == null ? null : itemTypeNo,
//         "itemTypeName": itemTypeName == null ? null : itemTypeName,
//         "buNo": buNo == null ? null : buNo,
//         "buName": buName == null ? null : buName,
//         "salesPrice": salesPrice == null ? null : salesPrice,
//         "purchasePrice": purchasePrice,
//       };
// }
