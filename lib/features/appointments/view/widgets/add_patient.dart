import 'dart:convert';

import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/appointments/models/book_appointment_model.dart';
import 'package:myhealthbd_app/features/appointments/models/consultation_type_model.dart';
import 'package:myhealthbd_app/features/appointments/models/patient_type_model.dart';
import 'package:myhealthbd_app/features/appointments/view_model/available_slot_view_model.dart';
import 'package:myhealthbd_app/features/appointments/view_model/book_appointment_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/main_app/home.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class AddPatient extends StatefulWidget {
  String doctorNo;
  String companyNo;
  String orgNo;

  AddPatient({this.doctorNo, this.companyNo, this.orgNo});

  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  var accessToken;
  Future<void> accesstoken() async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
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
  bool isClicked= false;
  String _selectedGender;
  String color = "#EAEBED";
  var selectedPatientType = "";
  var selectedConsultationType = "";
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _address = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,()async{
      var vm = Provider.of<AvailableSlotsViewModel>(context, listen: false);
      vm.getPatType(widget.doctorNo);
      accesstoken();
    });
    isClicked= false;
    pickBirthDate = DateTime.now();
    selectedPatientType = "";
    selectedConsultationType = "";
  }

  String _selectedType;
  String _selectedConsultation;

  @override
  Widget build(BuildContext context) {
    var vm2 = Provider.of<BookAppointmentViewModel>(context, listen: false);
    var vm = Provider.of<AvailableSlotsViewModel>(context, listen: true);
    var vm3 = Provider.of<UserDetailsViewModel>(context);
    var height = MediaQuery.of(context).size.height;
    var spaceBetween = SizedBox(
      height: height >= 600 ? 10.0 : 5.0,
    );
    var name = SignUpFormField(
      controller: _name,
      margin: EdgeInsets.all(2),
      labelText: "Name",
      isRequired: true,
      hintText: StringResources.name,
    );
    var email = SignUpFormField(
      controller: _email,
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Email",
      hintText: StringResources.email,
    );
    var mobile = SignUpFormField(
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
                    border: Border.all(color: HexColor(color)),
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
            ],
          ),
          onTap: () {
            selectBirthDate(context);
          },
        ),
      ],
    );
    var patientType = Row(
      children: [
        GestureDetector(
          child: Column(
            children: [
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor(color)),
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
            ],
          ),
        ),
      ],
    );
    var consultationType = Row(
      children: [
        GestureDetector(
          child: Column(
            children: [
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor(color)),
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
                                        _selectedType);
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
        child: vm.consultFee == null ||
                (selectedPatientType == "" || selectedConsultationType == "")
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
    var confirmBooking = vm2.isLoading== true? CircularProgressIndicator() : Column(
      children: [
        spaceBetween,
        GestureDetector(
          onTap: () async {
            isClicked= true;
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
              selectedPatientType,
              selectedConsultationType,
              vm.consultationFee,
              vm.forMe== false? _name.text : vm3.userDetailsList.fname,
              vm.forMe== false? _mobile.text: vm3.userDetailsList.phoneMobile,
              vm.forMe== false? _selectedGender=="Male"? "M" : _selectedGender=="Female"? "F" : "O" : vm3.userDetailsList.gender,
              vm.forMe== false? _address.text : vm3.userDetailsList.address,
              vm.forMe== false? _email.text: "ish@ish.com",
              vm.forMe== false? birthDate : vm3.userDetailsList.dob,
              "0",
            );
            Future.delayed(Duration.zero,()async{

            setState(() {
              if( vm2.message==null){
                _showAlert(context);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        HomeScreen(accessToken:accessToken,)));
              }
              else{
                isClicked= false;
              }
            });
            });

          },
          child: AbsorbPointer(
            absorbing: isClicked== true? true: false,
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
        ),
        spaceBetween,
      ],
    );
    return Expanded(
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
                        patientType,
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
          child: Padding(
            padding: const EdgeInsets.only(top:150.0, bottom: 150, right: 30, left: 30),
            child: Container(
              height: 150,
              // child: SizedBox.expand(child: FlutterLogo()),
              //margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
              decoration: BoxDecoration(

                    borderRadius: BorderRadius.all(Radius.circular(20)),

                color: HexColor('#FFFFFF'),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Row(
                          children: [
                            Text("Dear ", style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 15),),
                             vm.forMe== false ? Text(_name.text+ ","): Text(vm3.userDetailsList.fname+","),
                ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text("Appointment with : ",  style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 15),),

                          ],
                        ),
                          Text(vm.doctorName,  style: GoogleFonts.poppins( fontSize: 15)),
                          SizedBox(height: 10,),
                        Text("Successfully Done!",  style: GoogleFonts.poppins( fontSize: 14, color: Colors.green)),
                      ],)
                    ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("Serial No - ", style: GoogleFonts.poppins( fontSize: 14,)),
                        Container(
                          height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                               color: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                          child: Center(child: Text(vm.slotSl,  style: GoogleFonts.poppins( fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white))),
                        )
                    ],),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("Date - ",style: GoogleFonts.poppins( fontSize: 14, fontWeight: FontWeight.w700)),
                      Text(DateFormat("dd/MM/yyyy").format(DateTime.parse(vm.appointDate
                          .toString())
                          .toLocal()) ,style: GoogleFonts.poppins( fontSize: 14)),
                      SizedBox(width: 5,),
                      Text(", Time - ", style: GoogleFonts.poppins( fontSize: 14, fontWeight: FontWeight.w500)),
                      Text( DateFormat("hh:mm:ss").format(DateTime.parse(vm.startTime
                          .toString())
                          .toLocal()), style: GoogleFonts.poppins( fontSize: 14, color: Colors.green))
                    ],),
                    SizedBox(height: 20,),
                    FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.red,
                        onPressed: (){
                          Navigator.pop(context);

                        }, child: Text("Close", style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 15),))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
