import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/features/appointments/models/available_slots_model.dart';
import 'package:myhealthbd_app/features/appointments/models/consultation_type_model.dart';
import 'package:myhealthbd_app/features/appointments/models/doctor_info_model.dart';
import 'package:myhealthbd_app/features/appointments/models/patient_type_model.dart';
import 'package:myhealthbd_app/features/appointments/repositories/available_slots_repository.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/book_test/model/order_comfiramation_model.dart';
import 'package:myhealthbd_app/features/book_test/repository/order_confirmation_repository.dart';
import 'package:myhealthbd_app/features/book_test/view_model/test_item_view_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:provider/provider.dart';
import 'package:myhealthbd_app/features/book_test/model/test_item_model.dart';

class OrderConfirmViewModel extends ChangeNotifier {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController date = new TextEditingController();
  TextEditingController preferredDate = new TextEditingController();
  TextEditingController expectedDate = new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController fathersName = new TextEditingController();
  TextEditingController mothersName = new TextEditingController();
  TextEditingController bloodController = new TextEditingController();
  TextEditingController maritalStatusController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController nidController = new TextEditingController();
  TextEditingController passportController = new TextEditingController();
  TextEditingController dayController = new TextEditingController();
  TextEditingController monthController = new TextEditingController();
  TextEditingController yearController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController mobileNumberController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController countryArrivalController = new TextEditingController();
  TextEditingController ticketNumberController = new TextEditingController();
  TextEditingController spouseController = new TextEditingController();
  TextEditingController religionController = new TextEditingController();
  TextEditingController tentativeVisitDateController =
      new TextEditingController();
  bool _forMe = true;
  bool _addPatient = false;
  String _forMeBackColor = "#141D53";
  String _forMeTextColor = "#FFFFFF";
  String _addPatientBackColor = "#00FFFFFF";
  String _addPatientTextColor = "#8389A9";
  var cartVM =
      Provider.of<TestItemViewModel>(appNavigator.context, listen: false);
  List<Item> cartList = [];

  getAppointType(bool forMe, bool addPatient) {
    _forMe = forMe;
    _addPatient = addPatient;
    notifyListeners();
  }

  getButtonColor(String forMeBackColor, String forMeTextColor,
      String addPatientBackColor, String addPatientTextColor) {
    _forMeBackColor = forMeBackColor;
    _forMeTextColor = forMeTextColor;
    _addPatientBackColor = addPatientBackColor;
    _addPatientTextColor = addPatientTextColor;
    notifyListeners();
  }

  saveOrderConfirmDataData(
      {String gender,
      String salutation,
      DateTime selectedDate,
      DateTime preferredDate,
      DateTime expectedDate}) {
    var order = OrderConfirmationModel(
        activeStatus: 1,
        address: "Dhaka",
        ageDd: 4,
        ageMm: 8,
        ageYy: 27,
        bloodGroup: "A+",
        companyNo: 2,
        countryOfArrival: "444",
        diagItemBookingDtlList: cartList.map((e) => DiagItemBookingDtlList(
            buName: "CLINICAL PATHOLOGY",
            buNo: 1000006,
            companyName: null,
            discountAmt: 0,
            discountPrice: 430,
            itemId: "CLI79",
            itemName: " Urinary Protein (Spot)",
            itemNo: 11000447,
            itemTypeName: "PATHOLOGY",
            itemTypeNo: 1,
            maxDisPct: 0,
            promoCode: null,
            purchasePrice: null,
            salesPrice: 430)),
        discountAmt: 0,
        dob: "1994-01-08T04:29:30.103Z",
        email: "shakilhossain38@gmail.com",
        expectedRepDeliDate: "2021-09-06T04:16:26.000Z",
        fatherName: null,
        fname: "Shakil",
        foreignTraveler: 1,
        gender: gender,
        hospitalNumber: "MH112105000309",
        lname: null,
        maritalStatus: "U",
        motherName: null,
        nationalId: "5435454",
        netTotalAmt: 430,
        organizationNo: 2,
        passportNo: "543545345",
        patientName: "MD Shakil",
        phoneMobile: "01521494640",
        preferredSamCollDate: "2021-09-16T04:16:26.000Z",
        regNo: 1121086649,
        religion: "BUDDHIST",
        salutation: salutation,
        spouseName: "fgf",
        tentativeVisitDate: "2021-09-12T04:16:26.000Z",
        ticketNumber: "5543543",
        totalAmt: 430

        // activeStatus: "1",
        // foreignTraveler: "0",
        // gender: gender,
        // dob: selectedDate,
        // ageYy: yearController.text,
        // ageMm: monthController.text,
        // ageDd: dayController.text,
        // firstName: firstNameController.text,
        // salutation: salutation,
        // mobileNo: mobileNumberController.text,
        // preferredSamCollDate: preferredDate,
        // expectedRepDeliDate: expectedDate,
        // address: addressController.text,
        // diagItemBookingDtlList: cartList
        //     .map((e) => DiagItemBookingDtlList(
        //           buName: e.buName,
        //           buNo: e.buNo,
        //           itemId: e.itemId,
        //           itemName: e.itemName,
        //           itemNo: e.itemNo,
        //           itemTypeName: e.itemTypeName,
        //           itemTypeNo: e.itemTypeNo,
        //           purchasePrice: e.purchasePrice,
        //           salesPrice: e.salesPrice.toString(),
        //         ))
        //     .toList(),
        );
    OrderConfirmationRepository().fetchBookConfirmationType(order);
  }

  bool get forMe => _forMe;

  bool get addPatient => _addPatient;

  String get forMeBackColor => _forMeBackColor;

  String get forMeTextColor => _forMeTextColor;

  String get addPatientBackColor => _addPatientBackColor;

  String get addPatientTextColor => _addPatientTextColor;
}
