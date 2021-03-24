import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool value = false;
  String _dropDownValue;
  List<String> selectedList;
  String selectedDuration;
  String abc = "#EAEBED";
  DateTime pickedDate;
  BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(25), topRight: Radius.circular(25));
// Option 2
  String _selectedGender;

  Future<Null> selectDate(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: DateTime(2003),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (date != null && date != pickedDate) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickedDate = DateTime(2003);
  }

  @override
  Widget build(BuildContext context) {
    selectedList = StringResources.genderList;
    var height = MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width * 0.44;
    var spaceBetween = SizedBox(
      height: height >= 600 ? 10.0 : 5.0,
    );
    print(pickedDate);
    var name = SignUpFormField(
      margin: EdgeInsets.all(2),
      labelText: "Name",
      isRequired: true,
      hintText: StringResources.name,
    );
    var email = SignUpFormField(
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Email",
      hintText: StringResources.email,
    );
    var mobile = SignUpFormField(
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
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Address",
      hintText: StringResources.address,
    );
    String _formatDate = DateFormat("dd/MM/yyyy").format(pickedDate);
    var date = Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Column(
            children: [
              Container(
                  height: 20.0,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Text(StringResources.dateOfBirth,
                            style: GoogleFonts.roboto(fontSize: 12)),
                        Text(
                          " *",
                          style:
                              GoogleFonts.roboto(color: HexColor("#FF5B71")),
                        )
                      ],
                    ),
                  )),
              Container(
                height: 45.0,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor(abc)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        pickedDate == DateTime.now()
                            ? "Date of birth"
                            : "$_formatDate",
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
            selectDate(context);
          },
        ),
      ],
    );
    var gender = Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Column(
            children: [
              Container(
                  height: 20.0,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Text(StringResources.gender,
                            style: GoogleFonts.roboto(fontSize: 12)),
                        Text(
                          " *",
                          style:
                              GoogleFonts.roboto(color: HexColor("#FF5B71")),
                        )
                      ],
                    ),
                  )),
              Container(
                height: 45.0,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor(abc)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Container(
                          width: 145,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              iconSize: 0.0,
                              hint: Text(StringResources.gender, style:  GoogleFonts.roboto(fontSize: 15, color: HexColor("#D2D2D2")),), // Not necessary for Option 1
                              value: _selectedGender,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedGender = newValue;
                                });
                              },
                              items: StringResources.genderList.map((gender) {
                                return DropdownMenuItem(
                                  child: new Text(gender, style: GoogleFonts.roboto(fontSize: 14),),
                                  value: gender,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 140.0, top: 5),
                        child: Icon(Icons.keyboard_arrow_down_sharp, color: HexColor("#D2D2D2"),),
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
    var signUpButton = Material(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: AppTheme.signInSignUpColor,
      child: SizedBox(
        height: height >= 600 ? 50 : 40,
        width: MediaQuery.of(context).size.width / .2,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              StringResources.signUpButton,
              style: TextStyle(fontSize: height>=600? 18 :15, color: Colors.white),
            ),
          ),
        ),
      ),
    );
    var signIn =Column(
      children: [
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(StringResources.alreadyHaveAnAccount,
                style: TextStyle(
                    color: AppTheme.signInSignUpColor, fontWeight: FontWeight.w300)),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Text(
                StringResources.signInText,
                style: TextStyle(
                    color: AppTheme.signInSignUpColor, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),

      ],
    );
    var termsPolicy= Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 8,),
        Text(StringResources.agreeToTerms, style: GoogleFonts.roboto(color: HexColor("#8592E5"), fontSize: 14),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(StringResources.terms, style: GoogleFonts.roboto(color: AppTheme.signInSignUpColor, fontWeight: FontWeight.bold, fontSize: 13),),
          Text(" and  ",  style: GoogleFonts.roboto(color: HexColor("#8592E5"), fontSize: 13),),
          Text(StringResources.policy,style: GoogleFonts.roboto(color: AppTheme.signInSignUpColor,fontWeight: FontWeight.bold,fontSize: 13),),
        ],)
      ],
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor("#F1F9FF"),
      body: Stack(children: <Widget>[
        this._backgroundImage(),
        Scaffold(
          appBar: new AppBar(
            leading: BackButton(
                color: Colors.black
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: height >= 600
                ? EdgeInsets.only(top: 50.0)
                : EdgeInsets.only(top: 25),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)
                        ),
                        color: HexColor("#FFFFFF"),
                        boxShadow: [
                          BoxShadow(
                            color: HexColor("#0D1231").withOpacity(0.08),
                            spreadRadius: 10,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(right:15.0, left: 15),
                        child: Column(
                          children: [
                            spaceBetween,
                            Center(
                                child: Text(
                              StringResources.createAccount,
                              style: TextStyle(
                                  color: HexColor("#0D1231"),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500),
                            )),
                            spaceBetween,
                            name,
                            email,
                            mobile,
                            password,
                            confirmPassword,
                            address,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                gender,
                                date,

                              ],
                            ),
                            spaceBetween,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
               Container(
                 decoration: BoxDecoration(

                     color: Colors.white,
                     boxShadow: [
                       BoxShadow(
                         color: HexColor("#0D1231").withOpacity(0.08),
                         spreadRadius: 10,
                         blurRadius: 7,
                         offset: Offset(0, 3), // changes position of shadow
                       ),
                     ]),
                 height: height>=600? 200:150,
                 child: Padding(
                   padding: const EdgeInsets.only(right:15.0, left: 15),
                   child: Column(children: [
                     spaceBetween,
                     spaceBetween,
                     spaceBetween,
                     signUpButton,
                     spaceBetween,
                     signIn,
                     spaceBetween,
                     termsPolicy
                   ],),
                 ),
               )
              ],
            ),
          ),

        )
      ]),
    );
  }

  Widget _backgroundImage() {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * .09,
          left: MediaQuery.of(context).size.width * .27,
          child: Container(
            height:  MediaQuery.of(context).size.height >=600? 200 :60,
            alignment: Alignment(0, -0.75),
            child: FadeInImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("assets/images/myhealth.png"),
              placeholder: AssetImage(''),
            ),
          ),
        )
      ],
    );
  }
}
