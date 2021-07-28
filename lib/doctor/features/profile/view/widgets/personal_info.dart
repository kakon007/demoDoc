import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key key}) : super(key: key);

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var spaceBetween = SizedBox(
      height: 10,
    );
    var name = SignUpFormField(
      labelText: 'Name:',
      labelLeftPadding: 0,
      labelBottomPadding: 5,
    );
    var designation = SignUpFormField(
      labelText: 'Designation:',
      labelLeftPadding: 0,
      labelBottomPadding: 5,
    );
    var mobileText=  Padding(
      padding: const EdgeInsets.only(
          left: 13.0, bottom: 5),
      child: Text(
        'Mobile:',
        style: GoogleFonts.roboto(fontSize: 12),
      ),
    );
    var mobileField=  Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(color: HexColor("#EAEBED"), width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 70,
              child: Center(child: Text('+880')),
              decoration: BoxDecoration(
                  color: AppTheme
                      .buttonInActiveColor,
                  borderRadius: BorderRadius.only(
                      topLeft:
                      Radius.circular(10),
                      bottomLeft:
                      Radius.circular(10))),
            ),
            Container(
              width: MediaQuery.of(context)
                  .size
                  .width *
                  .68,
              child: TextFormField(
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 15,
                      color: HexColor("#D2D2D2")),
                  focusedBorder:
                  OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                        HexColor("#D6DCFF"),
                        width: 1.0),
                    borderRadius:
                    BorderRadius.only(
                        bottomRight:
                        Radius.circular(
                            10),
                        topRight:
                        Radius.circular(
                            10)),
                  ),
                  contentPadding:
                  EdgeInsets.fromLTRB(
                      15.0, 25, 40.0, 0.0),
                  enabledBorder:
                  OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                        HexColor("#EAEBED"),
                        width: 1.0),
                    borderRadius:
                    BorderRadius.only(
                        bottomRight:
                        Radius.circular(
                            10),
                        topRight:
                        Radius.circular(
                            10)),
                  ),
                  focusedErrorBorder:
                  OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                        HexColor("#EAEBED"),
                        width: 1.0),
                    borderRadius:
                    BorderRadius.only(
                        bottomRight:
                        Radius.circular(
                            10),
                        topRight:
                        Radius.circular(
                            10)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.red,
                        width: 1.0),
                    borderRadius:
                    BorderRadius.only(
                        bottomRight:
                        Radius.circular(
                            10),
                        topRight:
                        Radius.circular(
                            10)),
                  ),
                  hintText: '1310000000',
                ),
              ),
            ),
          ],
        ),
      ),
    );
    var email =  SignUpFormField(
      labelText: 'Email:',
      labelLeftPadding: 0,
      labelBottomPadding: 5,
    );
    var clickHere= Padding(
      padding: const EdgeInsets.only(
          left: 10.0, bottom: 5),
      child: Row(
        children: [
          Text(
            'Change Password:    ',
            style:
            GoogleFonts.roboto(fontSize: 12),
          ),
          FlatButton(
              minWidth: MediaQuery.of(context)
                  .size
                  .width *
                  .3,
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(0)),
              color: AppTheme.buttonActiveColor,
              onPressed: () {},
              child: Text(
                'Click Here',
                style: GoogleFonts.poppins(
                    color: Colors.white),
              )),
        ],
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spaceBetween,
        spaceBetween,
        name,
        designation,
        mobileText,
       mobileField,
        spaceBetween,
        spaceBetween,
        email,
        clickHere
      ],
    );
  }
}
