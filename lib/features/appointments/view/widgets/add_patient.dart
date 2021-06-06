import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/appointment_history/view_model/upcoming_view_model.dart';
import 'package:myhealthbd_app/features/appointments/models/consultation_type_model.dart';
import 'package:myhealthbd_app/features/appointments/models/patient_type_model.dart';
import 'package:myhealthbd_app/features/appointments/view/widgets/sign_required_propmt.dart';
import 'package:myhealthbd_app/features/appointments/view_model/available_slot_view_model.dart';
import 'package:myhealthbd_app/features/appointments/view_model/book_appointment_view_model.dart';
import 'package:myhealthbd_app/features/auth/view/sign_in_screen.dart';
import 'package:myhealthbd_app/features/user_profile/models/get_family_member_model.dart';
import 'package:myhealthbd_app/features/user_profile/view/widgets/appointment_success.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/family_members_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/home.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/validator.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_Sign_prompt.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant.dart';
import 'family_members.dart';

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
  var memberBorderColor = "#EAEBED";
  var patientBorderColor = "#EAEBED";
  var consultBorderColor = "#EAEBED";
  var consultBorderColorForMe = "#EAEBED";
  var selectedMemberType = "";
  var selectedConsultationType = "";
  var selectedConsultationTypeForMe = "";
  String selectedGender = "";
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _address = TextEditingController();
  bool memberList = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var familyVm =
        Provider.of<FamilyMembersListViewModel>(context, listen: false);
    Future.delayed(Duration.zero, () async {
      var vm = Provider.of<AvailableSlotsViewModel>(context, listen: false);
      await vm.getPatType(widget.doctorNo);
      await vm.getConTypeForMe(
          widget.doctorNo, vm.patNo, widget.companyNo, widget.orgNo);
      accesstoken();
      var userVm = Provider.of<UserDetailsViewModel>(context, listen: false);
      await userVm.getData();
      familyVm.familyMembers(userVm.userDetailsList.hospitalNumber);
    });
    familyVm.memberDetail(-1, false, "", "", "", "", "", "", "", "", "");
    isClicked = false;
    pickBirthDate = DateTime.now();
    selectedConsultationType = "";
    selectedGender = "";
  }
  String _selectedMemberType;
  String _selectedConsultation;
  String _selectedConsultationForMe;

  @override
  Widget build(BuildContext context) {
    var vm2 = Provider.of<BookAppointmentViewModel>(context, listen: false);
    var imageVm = Provider.of<UserImageViewModel>(context, listen: true);
    var familyVm =
        Provider.of<FamilyMembersListViewModel>(context, listen: true);
    var vm = Provider.of<AvailableSlotsViewModel>(context, listen: false);
    var vm3 = Provider.of<UserDetailsViewModel>(context, listen: true);
    var vm4 = Provider.of<AppointmentUpcomingViewModel>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
    var memberDetail = Container(
        width: MediaQuery.of(context).size.width * .77,
        decoration: BoxDecoration(
          color: HexColor("#F0F2FF"),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(bottom: 2),
        height: width <= 330 ? 60 : 70,
     // width: MediaQuery.of(context).size.width * .78,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                familyVm.imageMem != ""
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.appbarPrimary),
                          //color: AppTheme.appbarPrimary,
                          shape: BoxShape.circle,
                        ),
                        height: width <= 330 ? 40 : 50,
                        width: width <= 330 ? 40 : 50,
                        child: Center(
                            child: imageVm.loadProfileImage(
                                familyVm.imageMem, width <= 330 ? 35 : 45, width <= 330 ? 35 : 45, 50)))
                    : Container(
                        decoration: BoxDecoration(
                          color: AppTheme.appbarPrimary,
                          shape: BoxShape.circle,
                        ),
                        height: width <= 330 ? 35 : 50,
                        width: width <= 330 ? 35 : 50,
                        child: Center(
                          child: Image.asset(
                            'assets/images/dPro.png',
                            height: width <= 330 ? 30 : 40,
                            width: width <= 330 ? 30 : 40,
                          ),
                        )),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*.4,
                      child: Text(
                        familyVm.familyMemName,
                        style: GoogleFonts.poppins(
                            color: HexColor("#0D1231"),
                            fontSize: width <= 330 ? 12 :14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      familyVm.relation,
                      style: GoogleFonts.poppins(
                        fontSize: width <= 330 ? 13 : 15,
                        color: AppTheme.appbarPrimary,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        familyVm.memberDetail(
                            -1, false, "", "", "", "", "", "", "", "", "");
                      });
                    },
                    child: Icon(
                      Icons.clear,
                      color: AppTheme.appbarPrimary,
                    )),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ));
    var membersTypeList = Row(
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45.0,
                //width: MediaQuery.of(context).size.width * .79,
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
                                  "Select Type",
                                  style: GoogleFonts.roboto(
                                      fontSize: 15, color: HexColor("#D2D2D2")),
                                ),
                                // Not necessary for Option 1
                                value: _selectedMemberType,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedMemberType = newValue;
                                    if (_selectedMemberType !=
                                        selectedMemberType) {
                                      if(_selectedMemberType=="Family Member"){
                                        memberList= true;
                                      }
                                      else{
                                        memberList= false;
                                      }
                                      selectedMemberType = newValue;
                                      _selectedConsultation = null;
                                      selectedConsultationType="";
                                      Future.delayed(Duration.zero, () async {
                                        await vm.getConType(
                                            widget.doctorNo,
                                            selectedMemberType ==
                                                    "Family Member"
                                                ? vm.patNo
                                                : vm.patOther,
                                            widget.companyNo,
                                            widget.orgNo);
                                      });
                                    }
                                  });
                                },
                                items: StringResources.memberList.map((patNo) {
                                  return DropdownMenuItem(
                                    child: Row(
                                      children: [
                                        Text(
                                          patNo,
                                          style:
                                              GoogleFonts.roboto(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    value: patNo,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .7,
                              top: 10),
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
    var membersNameList = Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              memberList = true;
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext) {
                return FamilyMembers();
              }));
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * .77,
                decoration: BoxDecoration(
                    color: familyVm.isSelected && memberList
                        ? AppTheme.appbarPrimary
                        : Colors.white,
                    border: Border.all(color: HexColor(memberBorderColor)),
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .72,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 7.0),
                          child: Text(
                            "Select your family member",
                            style: GoogleFonts.roboto(
                              color: familyVm.isSelected && memberList
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .7,
                          top: 10),
                      child: Icon(
                        familyVm.isSelected && memberList
                            ? Icons.keyboard_arrow_right_outlined
                            : Icons.keyboard_arrow_down_sharp,
                        color: HexColor("#D2D2D2"),
                      ),
                    ),
                  ],
                ),
              ),
              memberBorderColor != "#FF0000"
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
    var patientTypeForMe = Row(
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * .78,
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
    var patientTypeAdd = Row(
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * .77,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor("#EAEBED")),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 12),
                  child: Text(
                    selectedMemberType == "Family Member"
                        ? "Registered Patient"
                        : "Not Registered Patient",
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
    var consultationTypeAdd = Row(
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45.0,
                //width: MediaQuery.of(context).size.width * .8,
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
                                    //print("Con: $selectedConsultationType");
                                    vm.getFee(
                                      widget.companyNo,
                                      _selectedConsultation,
                                      widget.doctorNo,
                                      widget.orgNo,
                                      (selectedMemberType == "Family Member" &&
                                              vm.addPatient == true)
                                          ? vm.patNo
                                          : vm.patOther,
                                    );
                                  });
                                },
                                items: vm.consultType.map((consNo) {
                                  return DropdownMenuItem(
                                    child: new Text(
                                      Validator()
                                          .capitalizeTheFirstLetterOfEachWord(
                                              consNo.name),
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
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .7,
                              top: 10),
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
    var consultationTypeForMe = Row(
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45.0,
                //width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: HexColor(consultBorderColorForMe)),
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
                                value: _selectedConsultationForMe,
                                onChanged: (newValue) {
                                  setState(() {
                                    //print(newValue);
                                    _selectedConsultationForMe = newValue;
                                    selectedConsultationTypeForMe = newValue;
                                    //print("Con: $selectedConsultationType");
                                    vm.getFeeForMe(
                                      widget.companyNo,
                                      _selectedConsultationForMe,
                                      widget.doctorNo,
                                      widget.orgNo,
                                      vm.patNo,
                                    );
                                  });
                                },
                                items: vm.consultType2.map((consNo) {
                                  return DropdownMenuItem(
                                    child: new Text(
                                      Validator()
                                          .capitalizeTheFirstLetterOfEachWord(
                                              consNo.name),
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
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .7,
                              top: 10),
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
              consultBorderColorForMe != "#FF0000"
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
    var consultFeeAdd = DashedContainer(
      dashColor: HexColor("#E9ECFE"),
      borderRadius: 10.0,
      dashedLength: 10.0,
      blankLength: 2.0,
      child: Container(
        height: 90.0,
        width: MediaQuery.of(context).size.width * .5,
        child: vm.consultFee == null || selectedConsultationType == ""
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
    var consultFeeForMe = DashedContainer(
      dashColor: HexColor("#E9ECFE"),
      borderRadius: 10.0,
      dashedLength: 10.0,
      blankLength: 2.0,
      child: Container(
        height: 90.0,
        width: MediaQuery.of(context).size.width * .5,
        child: vm.consultationFeeForMe == null ||
                selectedConsultationTypeForMe == ""
            ? SizedBox()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        vm.consultationFeeForMe,
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
                  if (selectedConsultationTypeForMe != "" ||
                      (vm.forMe == false && selectedGender != "") ||
                      (selectedConsultationType != "" &&
                          (vm.forMe == false && selectedMemberType != "") &&
                          familyVm.familyMemName != '')) {
                    setState(() {
                      if (selectedGender != "") {
                        genderBorderColor = "#EAEBED";
                      }
                      if (familyVm.familyMemName != "") {
                        memberBorderColor = "#EAEBED";
                      }
                      if (selectedConsultationType != "" && vm.addPatient) {
                        consultBorderColor = "#EAEBED";
                      }
                      if (selectedConsultationTypeForMe != "" && vm.forMe) {
                        consultBorderColorForMe = "#EAEBED";
                      }
                      if (selectedMemberType != "") {
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
                        vm.forMe
                            ? vm.patNo
                            : selectedMemberType == "Family Member"
                                ? vm.patNo
                                : vm.patOther,
                        vm.forMe
                            ? selectedConsultationTypeForMe
                            : selectedConsultationType,
                        vm.forMe ? vm.consultFeeForMe : vm.consultationFee,
                        vm.forMe == false && selectedMemberType == "Others"
                            ? _name.text
                            : vm.forMe == false &&
                                    selectedMemberType == "Family Member"
                                ? familyVm.familyMemName
                                : vm3.userDetailsList.fname,
                        vm.forMe == false && selectedMemberType == "Others"
                            ? _mobile.text
                            : vm.forMe == false &&
                                    selectedMemberType == "Family Member"
                                ? familyVm.familyMemMobile
                                : vm3.userDetailsList.phoneMobile,
                        vm.forMe == false &&
                                selectedMemberType == "Family Member"
                            ? familyVm.familyMemGender
                            : vm.forMe == false &&
                                    selectedMemberType == "Others"
                                ? _selectedGender == "Male"
                                    ? "M"
                                    : _selectedGender == "Female"
                                        ? "F"
                                        : "O"
                                : vm3.userDetailsList.gender,
                        vm.forMe == false &&
                                selectedMemberType == "Family Member"
                            ? familyVm.familyMemAddress
                            : vm.forMe == false &&
                                    selectedMemberType == "Others"
                                ? _address.text
                                : vm3.userDetailsList.address,
                        vm.forMe == false &&
                                selectedMemberType == "Family Member"
                            ? familyVm.familyMemEmail
                            : vm.forMe == false &&
                                    selectedMemberType == "Others"
                                ? _email.text
                                : vm3.userDetailsList.email == null
                                    ? "ish@ish.com"
                                    : vm3.userDetailsList.email,
                        vm.forMe == false &&
                                selectedMemberType == "Family Member"
                            ? familyVm.familyMemDob
                            : vm.forMe == false &&
                                    selectedMemberType == "Others"
                                ? birthDate
                                : vm3.userDetailsList.dob,
                        "0",
                        vm.forMe == false &&
                                selectedMemberType == "Family Member"
                            ? familyVm.familyMemRegNo
                            : vm3.userDetailsList.id.toString(),
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
                      if (vm.forMe == false && selectedMemberType == "") {
                        patientBorderColor = "#FF0000";
                      }
                      if (vm.forMe == false && familyVm.familyMemName == "") {
                        memberBorderColor = "#FF0000";
                      }
                      if (selectedConsultationType == "" && vm.addPatient) {
                        consultBorderColor = "#FF0000";
                      }
                      if (selectedConsultationTypeForMe == "" && vm.forMe) {
                        consultBorderColorForMe = "#FF0000";
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
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    spaceBetween,
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          spaceBetween,
                          //vm.forMe== false ? membersList : SizedBox(),
                          vm.forMe ? patientTypeForMe : membersTypeList,
                          selectedMemberType == "Family Member" || vm.forMe || (vm.addPatient && selectedMemberType=="") || (vm.addPatient && selectedMemberType=="Others")? spaceBetween : SizedBox(),
                          vm.forMe == false &&
                                  selectedMemberType == "Family Member"
                              ? membersNameList
                              : SizedBox(),
                          familyVm.isSelected && vm.addPatient
                              ? spaceBetween
                              : SizedBox(),
                          familyVm.isSelected && vm.addPatient && memberList
                              ? memberDetail
                              : SizedBox(),
                          selectedMemberType == ""
                              ? SizedBox()
                              : vm.forMe
                                  ? SizedBox()
                                  : selectedMemberType == "Others"
                                      ? SizedBox()
                                      : spaceBetween,
                          vm.forMe == false && selectedMemberType != ""
                              ? patientTypeAdd
                              : SizedBox(),
                          selectedMemberType == ""
                              ? SizedBox()
                              : vm.forMe
                                  ? SizedBox()
                                  : selectedMemberType != ""
                                      ? spaceBetween
                                      : SizedBox(),
                          vm.forMe
                              ? consultationTypeForMe
                              : consultationTypeAdd,
                          spaceBetween,
                          vm.forMe == false && selectedMemberType == "Others"
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
                          spaceBetween,
                        ],
                      ),
                    ),
                    vm.forMe ? consultFeeForMe : consultFeeAdd,
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
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Material(
          type: MaterialType.transparency,
          child: AppointSuccess(appointDate: vm.appointDate,doctorName: vm.doctorName, hospitalName: widget.hospitalName,slotSl: vm.slotSl,startTime: vm.startTime.toString(),));
      },
    );
  }
}
