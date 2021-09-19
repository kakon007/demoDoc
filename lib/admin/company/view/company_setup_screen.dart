import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/admin/company/view/add_new_company_screen.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:myhealthbd_app/root.dart';

class CompanySetupScreen extends StatefulWidget {
  @override
  _CompanySetupScreenState createState() => _CompanySetupScreenState();
}

class _CompanySetupScreenState extends State<CompanySetupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Company Setup"),
        backgroundColor: Color(0xff354291),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(12.0),
                  bottomRight: const Radius.circular(12.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SignUpFormField(
                        onChanged: (value) {
                          // hospitalSearch(value);
                        },
                        textFieldKey: Key('hospitalSearchFieldKey'),
                        focusBorderColor: "#8592E5",
                        // controller: hospitalController,
                        borderRadius: 30,
                        minimizeBottomPadding: true,
                        // hintSize: isTablet ? 17 : 12,
                        hintText: "Search Company",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(
                            Icons.search_rounded,
                            //color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Company id. 01',
                                style: TextStyle(color: Color(0xffFFB14A)),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  FontAwesomeIcons.equals,
                                  color: AppTheme.buttonActiveColor,
                                ),
                                // icon: Text(
                                //   "=",
                                //   style: TextStyle(
                                //       color: AppTheme.buttonActiveColor,
                                //       fontSize: 25),
                                // )
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Aalok Healthcare ltd(branch Mirpur 1)',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 12,
                                      color: Colors.green,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Active',
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 11),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 40.0),
                            child: Text(
                              'Address: House 76 (Level 1) Road 4, Block B Niketan, Gulshan 1 Dhaka 1212, Bangladesh',
                              style: TextStyle(),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        bool isTablet =
                                            Responsive.isTablet(context);
                                        return Material(
                                          type: MaterialType.transparency,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Material(
                                              type: MaterialType.transparency,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height: 300,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    //color: Colors.red,
                                                    child: Center(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 0,
                                                                left: 20,
                                                                right: 20),
                                                        child: Container(
                                                          height: 180,
                                                          width: isTablet
                                                              ? 450
                                                              : 350,
                                                          decoration:
                                                              BoxDecoration(
                                                                  //color: HexColor('#f9f2f3'),
                                                                  gradient:
                                                                      LinearGradient(
                                                                    begin: Alignment
                                                                        .topCenter,
                                                                    end: Alignment
                                                                        .bottomCenter,
                                                                    colors: [
                                                                      Color(
                                                                          0xfffdf0f2),
                                                                      Color(
                                                                          0xffFFFFFF)
                                                                    ],
                                                                    tileMode:
                                                                        TileMode
                                                                            .repeated,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 50.0),
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          10.0,
                                                                      right:
                                                                          10),
                                                                  child:
                                                                      RichText(
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    text:
                                                                        TextSpan(
                                                                      style: GoogleFonts
                                                                          .poppins(
                                                                        fontSize: isTablet
                                                                            ? 18
                                                                            : 16.0,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                      children: <
                                                                          TextSpan>[
                                                                        TextSpan(
                                                                            text:
                                                                                'Are you sure want to delete this company?'),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      isTablet
                                                                          ? 25
                                                                          : 15,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          Material(
                                                                        elevation:
                                                                            0,
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                            side: BorderSide(color: Color(0xff354291))),
                                                                        color: Colors
                                                                            .white,
                                                                        child:
                                                                            SizedBox(
                                                                          height:
                                                                              50,
                                                                          width: isTablet
                                                                              ? 170
                                                                              : 120,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "Cancel",
                                                                              style: GoogleFonts.poppins(color: Color(0xff354291), fontWeight: FontWeight.w500, fontSize: isTablet ? 18 : 15),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 15,
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () async {},
                                                                      child:
                                                                          Material(
                                                                        elevation:
                                                                            0,
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10)),
                                                                        color: Color(
                                                                            0xff354291),
                                                                        child:
                                                                            SizedBox(
                                                                          height:
                                                                              50,
                                                                          width: isTablet
                                                                              ? 170
                                                                              : 120,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "Delete",
                                                                              style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: isTablet ? 18 : 15),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 210,
                                                    //top: MediaQuery.of(context).size.height / 1.8,
                                                    left: 100,
                                                    right: 100,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 30,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    60)),
                                                        // child: Image.asset(
                                                        //   "assets/icons/sign_in_prompt.png",
                                                        //   height: 90,
                                                        //   width: 90,
                                                        // ),
                                                        child: Icon(
                                                          Icons
                                                              .delete_sweep_rounded,
                                                          color:
                                                              Color(0xffFF8585),
                                                          size: 30,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xffFF8585),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    )),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              FlatButton(
                                  height: 40,
                                  minWidth:
                                      MediaQuery.of(context).size.width * .3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  color: AppTheme.buttonActiveColor,
                                  onPressed: () async {},
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Edit',
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Company id. 01',
                                style: TextStyle(color: Color(0xffFFB14A)),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  FontAwesomeIcons.equals,
                                  color: AppTheme.buttonActiveColor,
                                ),
                                // icon: Text(
                                //   "=",
                                //   style: TextStyle(
                                //       color: AppTheme.buttonActiveColor,
                                //       fontSize: 25),
                                // )
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Aalok Healthcare ltd(branch Mirpur 1)',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 12,
                                      color: Colors.green,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Active',
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 11),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 40.0),
                            child: Text(
                              'Address: House 76 (Level 1) Road 4, Block B Niketan, Gulshan 1 Dhaka 1212, Bangladesh',
                              style: TextStyle(),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Color(0xffFF8585),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: 30,
                              ),
                              FlatButton(
                                  height: 40,
                                  minWidth:
                                      MediaQuery.of(context).size.width * .3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  color: AppTheme.buttonActiveColor,
                                  onPressed: () async {},
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Edit',
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddCompanyScreen()));
        },
        child: Container(
          height: 50,
          width: 120,
          decoration: BoxDecoration(
            color: AppTheme.buttonActiveColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add New",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.add,
                size: 25,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
