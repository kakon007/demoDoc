import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/appointments/models/consultation_type_model.dart';
import 'package:myhealthbd_app/features/appointments/models/patient_type_model.dart';
import 'package:myhealthbd_app/features/appointments/view/widgets/sign_required_propmt.dart';
import 'package:myhealthbd_app/features/appointments/view_model/available_slot_view_model.dart';
import 'package:myhealthbd_app/features/appointments/view_model/book_appointment_view_model.dart';
import 'package:myhealthbd_app/features/auth/view/sign_in_screen.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/main_app/home.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/validator.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_Sign_prompt.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant.dart';

class AddPatient extends StatefulWidget {
  String doctorNo;
  String companyNo;
  String orgNo;
  String hospitalName;

  AddPatient({this.doctorNo, this.companyNo, this.orgNo, this.hospitalName});

  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  var accessToken;

  Future<void> accesstoken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accessToken');
  }

  final List<PatientItem> patientTypeList = List<PatientItem>();
  final List<ConsultType> consultTypeList = List<ConsultType>();
  DateTime pickBirthDate;

  Future<Null> selectBirthDate(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppTheme.appbarPrimary,
            accentColor: AppTheme.appbarPrimary,
            colorScheme: ColorScheme.light(primary: AppTheme.appbarPrimary),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (date != null && date != pickBirthDate) {
      setState(() {
        pickBirthDate = date;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  bool isClicked = false;
  String _selectedGender;
  String color = "#EAEBED";
  var genderBorderColor = "#EAEBED";
  var patientBorderColor = "#EAEBED";
  var consultBorderColor = "#EAEBED";
  var selectedPatientType = "";
  var selectedMemberType = "";
  var selectedConsultationType = "";
  String selectedGender = "";
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _address = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      var vm = Provider.of<AvailableSlotsViewModel>(context, listen: false);
      vm.getPatType(widget.doctorNo);
      vm.getConType(widget.doctorNo, "2000002", widget.companyNo, widget.orgNo);
      accesstoken();
    });
    isClicked = false;
    pickBirthDate = DateTime.now();
    selectedPatientType = "";
    selectedConsultationType = "";
    selectedGender = "";
  }

  String _selectedName;
  String _selectedType;
  String _selectedMemberType;
  String _selectedConsultation;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    var vm2 = Provider.of<BookAppointmentViewModel>(context, listen: false);
    var vm = Provider.of<AvailableSlotsViewModel>(context, listen: true);
    var vm3 = Provider.of<UserDetailsViewModel>(context);
    var height = MediaQuery.of(context).size.height;
    var spaceBetween = SizedBox(
      height: height >= 600 ? 10.0 : 5.0,
    );
    var name = SignUpFormField(
      validator: Validator().nullFieldValidate,
      controller: _name,
      margin: EdgeInsets.all(2),
      labelText: "Name",
      isRequired: true,
      hintText: StringResources.name,
    );
    var email = SignUpFormField(
      validator: Validator().validateEmail,
      controller: _email,
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Email",
      hintText: StringResources.email,
    );
    var mobile = SignUpFormField(
      validator: Validator().validatePhoneNumber,
      controller: _mobile,
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Mobile",
      hintText: StringResources.mobileNumber,
    );
    var password = SignUpFormField(
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Password",
      hintText: StringResources.password,
    );
    var confirmPassword = SignUpFormField(
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Confirm Password",
      hintText: StringResources.confirmPassword,
    );
    var address = SignUpFormField(
      validator: Validator().nullFieldValidate,
      controller: _address,
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Address",
      hintText: StringResources.address,
    );
    var gender = Row(
      children: [
        GestureDetector(
          child: Column(
            children: [
              Container(
                  height: 20.0,
                  width: MediaQuery.of(context).size.width * .4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Text(StringResources.gender,
                            style: GoogleFonts.roboto(fontSize: 12)),
                        Text(
                          " *",
                          style: GoogleFonts.roboto(color: HexColor("#FF5B71")),
                        )
                      ],
                    ),
                  )),
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * .42,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor(genderBorderColor)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            width: 120,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                iconSize: 0.0,
                                hint: Text(
                                  StringResources.gender,
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, color: HexColor("#D2D2D2")),
                                ),
                                // Not necessary for Option 1
                                value: _selectedGender,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedGender = newValue;
                                    selectedGender = newValue;
                                  });
                                },
                                items: StringResources.genderList.map((gender) {
                                  return DropdownMenuItem(
                                    child: new Text(
                                      gender,
                                      style: GoogleFonts.roboto(fontSize: 14),
                                    ),
                                    value: gender,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 120.0, top: 5),
                          child: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: HexColor("#D2D2D2"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              genderBorderColor != "#FF0000"
                  ? SizedBox(
                      width: 2,
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 0, top: 8, right: 0),
                      child: Text(
                        "This Field Is Required",
                        style: GoogleFonts.poppins(
                            color: Colors.red, fontSize: 12),
                      ),
                    )
            ],
          ),
        ),
      ],
    );
    String formatBirthDate = DateFormat("dd/MM/yyyy").format(pickBirthDate);
    String birthDate = DateFormat("yyyy-MM-dd").format(pickBirthDate);
    var dateOfBirth = Row(
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 20.0,
                  width: MediaQuery.of(context).size.width * .23,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Text(StringResources.dateOfBirth,
                            style: GoogleFonts.roboto(fontSize: 12)),
                        Text(
                          " *",
                          style: GoogleFonts.roboto(color: HexColor("#FF5B71")),
                        )
                      ],
                    ),
                  )),
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * .38,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor(color)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        pickBirthDate == DateTime.now()
                            ? "Date of birth"
                            : "$formatBirthDate",
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                          height: 18,
                          child:
                              Image.asset("assets/images/calender_icon.png")),
                    ),
                  ],
                ),
              ),
              genderBorderColor != "#FF0000"
                  ? SizedBox(
                      width: 2,
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 0, top: 8, right: 0),
                      child: Text(""),
                    )
            ],
          ),
          onTap: () {
            selectBirthDate(context);
          },
        ),
      ],
    );
    var membersList =  Row(
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor(patientBorderColor)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .72,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                iconSize: 0.0,
                                hint: Text(
                                  "Select Patient Type",
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, color: HexColor("#D2D2D2")),
                                ),
                                // Not necessary for Option 1
                                value: _selectedMemberType,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedMemberType = newValue;
                                    selectedMemberType = newValue;
                                  });
                                },
                                items: StringResources.memberList.map((patNo) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      patNo,
                                      style: GoogleFonts.roboto(fontSize: 14),
                                    ),
                                    value: patNo,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 260.0, top: 5),
                          child: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: HexColor("#D2D2D2"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              patientBorderColor != "#FF0000"
                  ? SizedBox(
                width: 2,
              )
                  : Padding(
                  padding:
                  const EdgeInsets.only(left: 16, top: 8, right: 38),
                  child: Text(
                    "This Field Is Required",
                    style: GoogleFonts.poppins(
                        color: Colors.red, fontSize: 12),
                  )),
            ],
          ),
        ),
      ],
    );
    var membersNameList =  Row(
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor(patientBorderColor)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .72,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                iconSize: 0.0,
                                hint: Text(
                                  "Select Family member",
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, color: HexColor("#D2D2D2")),
                                ),
                                // Not necessary for Option 1
                                value: _selectedName,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedName = newValue;
                                   /// selectedMemberType = newValue;
                                  });
                                },
                                items: StringResources.memberNameList.map((patNo) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      patNo,
                                      style: GoogleFonts.roboto(fontSize: 14),
                                    ),
                                    value: patNo,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 260.0, top: 5),
                          child: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: HexColor("#D2D2D2"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              patientBorderColor != "#FF0000"
                  ? SizedBox(
                width: 2,
              )
                  : Padding(
                  padding:
                  const EdgeInsets.only(left: 16, top: 8, right: 38),
                  child: Text(
                    "This Field Is Required",
                    style: GoogleFonts.poppins(
                        color: Colors.red, fontSize: 12),
                  )),
            ],
          ),
        ),
      ],
    );
    var patientType = Row(
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor("#EAEBED")),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 12),
                  child: Text(
                    "Registered Patient",
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    var patientType3 = Row(
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor(patientBorderColor)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .72,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                iconSize: 0.0,
                                hint: Text(
                                  StringResources.patientTypeText,
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, color: HexColor("#D2D2D2")),
                                ),
                                // Not necessary for Option 1
                                value: _selectedType,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedType = newValue;
                                    selectedPatientType = newValue;
                                    vm.getConType(
                                        widget.doctorNo,
                                        _selectedType,
                                        widget.companyNo,
                                        widget.orgNo);
                                  });
                                },
                                items: vm.patientItem.map((patNo) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      patNo.patientTypeName,
                                      style: GoogleFonts.roboto(fontSize: 14),
                                    ),
                                    value: patNo.patientTypeNo,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 260.0, top: 5),
                          child: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: HexColor("#D2D2D2"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              patientBorderColor != "#FF0000"
                  ? SizedBox(width: 2,)
                  : Padding(
                  padding:
                  const EdgeInsets.only(left: 16, top: 8, right: 38),
                  child: Text(
                    "This Field Is Required",
                    style: GoogleFonts.poppins(
                        color: Colors.red, fontSize: 12),
                  )),
            ],
          ),
        ),
      ],
    );
    var patientType2 = Row(
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor(patientBorderColor)),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 12),
                  child: Text(
                    "Not Registered",
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    var consultationType = Row(
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor(consultBorderColor)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .72,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                iconSize: 0.0,
                                hint: Text(
                                  StringResources.consultationTypeText,
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, color: HexColor("#D2D2D2")),
                                ),
                                // Not necessary for Option 1
                                value: _selectedConsultation,
                                onChanged: (newValue) {
                                  setState(() {
                                    //print(newValue);
                                    _selectedConsultation = newValue;
                                    selectedConsultationType = newValue;
                                    vm.getFee(
                                        widget.companyNo,
                                        _selectedConsultation,
                                        widget.doctorNo,
                                        widget.orgNo,
                                    );
                                  });
                                },
                                items: vm.consultType.map((consNo) {
                                  return DropdownMenuItem(
                                    child: new Text(
                                      consNo.name,
                                      style: GoogleFonts.roboto(fontSize: 14),
                                    ),
                                    value: consNo.no,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 260.0, top: 5),
                          child: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: HexColor("#D2D2D2"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              consultBorderColor != "#FF0000"
                  ? SizedBox(
                      width: 2,
                    )
                  : Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 8, right: 38),
                      child: Text(
                        "This Field Is Required",
                        style: GoogleFonts.poppins(
                            color: Colors.red, fontSize: 12),
                      ),
                    )
            ],
          ),
        ),
      ],
    );
    var consultFee = DashedContainer(
      dashColor: HexColor("#E9ECFE"),
      borderRadius: 10.0,
      dashedLength: 10.0,
      blankLength: 2.0,
      child: Container(
        height: 90.0,
        width: MediaQuery.of(context).size.width * .5,
        child: vm.consultFee == null || selectedConsultationType == "" || (vm.addPatient==true && selectedPatientType=='')
            ? SizedBox()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        vm.consultationFee,
                        style: GoogleFonts.poppins(
                            color: AppTheme.appbarPrimary,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text("BDT",
                              style: GoogleFonts.poppins(
                                  color: AppTheme.appbarPrimary,
                                  fontWeight: FontWeight.w500))
                        ],
                      )
                    ],
                  ),
                  Text("Consultation Fee",
                      style: GoogleFonts.poppins(
                          color: AppTheme.appbarPrimary,
                          fontWeight: FontWeight.w500))
                ],
              ),
      ),
    );
    var confirmBooking = vm2.isLoading == true
        ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppTheme.appbarPrimary),
          )
        : Column(
            children: [
              spaceBetween,
              GestureDetector(
                onTap: () async {
                  if (selectedConsultationType != "" ||
                      (vm.forMe == false && selectedGender != "" ) || (vm.forMe==false && selectedPatientType!="")) {
                    setState(() {
                      if (selectedGender != "") {
                        genderBorderColor = "#EAEBED";
                      }
                      if (selectedConsultationType != "") {
                        consultBorderColor = "#EAEBED";
                      }
                      if (selectedPatientType != "") {
                        patientBorderColor = "#EAEBED";
                      }
                    });
                    if (_formKey.currentState.validate()) {
                      await vm2.getAppointData(
                        widget.doctorNo,
                        vm.doctorName,
                        vm.appointDate,
                        vm.shiftdtlNo,
                        vm.shift,
                        vm.slotNo,
                        vm.slotSl,
                        vm.startTime,
                        vm.endTime,
                        vm.durationMin,
                        vm.extraSlot,
                        vm.slotSplited,
                        vm3.userDetailsList.ssCreatedOn,
                        vm3.userDetailsList.ssCreator.toString(),
                        vm.remarks,
                        vm.appointStatus,
                        vm.companyNo,
                        vm.ogNo,
                        vm.forMe==true?  "2000002" : selectedPatientType,
                        selectedConsultationType,
                        vm.consultationFee,
                        vm.forMe == false
                            ? _name.text
                            : vm3.userDetailsList.fname,
                        vm.forMe == false
                            ? _mobile.text
                            : vm3.userDetailsList.phoneMobile,
                        vm.forMe == false
                            ? _selectedGender == "Male"
                                ? "M"
                                : _selectedGender == "Female"
                                    ? "F"
                                    : "O"
                            : vm3.userDetailsList.gender,
                        vm.forMe == false
                            ? _address.text
                            : vm3.userDetailsList.address,
                        vm.forMe == false ? _email.text : vm3.userDetailsList.email==null? "ish@ish.com" : vm3.userDetailsList.email,
                        vm.forMe == false ? birthDate : vm3.userDetailsList.dob,
                        "0",
                      );
                      Future.delayed(Duration.zero, () async {
                        setState(() {
                          if (vm2.message == null) {
                            _showAlert(context);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        HomeScreen(
                                          accessToken: accessToken,
                                        )));
                          } else {
                            //isClicked = false;
                          }
                        });
                      });
                    }
                  } else {
                    setState(() {

                      if (vm.forMe == false && selectedGender == "") {
                        genderBorderColor = "#FF0000";
                      }
                      if (vm.forMe == false && selectedPatientType == "") {
                        patientBorderColor = "#FF0000";
                      }
                      if (selectedConsultationType == "") {
                        consultBorderColor = "#FF0000";
                      }
                    });
                  }
                },
                child: Container(
                  child: Material(
                    child: Container(
                      child: Center(
                          child: Text(
                        "Confirm Booking",
                        style: GoogleFonts.poppins(color: Colors.white),
                      )),
                      height: 45.0,
                      width: MediaQuery.of(context).size.width * .89,
                      decoration: BoxDecoration(
                          color: AppTheme.appbarPrimary,
                          border: Border.all(color: HexColor("#354391")),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              spaceBetween,
            ],
          );
    return Expanded(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    spaceBetween,
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, left: 15),
                      child: Column(
                        children: [
                          spaceBetween,
                          vm.forMe==true? patientType : patientType3,
                          spaceBetween,
                          consultationType,
                          spaceBetween,
                          vm.forMe == false
                              ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              name,
                              email,
                              mobile,
                              //password,
                              //confirmPassword,
                              address,
                              spaceBetween,
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  gender,
                                  dateOfBirth,
                                ],
                              ),
                            ],
                          )
                              : SizedBox(),
                          spaceBetween,
                          spaceBetween,
                          consultFee,
                          spaceBetween,

                          // vm.forMe== false ? membersList : SizedBox(),
                          // spaceBetween,
                          // vm.forMe==true? patientType : selectedMemberType== "Others" ? patientType2 : SizedBox(height: 0,),
                          // vm.forMe== false && selectedMemberType == "Others" ? spaceBetween : SizedBox(),
                          // vm.forMe== false && selectedMemberType == "Family Member" ?  membersNameList : SizedBox(),
                          // vm.forMe== false && selectedMemberType == "Others" ?  SizedBox() :spaceBetween,
                          // consultationType,
                          // spaceBetween,
                          // vm.forMe == false && selectedMemberType=="Others"
                          //     ? Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           name,
                          //           email,
                          //           mobile,
                          //           //password,
                          //           //confirmPassword,
                          //           address,
                          //           spaceBetween,
                          //           Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.spaceBetween,
                          //             children: [
                          //               gender,
                          //               dateOfBirth,
                          //             ],
                          //           ),
                          //         ],
                          //       )
                          //     : SizedBox(),
                          // spaceBetween,
                          // spaceBetween,
                          // consultFee,
                          // spaceBetween,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            confirmBooking
          ],
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    var vm = Provider.of<AvailableSlotsViewModel>(context, listen: false);
    var vm3 = Provider.of<UserDetailsViewModel>(context, listen: false);
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Material(
          type: MaterialType.transparency,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 4,
                      bottom: MediaQuery.of(context).size.height / 4,
                      right: 20,
                      left: 20),
                  child: Container(
                    height: 300,
                    // child: SizedBox.expand(child: FlutterLogo()),
                    //margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(begin: Alignment.topRight,
                          // end: Alignment.topCenter,
                          stops: [
                            0.2,
                            0.5,
                          ], colors: [
                        HexColor("#D6DCFF"),
                        HexColor("#FFFFFF"),
                      ]),
                      //borderRadius: 10,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 50.0, left: 50),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Booked Successfully!",
                                  style: GoogleFonts.poppins(
                                      color: HexColor("#037BB7"),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Serial No ",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "#" + vm.slotSl.toString(),
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: HexColor("#037BB7")),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Date : ",
                                      style: GoogleFonts.poppins(),
                                    ),
                                    Text(
                                      DateFormat("dd/MM/yyyy").format(
                                          DateTime.parse(
                                                  vm.appointDate.toString())
                                              .toLocal()),
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Time : ",
                                      style: GoogleFonts.poppins(),
                                    ),
                                    Text(
                                      DateFormat("hh:mm a").format(
                                          DateTime.parse(
                                                  vm.startTime.toString())
                                              .toLocal()),
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ],
                                ),
                                Text(
                                  vm.doctorName,
                                  style: GoogleFonts.poppins(
                                      color: HexColor("#037BB7"), fontSize: 13),
                                ),
                                Text(
                                  widget.hospitalName,
                                  style: GoogleFonts.poppins(
                                      color: HexColor("#037BB7"), fontSize: 13),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  " * Please proceed with the payment",
                                  style: GoogleFonts.poppins(fontSize: 13),
                                ),
                                Text(
                                  "    confirm this appointment",
                                  style: GoogleFonts.poppins(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                minWidth: 120,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                color: AppTheme.appbarPrimary,
                                child: Text(
                                  "OK",
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height > 700
                    ? MediaQuery.of(context).size.height / 3.4
                    : MediaQuery.of(context).size.height > 450 &&
                            MediaQuery.of(context).size.height <= 600
                        ? MediaQuery.of(context).size.height / 6.1
                        : MediaQuery.of(context).size.height / 3.3,
                left: MediaQuery.of(context).size.height / 4.6,
                right: MediaQuery.of(context).size.height / 4.6,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: Constants.avatarRadius,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(
                          Radius.circular(Constants.avatarRadius)),
                      child: Image.asset("assets/images/confirm.png")),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
