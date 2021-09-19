import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
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
  bool _forMe = true;
  bool _addPatient = false;
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
  int valOne = 0;
  String orgNo;
  String patientName;
  String phoneMobile;
  TextEditingController tentativeVisitDateController =
      new TextEditingController();
  String _forMeBackColor = "#141D53";
  String _forMeTextColor = "#FFFFFF";
  String _addPatientBackColor = "#00FFFFFF";
  String _addPatientTextColor = "#8389A9";
  String hospitalNumber;
  String salutation;
  String choseGender;
  String regNo;
  num subTotal = 0;
  num total = 0;
  String choseBlood;
  String choseMaritalStatus;
  var cartVM =
      Provider.of<TestItemViewModel>(appNavigator.context, listen: false);

  List<TestItem> cartList = [];
  DateTime selectedDob = DateTime.now();
  bool memberList = false;
  var selectedMemberType;
  DateTime selectedPreferredDate = DateTime.now();
  DateTime selectedExpectedDate = DateTime.now();
  DateTime selectTentativeDate = DateTime.now();
  getAppointType(bool forMe, bool addPatient) {
    _forMe = forMe;
    _addPatient = addPatient;
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
      {DateTime selectedDate, DateTime preferredDate, DateTime expectedDate}) {
    var order = OrderConfirmationModel(
        activeStatus: 1,
        address: addressController.text,
        ageDd: dayController.text,
        ageMm: monthController.text,
        ageYy: yearController.text,
        bloodGroup: choseBlood,
        companyNo: 2,
        countryOfArrival: countryArrivalController.text,
        diagItemBookingDtlList: cartList
            .map((e) => DiagItemBookingDtlList(
                buName: e.buName,
                buNo: e.buNo,
                companyName: e.companyName,
                discountAmt: e.discountAmt.toString(),
                discountPrice: e.discountPrice.toString(),
                itemId: e.itemId,
                itemName: e.itemName,
                itemNo: e.itemNo,
                itemTypeName: e.itemTypeName.toString(),
                itemTypeNo: e.itemTypeNo,
                maxDisPct: e.maxDisPct.toString(),
                promoCode: e.promoCode,
                purchasePrice: e.purchasePrice,
                salesPrice: e.salesPrice.toString()))
            .toList(),
        // discountAmt: 0,
        // dob: DateFormat("yyyy-MM-dd").format(selectedDob),
        // email: emailController.text,
        // expectedRepDeliDate: DateFormat("yyyy-MM-dd").format(selectedExpectedDate),
        // fatherName: fathersName.text,
        // fname: firstNameController.text,
        // foreignTraveler: valOne,
        // gender: choseGender,
        // hospitalNumber: hospitalNumber,
        // lname: lastNameController.text,
        // maritalStatus: choseMaritalStatus,
        // motherName: monthController.text,
        // nationalId: nidController.text,
        // netTotalAmt: cartVM.salesPrice.toString(),
        // organizationNo: orgNo,
        // passportNo: passportController.text,
        // patientName: patientName,
        // phoneMobile: mobileNumberController.text,
        // preferredSamCollDate: DateFormat("yyyy-MM-dd").format(selectedPreferredDate),
        // regNo: regNo.toString(),
        // religion: religionController.text,
        // salutation: salutation,
        // spouseName: spouseController.text,
        // tentativeVisitDate:DateFormat("yyyy-MM-dd").format(selectTentativeDate),
        // ticketNumber: ticketNumberController.text,
        // totalAmt: cartVM.salesPrice.toString()
        discountAmt: 0,
        dob: DateFormat("yyyy-MM-dd").format(selectedDob),
        email: emailController.text,
        expectedRepDeliDate:
            DateFormat("yyyy-MM-dd").format(selectedExpectedDate),
        fatherName: fathersName.text,
        fname: firstNameController.text,
        foreignTraveler: valOne,
        gender: choseGender,
        hospitalNumber: hospitalNumber == null ? "" : hospitalNumber,
        lname: lastNameController.text,
        maritalStatus: choseMaritalStatus,
        motherName: mothersName.text,
        nationalId: nidController.text,
        netTotalAmt: subTotal.toString(),
        organizationNo: orgNo,
        passportNo: passportController.text,
        patientName: patientName,
        phoneMobile: mobileNumberController.text,
        preferredSamCollDate:
            DateFormat("yyyy-MM-dd").format(selectedPreferredDate),
        regNo: regNo.toString(),
        religion: religionController.text,
        salutation: salutation,
        spouseName: spouseController.text,
        tentativeVisitDate:
            DateFormat("yyyy-MM-dd").format(selectTentativeDate),
        ticketNumber: ticketNumberController.text,
        totalAmt: subTotal.toString()
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
