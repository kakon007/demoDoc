import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
class EditProfileAlert extends StatefulWidget {
  @override
  _EditProfileAlertState createState() => _EditProfileAlertState();
}

class _EditProfileAlertState extends State<EditProfileAlert> {
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
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 6)),
    );

    if (date != null && date != pickBirthDate) {
      setState(() {
        pickBirthDate = date;
      });
    }
  }
  String _selectedGender;
  String color = "#EAEBED";

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.44;
    var name = Directionality(
        textDirection: TextDirection.ltr,
        child: Theme(
          data: new ThemeData(
            primaryColor: Colors.grey,
            //primaryColorDark: Colors.grey,
          ),
          child: Container(
            margin:  EdgeInsets.only(top: 8,bottom: 8,),
            height: 50,
            child: TextField(
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
                    borderRadius: BorderRadius.circular(10)
                ),
                  border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                      //borderSide: new BorderSide(color: Colors.teal.withOpacity(0.3))
                  ),
                  labelText: 'Name *',
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  labelStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.3)
                  )
                 ),
            ),
          ),
        )
    );
    var email = Directionality(
        textDirection: TextDirection.ltr,
        child: Theme(
          data: new ThemeData(
            primaryColor: Colors.grey,
            //primaryColorDark: Colors.grey,
          ),
          child: Container(
            margin:  EdgeInsets.only(top: 8,bottom: 8,),
            height: 50,
            child: TextField(
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
                    borderRadius: BorderRadius.circular(10)
                ),
                border: new OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  //borderSide: new BorderSide(color: Colors.teal.withOpacity(0.3))
                ),
                labelText: 'Email *',
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  labelStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.3)
                  )
              ),
            ),
          ),
        )
    );
    var mobile = Directionality(
        textDirection: TextDirection.ltr,
        child: Theme(
          data: new ThemeData(
            primaryColor: Colors.grey,
            //primaryColorDark: Colors.grey,
          ),
          child: Container(
            margin:  EdgeInsets.only(top: 8,bottom: 8,),
            height: 50,
            child: TextField(
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
                    borderRadius: BorderRadius.circular(10)
                ),
                border: new OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  //borderSide: new BorderSide(color: Colors.teal.withOpacity(0.3))
                ),
                labelText: 'Mobile *',
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  labelStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.3)
                  )
              ),
            ),
          ),
        )
    );
    var address = Directionality(
        textDirection: TextDirection.ltr,
        child: Theme(
          data: new ThemeData(
            primaryColor: Colors.grey.withOpacity(0.1),
            //primaryColorDark: Colors.grey,
          ),
          child: Container(
            margin:  EdgeInsets.only(top: 8,bottom: 8,),
            height: 50,
            child: TextField(
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
                    borderRadius: BorderRadius.circular(10)
                ),

                border: new OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  //borderSide: new BorderSide(color: Colors.teal.withOpacity(0.3))
                ),
                labelText: 'Address *',
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  labelStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.3)
                  )
              ),
            ),
          ),
        )
    );

    var gender = Row(
      children: [
        GestureDetector(
          child: Column(
            children: [
              // Container(
              //     height: 20.0,
              //     width: MediaQuery.of(context).size.width*.4,
              //     child: Padding(
              //       padding: const EdgeInsets.only(left: 15.0),
              //       child: Row(
              //         children: [
              //           Text(StringResources.gender,
              //               style: GoogleFonts.roboto(fontSize: 12)),
              //           Text(
              //             " *",
              //             style:
              //             GoogleFonts.roboto(color: HexColor("#FF5B71")),
              //           )
              //         ],
              //       ),
              //     )),
              Container(
                height: 57.0,
                width: MediaQuery.of(context).size.width*.40,
                // decoration: BoxDecoration(
                //     color: Colors.white,
                //     border: Border.all(color: HexColor(color)),
                //     borderRadius: BorderRadius.circular(10)),
                child:
                InputDecorator(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    labelText: 'Gender *',
                      labelStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.3)
                      ),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.orange, width: 1.0),
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                              width: 115,
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
                            padding: const EdgeInsets.only(left: 80.0,bottom: 100),
                            child: Icon(Icons.keyboard_arrow_down_sharp, color: HexColor("#D2D2D2"),),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    //String formatBirthDate = DateFormat("dd/MM/yyyy").format(pickBirthDate);
    var dateOfBirth = GestureDetector(
      child: Container(
        margin:  EdgeInsets.only(top: 8,bottom: 8,right: 3,left: 5),
        height: 57.0,
        width: MediaQuery.of(context).size.width*.42,
        child:
        InputDecorator(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
                borderRadius: BorderRadius.circular(10)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
                borderRadius: BorderRadius.circular(10)
            ),
            labelText: 'Brith Date *',
            labelStyle: TextStyle(
                color: Colors.grey.withOpacity(0.3)
            ),
            border: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.orange, width: 1.0),
                borderRadius: BorderRadius.circular(10)
            ),
          ),
          child:   Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  pickBirthDate == DateTime.now()
                      ? "Date of birth"
                      : "22/02/2021",
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
      ),
      onTap: () {
        selectBirthDate(context);
      },
    );
    // var newPassword = SignUpFormField(
    //   labelText: "New Password",
    //   isRequired: true,
    //   obSecure: true,
    //   controller: _password,
    //   margin: EdgeInsets.only(top: 8,bottom: 8,right: 3,left: 3),
    //   contentPadding: EdgeInsets.all(15),
    //   hintText: 'Confirm Password',
    // );
    // var confirmPassword = SignUpFormField(
    //   labelText: "Confirm Password",
    //   isRequired: true,
    //   obSecure: true,
    //   controller: _confirmPassword,
    //   margin: EdgeInsets.only(top: 8,bottom: 8,right: 3,left: 3),
    //   contentPadding: EdgeInsets.all(15),
    //   hintText: 'Confirm Password',
    // );
    return Center(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              constraints: BoxConstraints(maxWidth: 400, maxHeight: width*3),
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0,right: 25, bottom: 15),
                          child: Row(
                            children: <Widget>[
                              Container(
                                // padding: new EdgeInsets.all(10.0),
                                decoration: new BoxDecoration(
                                ),
                                child: new Text(
                                  'Change Password',
                                  style: GoogleFonts.poppins(
                                      color: AppTheme.appbarPrimary,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              name,
                              email,
                              mobile,
                              address,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  gender, dateOfBirth,

                                ],),
                              Padding(
                                padding: const EdgeInsets.only(left: 22.0, right: 22, top: 22),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: width * .8,
                                      height: width * .25,
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        textColor:  AppTheme.appbarPrimary,
                                        color: HexColor("#FFFFFF"),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(8),
                                            side: BorderSide(
                                                color: AppTheme
                                                    .appbarPrimary,
                                                width: 1)),
                                        child: Text(
                                          StringResources.cancelText,
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * .8,
                                      height: width * .25,
                                      child: FlatButton(
                                        textColor: Colors.white,
                                        onPressed: () {},
                                        color:  AppTheme.appbarPrimary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          "Save",
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ] ),
                ),
              ),
            ),
          ),
        ));
  }
}